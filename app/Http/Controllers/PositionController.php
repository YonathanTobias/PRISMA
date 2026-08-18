<?php

namespace App\Http\Controllers;

use App\Models\Position;
use App\Models\Department;
use Illuminate\Http\Request;

class PositionController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'          => 'required|string|max:255',
            'code'          => 'nullable|string|unique:positions,code',
            'department_id' => 'nullable|exists:departments,id',
            'description'   => 'nullable|string',
        ]);
        Position::create($validated);
        return back()->with('success', 'Jabatan berhasil ditambahkan.');
    }

    public function update(Request $request, Position $position)
    {
        $validated = $request->validate([
            'name'          => 'required|string|max:255',
            'code'          => 'nullable|string|unique:positions,code,' . $position->id,
            'department_id' => 'nullable|exists:departments,id',
            'description'   => 'nullable|string',
            'is_active'     => 'boolean',
        ]);
        $validated['is_active'] = $request->boolean('is_active');
        $position->update($validated);
        return back()->with('success', 'Jabatan berhasil diperbarui.');
    }

    public function destroy(Position $position)
    {
        if ($position->employees()->count() > 0) {
            return back()->with('error', 'Jabatan tidak dapat dihapus karena masih digunakan oleh pegawai.');
        }
        $position->delete();
        return back()->with('success', 'Jabatan berhasil dihapus.');
    }
}
