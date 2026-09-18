<?php

namespace App\Services;

use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class FileCompressionService
{
    /**
     * Maximum dimension (width/height) for general images in pixels.
     */
    protected const DEFAULT_MAX_DIMENSION = 1920;

    /**
     * Maximum dimension for avatar / profile photos in pixels.
     */
    protected const AVATAR_MAX_DIMENSION = 1000;

    /**
     * Compress an uploaded file (Image or PDF) and store it in the specified disk directory.
     *
     * @param UploadedFile $file
     * @param string $directory Directory inside the disk (e.g. 'employees/documents/1')
     * @param string $disk Disk name ('local' or 'public')
     * @param int|null $maxDimension Custom max image dimension in pixels
     * @return array Metadata of stored file
     */
    public function compressAndStore(
        UploadedFile $file,
        string $directory,
        string $disk = 'local',
        ?int $maxDimension = null
    ): array {
        $originalName = $file->getClientOriginalName();
        $mimeType = $file->getMimeType() ?? 'application/octet-stream';
        $originalSize = $file->getSize();
        $extension = strtolower($file->getClientOriginalExtension());

        $tempOptimizedPath = null;
        $isCompressed = false;

        try {
            if ($this->isImage($mimeType, $extension)) {
                $maxDim = $maxDimension ?? self::DEFAULT_MAX_DIMENSION;
                $tempOptimizedPath = $this->optimizeImage($file->getRealPath(), $mimeType, $extension, $maxDim);
            } elseif ($this->isPdf($mimeType, $extension)) {
                $tempOptimizedPath = $this->optimizePdf($file->getRealPath());
            }
        } catch (\Throwable $e) {
            report($e);
            $tempOptimizedPath = null;
        }

        $finalSize = $originalSize;
        $filename = Str::random(40) . '.' . ($extension ?: 'bin');

        if ($tempOptimizedPath && file_exists($tempOptimizedPath)) {
            $optimizedSize = filesize($tempOptimizedPath);
            if ($optimizedSize > 0 && $optimizedSize < $originalSize) {
                $targetPath = rtrim($directory, '/') . '/' . $filename;
                Storage::disk($disk)->put($targetPath, file_get_contents($tempOptimizedPath));
                $finalSize = $optimizedSize;
                $isCompressed = true;
                @unlink($tempOptimizedPath);
            } else {
                @unlink($tempOptimizedPath);
                $targetPath = $file->storeAs($directory, $filename, $disk);
            }
        } else {
            $targetPath = $file->storeAs($directory, $filename, $disk);
        }

        $savedBytes = max(0, $originalSize - $finalSize);
        $savedPercentage = $originalSize > 0 ? round(($savedBytes / $originalSize) * 100, 1) : 0;

        return [
            'file_path'        => $targetPath,
            'file_name'        => $originalName,
            'file_size'        => $this->formatFileSize($finalSize),
            'raw_size'         => $finalSize,
            'original_size'    => $this->formatFileSize($originalSize),
            'original_bytes'   => $originalSize,
            'file_type'        => $mimeType,
            'is_compressed'    => $isCompressed,
            'saved_percentage' => $savedPercentage,
        ];
    }

    /**
     * Check if mime/extension is an image supported by GD.
     */
    public function isImage(string $mime, string $extension): bool
    {
        $imageMimes = ['image/jpeg', 'image/jpg', 'image/png', 'image/webp', 'image/gif'];
        $imageExts  = ['jpg', 'jpeg', 'png', 'webp', 'gif'];

        return in_array(strtolower($mime), $imageMimes, true) || in_array(strtolower($extension), $imageExts, true);
    }

    /**
     * Check if mime/extension is a PDF.
     */
    public function isPdf(string $mime, string $extension): bool
    {
        return str_contains(strtolower($mime), 'pdf') || strtolower($extension) === 'pdf';
    }

    /**
     * Optimize an image using PHP GD.
     */
    public function optimizeImage(string $sourcePath, string $mime, string $extension, int $maxDimension): ?string
    {
        if (!extension_loaded('gd')) {
            return null;
        }

        $imageInfo = @getimagesize($sourcePath);
        if (!$imageInfo) {
            return null;
        }

        [$width, $height, $imageType] = $imageInfo;

        // Load image resource based on type
        $sourceImage = null;
        switch ($imageType) {
            case IMAGETYPE_JPEG:
                $sourceImage = @imagecreatefromjpeg($sourcePath);
                break;
            case IMAGETYPE_PNG:
                $sourceImage = @imagecreatefrompng($sourcePath);
                break;
            case IMAGETYPE_WEBP:
                if (function_exists('imagecreatefromwebp')) {
                    $sourceImage = @imagecreatefromwebp($sourcePath);
                }
                break;
            case IMAGETYPE_GIF:
                $sourceImage = @imagecreatefromgif($sourcePath);
                break;
        }

        if (!$sourceImage) {
            return null;
        }

        // Auto-orient JPEG based on EXIF orientation if available
        if ($imageType === IMAGETYPE_JPEG && function_exists('exif_read_data')) {
            $exif = @exif_read_data($sourcePath);
            if (!empty($exif['Orientation'])) {
                switch ($exif['Orientation']) {
                    case 3:
                        $rotated = imagerotate($sourceImage, 180, 0);
                        if ($rotated) {
                            imagedestroy($sourceImage);
                            $sourceImage = $rotated;
                        }
                        break;
                    case 6:
                        $rotated = imagerotate($sourceImage, -90, 0);
                        if ($rotated) {
                            imagedestroy($sourceImage);
                            $sourceImage = $rotated;
                            $tmp = $width;
                            $width = $height;
                            $height = $tmp;
                        }
                        break;
                    case 8:
                        $rotated = imagerotate($sourceImage, 90, 0);
                        if ($rotated) {
                            imagedestroy($sourceImage);
                            $sourceImage = $rotated;
                            $tmp = $width;
                            $width = $height;
                            $height = $tmp;
                        }
                        break;
                }
            }
        }

        // Calculate proportional target dimensions
        $targetWidth = $width;
        $targetHeight = $height;

        if ($width > $maxDimension || $height > $maxDimension) {
            if ($width >= $height) {
                $targetWidth = $maxDimension;
                $targetHeight = (int) round(($height / $width) * $maxDimension);
            } else {
                $targetHeight = $maxDimension;
                $targetWidth = (int) round(($width / $height) * $maxDimension);
            }
        }

        // Create canvas
        $targetImage = imagecreatetruecolor($targetWidth, $targetHeight);

        // Preserve alpha for PNG/WebP/GIF
        if (in_array($imageType, [IMAGETYPE_PNG, IMAGETYPE_WEBP, IMAGETYPE_GIF], true)) {
            imagealphablending($targetImage, false);
            imagesavealpha($targetImage, true);
            $transparent = imagecolorallocatealpha($targetImage, 255, 255, 255, 127);
            imagefilledrectangle($targetImage, 0, 0, $targetWidth, $targetHeight, $transparent);
        }

        imagecopyresampled(
            $targetImage,
            $sourceImage,
            0, 0, 0, 0,
            $targetWidth,
            $targetHeight,
            $width,
            $height
        );

        $tempPath = tempnam(sys_get_temp_dir(), 'simpeg_img_');

        // Output optimized file (82% quality for JPEG/WebP provides near-lossless visual quality with huge size reduction)
        switch ($imageType) {
            case IMAGETYPE_JPEG:
                imagejpeg($targetImage, $tempPath, 82);
                break;
            case IMAGETYPE_PNG:
                imagepng($targetImage, $tempPath, 8);
                break;
            case IMAGETYPE_WEBP:
                if (function_exists('imagewebp')) {
                    imagewebp($targetImage, $tempPath, 82);
                } else {
                    imagejpeg($targetImage, $tempPath, 82);
                }
                break;
            case IMAGETYPE_GIF:
                imagegif($targetImage, $tempPath);
                break;
            default:
                imagejpeg($targetImage, $tempPath, 82);
                break;
        }

        imagedestroy($sourceImage);
        imagedestroy($targetImage);

        return $tempPath;
    }

    /**
     * Optimize a PDF file safely.
     * Note: Pure regex stream alteration corrupts PDF internal xref byte offsets causing blank pages in PDF viewers.
     * Therefore, PDFs are preserved 100% binary-intact to ensure pristine document rendering.
     */
    public function optimizePdf(string $sourcePath): ?string
    {
        // Keep PDF binary-intact for 100% rendering integrity
        return null;
    }

    /**
     * Format bytes into human readable KB or MB.
     */
    public function formatFileSize(int $bytes): string
    {
        if ($bytes >= 1048576) {
            return number_format($bytes / 1048576, 2) . ' MB';
        }

        return number_format($bytes / 1024, 2) . ' KB';
    }
}
