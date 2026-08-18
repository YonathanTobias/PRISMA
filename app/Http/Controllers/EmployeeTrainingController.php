<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\EmployeeTraining;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class EmployeeTrainingController extends Controller
{
    public function store(Request $request, Employee $employee)
    {
        $validated = $request->validate([
            'type'               => 'required|in:pelatihan,sertifikasi,lisensi,workshop,seminar,lainnya',
            'name'               => 'required|string|max:255',
            'organizer'          => 'nullable|string|max:255',
            'start_date'         => 'nullable|date',
            'end_date'           => 'nullable|date|after_or_equal:start_date',
            'expiry_date'        => 'nullable|date',
            'certificate_number' => 'nullable|string|max:100',
            'attachment'         => 'nullable|file|max:5120',
        ]);

        if ($request->hasFile('attachment')) {
            $validated['attachment'] = $request->file('attachment')
                ->store('employees/trainings/' . $employee->id, 'public');
        }

        $validated['employee_id'] = $employee->id;
        EmployeeTraining::create($validated);

        return back()->with('success', 'Data pelatihan/sertifikasi berhasil ditambahkan.');
    }

    public function destroy(EmployeeTraining $training)
    {
        if ($training->attachment) {
            Storage::disk('public')->delete($training->attachment);
        }
        $training->delete();
        return back()->with('success', 'Data pelatihan berhasil dihapus.');
    }
}
