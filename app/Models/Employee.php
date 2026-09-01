<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Carbon\Carbon;

class Employee extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'nik', 'full_name', 'employee_type', 'religion', 'birth_place', 'birth_date', 'gender', 'address',
        'phone', 'email', 'photo',
        'employment_status', 'department_id', 'position_id', 'supervisor_id',
        'nidn', 'nuptk', 'functional_position', 'specialization', 'rank_group',
        'serdos', 'pekerti', 'applied_approach', 'inpassing', 'sk_dosen_tetap',
        'join_date', 'contract_end_date',
        'status', 'marital_status', 'notes',
    ];

    protected $casts = [
        'birth_date' => 'date',
        'join_date' => 'date',
        'contract_end_date' => 'date',
    ];

    // Status labels
    public static $employmentStatusLabels = [
        'tetap'    => 'Tetap (PKWTT)',
        'kontrak'  => 'Kontrak (PKWT)',
        'magang'   => 'Magang',
        'probation'=> 'Probation',
    ];

    public static $maritalStatusLabels = [
        'belum_menikah' => 'Belum Menikah',
        'menikah'       => 'Menikah',
        'cerai'         => 'Cerai',
        'duda_janda'    => 'Duda/Janda',
    ];

    public static $genderLabels = [
        'L' => 'Laki-laki',
        'P' => 'Perempuan',
    ];

    // Relationships
    public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class);
    }

    public function position(): BelongsTo
    {
        return $this->belongsTo(Position::class);
    }

    public function supervisor(): BelongsTo
    {
        return $this->belongsTo(Employee::class, 'supervisor_id');
    }

    public function subordinates(): HasMany
    {
        return $this->hasMany(Employee::class, 'supervisor_id');
    }

    public function families(): HasMany
    {
        return $this->hasMany(EmployeeFamily::class);
    }

    public function contacts(): HasMany
    {
        return $this->hasMany(EmployeeContact::class);
    }

    public function educations(): HasMany
    {
        return $this->hasMany(EmployeeEducation::class);
    }

    public function trainings(): HasMany
    {
        return $this->hasMany(EmployeeTraining::class);
    }

    public function documents(): HasMany
    {
        return $this->hasMany(EmployeeDocument::class);
    }

    public function resignationDetail(): HasOne
    {
        return $this->hasOne(ResignationDetail::class);
    }

    // Accessors
    public function getAgeAttribute(): ?int
    {
        return $this->birth_date ? $this->birth_date->age : null;
    }

    public function getWorkDurationAttribute(): ?string
    {
        if (!$this->join_date) return null;
        $diff = $this->join_date->diff(now());
        return $diff->y . ' tahun ' . $diff->m . ' bulan';
    }

    public function getPhotoUrlAttribute(): string
    {
        if ($this->photo && \Storage::disk('public')->exists($this->photo)) {
            return asset('storage/' . $this->photo);
        }
        return asset('images/default-avatar.png');
    }

    // Scopes
    public function scopeActive($query)
    {
        return $query->where('status', 'active');
    }

    public function scopeInactive($query)
    {
        return $query->where('status', 'inactive');
    }

    public function scopeByDepartment($query, $departmentId)
    {
        return $query->where('department_id', $departmentId);
    }

    public function scopeByStatus($query, $status)
    {
        return $query->where('employment_status', $status);
    }

    public function scopeDosen($query)
    {
        return $query->where('employee_type', 'dosen');
    }

    public function scopeTendik($query)
    {
        return $query->where('employee_type', 'tendik');
    }

    public function isDosen(): bool
    {
        return $this->employee_type === 'dosen';
    }

    public function isTendik(): bool
    {
        return $this->employee_type === 'tendik';
    }
}
