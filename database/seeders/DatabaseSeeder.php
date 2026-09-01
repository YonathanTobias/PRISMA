<?php

namespace Database\Seeders;

use App\Models\Department;
use App\Models\Position;
use App\Models\User;
use App\Models\Employee;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // ── Settings ───────────────────────────────────────
        \DB::table('settings')->insert([
            [
                'key' => 'app_name',
                'value' => 'PRISMA-PW',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'key' => 'app_description',
                'value' => 'Portal Informasi Sumber Daya Manusia Panti Waluya',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'key' => 'institution_name',
                'value' => 'STIKes Panti Waluya Malang',
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);

        // ── Users ──────────────────────────────────────────
        User::create([
            'name'      => 'Admin IT (STIKes Panti Waluya)',
            'email'     => 'admin@simpeg.local',
            'password'  => Hash::make('password'),
            'role'      => 'admin_it',
            'is_active' => true,
        ]);

        User::create([
            'name'      => 'Tim HRD & Kepeformatan',
            'email'     => 'hrd@simpeg.local',
            'password'  => Hash::make('password'),
            'role'      => 'hrd',
            'is_active' => true,
        ]);

        User::create([
            'name'      => 'Akun Tamu / Guest',
            'email'     => 'guest@simpeg.local',
            'password'  => Hash::make('password'),
            'role'      => 'guest',
            'is_active' => true,
        ]);

        // ── Import Employees, Departments, Positions, Families & Educations from CSV ──
        $this->call(ImportFromCSVSeeder::class);
        $this->call(ImportInactiveFromCSVSeeder::class);
        $this->call(ImportPsdmExcelSeeder::class);
    }
}
