<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\ResignationDetail;
use Illuminate\Http\Request;

class ResignedEmployeeController extends Controller
{
    public function index(Request $request)
    {
        $query = Employee::onlyTrashed()->with(['department', 'position', 'resignationDetail']);

        if ($request->filled('search')) {
            $query->where(function($q) use ($request) {
                $q->where('full_name', 'like', '%' . $request->search . '%')
                  ->orWhere('nik', 'like', '%' . $request->search . '%');
            });
        }

        if ($request->filled('reason')) {
            $query->whereHas('resignationDetail', fn($q) => $q->where('reason', $request->reason));
        }

        if ($request->filled('year')) {
            $query->whereYear('deleted_at', $request->year);
        }

        $employees = $query->orderByDesc('deleted_at')->paginate(15)->withQueryString();

        $years = Employee::onlyTrashed()
            ->get()
            ->map(fn($e) => $e->deleted_at?->year)
            ->filter()
            ->unique()
            ->sortDesc()
            ->values();

        return view('resigned.index', compact('employees', 'years'));
    }

    public function show(int $id)
    {
        $employee = Employee::onlyTrashed()
            ->with(['department', 'position', 'supervisor', 'families', 'contacts',
                    'educations', 'trainings', 'documents', 'resignationDetail'])
            ->findOrFail($id);

        return view('resigned.show', compact('employee'));
    }

    public function restore(int $id)
    {
        $employee = Employee::onlyTrashed()->findOrFail($id);
        $employee->restore();
        $employee->update(['status' => 'active']);

        return redirect()->route('resigned.index')
            ->with('success', "Pegawai {$employee->full_name} berhasil dipulihkan ke status aktif.");
    }

    public function forceDelete(int $id)
    {
        $employee = Employee::onlyTrashed()->findOrFail($id);
        $employee->resignationDetail?->delete();
        $employee->forceDelete();

        return redirect()->route('resigned.index')
            ->with('success', 'Data pegawai berhasil dihapus permanen.');
    }

    public function updateResignation(Request $request, int $id)
    {
        $employee = Employee::onlyTrashed()->findOrFail($id);

        $validated = $request->validate([
            'resignation_date' => 'required|date',
            'reason'           => 'required|in:resign_mandiri,habis_kontrak,pensiun,phk,lainnya',
            'reason_detail'    => 'nullable|string',
            'clearance_status' => 'required|in:pending,process,completed',
            'clearance_notes'  => 'nullable|string',
            'deleted_at'       => 'required|date',
        ]);

        $employee->resignationDetail()->updateOrCreate(
            ['employee_id' => $employee->id],
            [
                'resignation_date' => $validated['resignation_date'],
                'reason'           => $validated['reason'],
                'reason_detail'    => $validated['reason_detail'],
                'clearance_status' => $validated['clearance_status'],
                'clearance_notes'  => $validated['clearance_notes'],
            ]
        );

        $employee->deleted_at = \Carbon\Carbon::parse($validated['deleted_at']);
        $employee->save();

        return redirect()->route('resigned.show', $employee->id)
            ->with('success', 'Detail pengakhiran kerja dan tanggal pengarsipan berhasil diperbarui.');
    }
}
