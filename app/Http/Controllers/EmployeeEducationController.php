<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\EmployeeEducation;
use App\Models\EmployeeTraining;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class EmployeeEducationController extends Controller
{
    public function store(Request $request, Employee $employee)
    {
        $validated = $request->validate([
            'level'           => 'required|in:SD,SMP,SMA/SMK,D1,D2,D3,D4,S1,S2,S3,lainnya',
            'institution'     => 'required|string|max:255',
            'major'           => 'nullable|string|max:255',
            'graduation_year' => 'nullable|digits:4',
            'gpa'             => 'nullable|string|max:10',
        ]);
        $validated['employee_id'] = $employee->id;
        EmployeeEducation::create($validated);

        return back()->with('success', 'Riwayat pendidikan berhasil ditambahkan.');
    }

    public function destroy(EmployeeEducation $education)
    {
        $education->delete();
        return back()->with('success', 'Riwayat pendidikan berhasil dihapus.');
    }
}

