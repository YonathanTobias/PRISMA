<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class EmployeeTraining extends Model
{
    protected $table = 'employee_trainings';

    protected $fillable = [
        'employee_id', 'type', 'name', 'organizer', 'start_date', 'end_date',
        'expiry_date', 'certificate_number', 'attachment'
    ];

    protected $casts = [
        'start_date'  => 'date',
        'end_date'    => 'date',
        'expiry_date' => 'date',
    ];

    public static $typeLabels = [
        'pelatihan'    => 'Pelatihan',
        'sertifikasi'  => 'Sertifikasi',
        'lisensi'      => 'Lisensi',
        'workshop'     => 'Workshop',
        'seminar'      => 'Seminar',
        'lainnya'      => 'Lainnya',
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
}
