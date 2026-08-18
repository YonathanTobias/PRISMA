<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\Position;
use Illuminate\Http\Request;

class DepartmentController extends Controller
{
    public function index()
    {
        $departments = Department::withCount('employees')->orderBy('name')->get();
        $positions   = Position::with('department')->orderBy('name')->get();
        return view('master.index', compact('departments', 'positions'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'        => 'required|string|max:255',
            'code'        => 'nullable|string|unique:departments,code',
            'description' => 'nullable|string',
        ]);
        Department::create($validated);
        return back()->with('success', 'Departemen berhasil ditambahkan.');
    }

    public function update(Request $request, Department $department)
    {
        $validated = $request->validate([
            'name'        => 'required|string|max:255',
            'code'        => 'nullable|string|unique:departments,code,' . $department->id,
            'description' => 'nullable|string',
            'is_active'   => 'boolean',
        ]);
        $validated['is_active'] = $request->boolean('is_active');
        $department->update($validated);
        return back()->with('success', 'Departemen berhasil diperbarui.');
    }

    public function destroy(Department $department)
    {
        if ($department->employees()->count() > 0) {
            return back()->with('error', 'Departemen tidak dapat dihapus karena masih memiliki pegawai.');
        }
        $department->delete();
        return back()->with('success', 'Departemen berhasil dihapus.');
    }
}
