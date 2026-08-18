<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\EmployeeFamily;
use Illuminate\Http\Request;

class EmployeeFamilyController extends Controller
{
    public function store(Request $request, Employee $employee)
    {
        $validated = $request->validate([
            'relation'     => 'required|in:pasangan,anak,orang_tua,saudara,lainnya',
            'full_name'    => 'required|string|max:255',
            'birth_date'   => 'nullable|date',
            'occupation'   => 'nullable|string|max:255',
            'is_dependent' => 'boolean',
            'phone'        => 'nullable|string|max:20',
            'notes'        => 'nullable|string',
        ]);
        $validated['employee_id']  = $employee->id;
        $validated['is_dependent'] = $request->boolean('is_dependent');

        EmployeeFamily::create($validated);

        return back()->with('success', 'Data keluarga berhasil ditambahkan.');
    }

    public function destroy(EmployeeFamily $family)
    {
        $family->delete();
        return back()->with('success', 'Data keluarga berhasil dihapus.');
    }
}
