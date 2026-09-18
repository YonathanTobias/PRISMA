<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Str;

class DocumentType extends Model
{
    protected $fillable = [
        'code',
        'name',
        'description',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    public function documents(): HasMany
    {
        return $this->hasMany(EmployeeDocument::class, 'type', 'code');
    }

    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    public static function generateCode(string $name): string
    {
        $base = Str::slug($name, '_');
        $code = $base;
        $counter = 1;
        while (static::where('code', $code)->exists()) {
            $code = $base . '_' . $counter++;
        }
        return $code;
    }
}
