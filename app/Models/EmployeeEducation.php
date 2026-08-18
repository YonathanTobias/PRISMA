<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class EmployeeEducation extends Model
{
    protected $table = 'employee_educations';

    protected $fillable = ['employee_id', 'level', 'institution', 'major', 'graduation_year', 'gpa'];

    public static $levelLabels = [
        'SD' => 'SD', 'SMP' => 'SMP', 'SMA/SMK' => 'SMA/SMK',
        'D1' => 'D1', 'D2' => 'D2', 'D3' => 'D3', 'D4' => 'D4',
        'S1' => 'S1', 'S2' => 'S2', 'S3' => 'S3', 'lainnya' => 'Lainnya',
    ];

    public function employee(): BelongsTo
    {
        return $this->belongsTo(Employee::class);
    }
}
