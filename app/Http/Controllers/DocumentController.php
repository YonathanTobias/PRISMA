<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\EmployeeDocument;
use App\Services\FileCompressionService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DocumentController extends Controller
{
    protected FileCompressionService $compressionService;

    public function __construct(FileCompressionService $compressionService)
    {
        $this->compressionService = $compressionService;
    }

    public function store(Request $request, Employee $employee)
    {
        $validated = $request->validate([
            'name'         => 'required|string|max:255',
            'file'         => 'required|file|max:10240',
            'type'         => 'nullable|string|max:100',
            'issued_date'  => 'nullable|date',
            'expiry_date'  => 'nullable|date',
            'notes'        => 'nullable|string',
        ]);

        $file = $request->file('file');
        $savedFile = $this->compressionService->compressAndStore(
            $file,
            'employees/documents/' . $employee->id,
            'local'
        );

        EmployeeDocument::create([
            'employee_id' => $employee->id,
            'type'        => $validated['type'] ?? 'dokumen',
            'name'        => $validated['name'],
            'file_path'   => $savedFile['file_path'],
            'file_name'   => $savedFile['file_name'],
            'file_size'   => $savedFile['file_size'],
            'file_type'   => $savedFile['file_type'],
            'issued_date' => $validated['issued_date'] ?? null,
            'expiry_date' => $validated['expiry_date'] ?? null,
            'notes'       => $validated['notes'] ?? null,
        ]);

        $msg = 'Dokumen berhasil diunggah.';
        if ($savedFile['is_compressed'] && $savedFile['saved_percentage'] > 0) {
            $msg .= " (Ukuran berhasil dioptimasi hemat {$savedFile['saved_percentage']}%)";
        }

        return back()->with('success', $msg);
    }

    public function storeBatch(Request $request, Employee $employee)
    {
        $validated = $request->validate([
            'documents'        => 'required|array|min:1',
            'documents.*.file' => 'required|file|max:10240',
            'documents.*.name' => 'required|string|max:255',
            'documents.*.type' => 'nullable|string|max:100',
        ]);

        $uploadedCount = 0;
        foreach ($validated['documents'] as $item) {
            $file = $item['file'];
            $savedFile = $this->compressionService->compressAndStore(
                $file,
                'employees/documents/' . $employee->id,
                'local'
            );

            EmployeeDocument::create([
                'employee_id' => $employee->id,
                'type'        => $item['type'] ?? 'dokumen',
                'name'        => $item['name'],
                'file_path'   => $savedFile['file_path'],
                'file_name'   => $savedFile['file_name'],
                'file_size'   => $savedFile['file_size'],
                'file_type'   => $savedFile['file_type'],
                'issued_date' => null,
                'expiry_date' => null,
                'notes'       => null,
            ]);

            $uploadedCount++;
        }

        if ($request->wantsJson()) {
            return response()->json([
                'success' => true,
                'message' => "Berhasil mengunggah {$uploadedCount} dokumen sekaligus.",
                'count'   => $uploadedCount,
            ]);
        }

        return back()->with('success', "Berhasil mengunggah {$uploadedCount} dokumen sekaligus.");
    }

    public function download(EmployeeDocument $document)
    {
        if (!Storage::disk('local')->exists($document->file_path)) {
            abort(404, 'File tidak ditemukan.');
        }

        return Storage::disk('local')->download($document->file_path, $document->file_name);
    }

    public function preview(EmployeeDocument $document)
    {
        if (!Storage::disk('local')->exists($document->file_path)) {
            abort(404, 'File tidak ditemukan.');
        }

        $filePath = Storage::disk('local')->path($document->file_path);
        
        $mime = $document->file_type;
        if (empty($mime) || $mime === 'application/octet-stream') {
            $ext = strtolower(pathinfo($document->file_name, PATHINFO_EXTENSION));
            $mime = match($ext) {
                'pdf' => 'application/pdf',
                'jpg', 'jpeg' => 'image/jpeg',
                'png' => 'image/png',
                'webp' => 'image/webp',
                'gif' => 'image/gif',
                default => 'application/pdf',
            };
        }

        return response()->file($filePath, [
            'Content-Type'        => $mime,
            'Content-Disposition' => 'inline; filename="' . $document->file_name . '"',
        ]);
    }

    public function destroy(EmployeeDocument $document)
    {
        Storage::disk('local')->delete($document->file_path);
        $employeeId = $document->employee_id;
        $document->delete();

        return back()->with('success', 'Dokumen berhasil dihapus.');
    }
}
