<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Database\Factories\UserFactory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<UserFactory> */
    use HasFactory, Notifiable;

    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
        'is_active',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password'          => 'hashed',
            'is_active'         => 'boolean',
        ];
    }

    public static $roleLabels = [
        'admin_it' => 'Admin IT',
        'hrd'      => 'Tim HRD',
        'guest'    => 'Tamu / Guest',
    ];

    public function isAdminIT(): bool
    {
        return $this->role === 'admin_it';
    }

    public function isHRD(): bool
    {
        return $this->role === 'hrd';
    }

    public function isGuest(): bool
    {
        return $this->role === 'guest';
    }

    public function hasRole(string $role): bool
    {
        return $this->role === $role;
    }

    public function getRoleLabelAttribute(): string
    {
        return self::$roleLabels[$this->role] ?? $this->role;
    }
}
