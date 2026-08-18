<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class EmployeeFamily extends Model
{
    protected $fillable = [
        'employee_id', 'relation', 'full_name', 'birth_date', 'occupation', 'is_dependent', 'phone', 'notes'
    ];

    protected $casts = ['birth_date' => 'date', 'is_dependent' => 'boolean'];

    public static $relationLabels = [
        'pasangan' => 'Pasangan (Suami/Istri)',
        'anak'     => 'Anak',
        'orang_tua'=> 'Orang Tua',
        'saudara'  => 'Saudara',
        'lainnya'  => 'Lainnya',
    ];

    public function employee(): BelongsTo
    {
        return $this->belongsTo(Employee::class);
    }
}
