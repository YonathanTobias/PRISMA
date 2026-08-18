<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ResignationDetail extends Model
{
    protected $fillable = [
        'employee_id', 'resignation_date', 'reason', 'reason_detail',
        'clearance_status', 'clearance_notes', 'clearance_date', 'notes'
    ];

    protected $casts = [
        'resignation_date' => 'date',
        'clearance_date'   => 'date',
    ];

    public static $reasonLabels = [
        'resign_mandiri'  => 'Resign Mandiri',
        'habis_kontrak'   => 'Habis Kontrak',
        'pensiun'         => 'Pensiun',
        'phk'             => 'PHK',
        'lainnya'         => 'Lainnya',
    ];

    public static $clearanceStatusLabels = [
        'pending'   => 'Pending',
        'process'   => 'Proses',
        'completed' => 'Selesai',
    ];

    public function employee(): BelongsTo
    {
        return $this->belongsTo(Employee::class)->withTrashed();
    }
}
