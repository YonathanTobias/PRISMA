<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\ResignedEmployeeController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\EmployeeFamilyController;
use App\Http\Controllers\EmployeeEducationController;
use App\Http\Controllers\EmployeeTrainingController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\PositionController;
use App\Http\Controllers\UserController;

// Redirect root to dashboard
Route::get('/', fn() => redirect()->route('dashboard'));

// Auth routes
Route::get('/login', [\App\Http\Controllers\Auth\LoginController::class, 'showLoginForm'])->name('login')->middleware('guest');
Route::post('/login', [\App\Http\Controllers\Auth\LoginController::class, 'login'])->middleware('guest');
Route::post('/logout', [\App\Http\Controllers\Auth\LoginController::class, 'logout'])->name('logout')->middleware('auth');

// Protected routes (all authenticated users, including guest for READ operations)
Route::middleware(['auth'])->group(function () {

    // Dashboard
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    // Employees Read-Only (Accessible by Guest, HRD, Admin IT)
    Route::get('employees', [EmployeeController::class, 'index'])->name('employees.index');
    Route::get('employees/export', [EmployeeController::class, 'export'])->name('employees.export');
    Route::get('employees/{employee}/pdf', [EmployeeController::class, 'pdf'])->name('employees.pdf');
    Route::get('employees/{employee}', [EmployeeController::class, 'show'])->name('employees.show');

    // Resigned / Archive Read-Only
    Route::get('resigned', [ResignedEmployeeController::class, 'index'])->name('resigned.index');
    Route::get('resigned/{id}', [ResignedEmployeeController::class, 'show'])->name('resigned.show');

    // Document Viewing/Downloading
    Route::get('documents/{document}/download', [DocumentController::class, 'download'])->name('documents.download');
    Route::get('documents/{document}/preview', [DocumentController::class, 'preview'])->name('documents.preview');

    // Reports Read & Export
    Route::get('reports', [ReportController::class, 'index'])->name('reports.index');
    Route::get('reports/export', [ReportController::class, 'export'])->name('reports.export');

    // Write & Management Actions (HRD and Admin IT only)
    Route::middleware(['role:admin_it,hrd'])->group(function () {
        // System Settings
        Route::get('settings', [\App\Http\Controllers\SettingsController::class, 'index'])->name('settings.index');
        Route::put('settings', [\App\Http\Controllers\SettingsController::class, 'update'])->name('settings.update');

        // Employee Create, Edit, Delete & Resign
        Route::get('employees/create', [EmployeeController::class, 'create'])->name('employees.create');
        Route::post('employees', [EmployeeController::class, 'store'])->name('employees.store');
        Route::get('employees/{employee}/edit', [EmployeeController::class, 'edit'])->name('employees.edit');
        Route::put('employees/{employee}', [EmployeeController::class, 'update'])->name('employees.update');
        Route::delete('employees/{employee}', [EmployeeController::class, 'destroy'])->name('employees.destroy');
        Route::post('employees/{employee}/resign', [EmployeeController::class, 'resign'])->name('employees.resign');

        // Employee Sub-resources
        Route::post('employees/{employee}/families', [EmployeeFamilyController::class, 'store'])->name('employee-families.store');
        Route::delete('employee-families/{family}', [EmployeeFamilyController::class, 'destroy'])->name('employee-families.destroy');

        Route::post('employees/{employee}/educations', [EmployeeEducationController::class, 'store'])->name('employee-educations.store');
        Route::delete('employee-educations/{education}', [EmployeeEducationController::class, 'destroy'])->name('employee-educations.destroy');

        Route::post('employees/{employee}/trainings', [EmployeeTrainingController::class, 'store'])->name('employee-trainings.store');
        Route::delete('employee-trainings/{training}', [EmployeeTrainingController::class, 'destroy'])->name('employee-trainings.destroy');

        Route::post('employees/{employee}/documents', [DocumentController::class, 'store'])->name('documents.store');
        Route::delete('documents/{document}', [DocumentController::class, 'destroy'])->name('documents.destroy');

        // Resigned Restore & Update Resignation
        Route::post('resigned/{id}/restore', [ResignedEmployeeController::class, 'restore'])->name('resigned.restore');
        Route::put('resigned/{id}/resignation', [ResignedEmployeeController::class, 'updateResignation'])->name('resigned.update-resignation');

        // Master Data (departments & positions)
        Route::get('master', [DepartmentController::class, 'index'])->name('master.index');
        Route::resource('master/departments', DepartmentController::class)
            ->only(['store', 'update', 'destroy'])
            ->names([
                'store'   => 'departments.store',
                'update'  => 'departments.update',
                'destroy' => 'departments.destroy',
            ]);
        Route::resource('master/positions', PositionController::class)
            ->only(['store', 'update', 'destroy'])
            ->names([
                'store'   => 'positions.store',
                'update'  => 'positions.update',
                'destroy' => 'positions.destroy',
            ]);
    });

    // User Management & Hard Delete (Admin IT only)
    Route::middleware(['role:admin_it'])->group(function () {
        Route::resource('users', UserController::class)->only(['index', 'store', 'update', 'destroy']);
        Route::delete('resigned/{id}/force-delete', [ResignedEmployeeController::class, 'forceDelete'])->name('resigned.force-delete');
    });
});
