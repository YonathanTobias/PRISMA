<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class EmployeeDocument extends Model
{
    protected $fillable = [
        'employee_id', 'type', 'name', 'file_path', 'file_name', 'file_size',
        'file_type', 'issued_date', 'expiry_date', 'notes'
    ];

    protected $casts = [
        'issued_date' => 'date',
        'expiry_date' => 'date',
    ];

    public static $typeLabels = [
        'ktp'                    => 'KTP',
        'npwp'                   => 'NPWP',
        'bpjs_kesehatan'         => 'BPJS Kesehatan',
        'bpjs_ketenagakerjaan'   => 'BPJS Ketenagakerjaan',
        'ijazah'                 => 'Ijazah',
        'kontrak_kerja'          => 'Kontrak Kerja',
        'sk_jabatan'             => 'SK Jabatan',
        'foto'                   => 'Foto',
        'Transkrip'              => 'Transkrip',
        'lainnya'                => 'Lainnya',
    ];

    public function employee(): BelongsTo
    {
        return $this->belongsTo(Employee::class);
    }

    public function isExpiringSoon(int $days = 30): bool
    {
        return $this->expiry_date && $this->expiry_date->isBetween(now(), now()->addDays($days));
    }

    public function isExpired(): bool
    {
        return $this->expiry_date && $this->expiry_date->isPast();
    }

    public function getDownloadUrlAttribute(): string
    {
        return route('documents.download', $this->id);
    }
}
