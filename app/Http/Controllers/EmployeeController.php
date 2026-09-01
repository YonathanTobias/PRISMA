<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\Department;
use App\Models\Position;
use App\Models\ResignationDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class EmployeeController extends Controller
{
    public function index(Request $request)
    {
        $query = Employee::active()->with(['department', 'position']);

        if ($request->filled('search')) {
            $query->where(function($q) use ($request) {
                $q->where('full_name', 'like', '%' . $request->search . '%')
                  ->orWhere('nik', 'like', '%' . $request->search . '%')
                  ->orWhere('phone', 'like', '%' . $request->search . '%');
            });
        }

        if ($request->filled('department_id')) {
            $query->where('department_id', $request->department_id);
        }

        if ($request->filled('employment_status')) {
            $query->where('employment_status', $request->employment_status);
        }

        if ($request->filled('gender')) {
            $query->where('gender', $request->gender);
        }

        $employees  = $query->orderBy('full_name')->paginate(15)->withQueryString();
        $departments = Department::where('is_active', true)->orderBy('name')->get();

        return view('employees.index', compact('employees', 'departments'));
    }

    public function export(Request $request)
    {
        $format = $request->get('format', 'excel');

        if ($format === 'pdf') {
            $query = Employee::active()->with(['department', 'position']);

            if ($request->filled('search')) {
                $query->where(function($q) use ($request) {
                    $q->where('full_name', 'like', '%' . $request->search . '%')
                      ->orWhere('nik', 'like', '%' . $request->search . '%')
                      ->orWhere('phone', 'like', '%' . $request->search . '%');
                });
            }

            if ($request->filled('department_id')) {
                $query->where('department_id', $request->department_id);
            }

            if ($request->filled('employment_status')) {
                $query->where('employment_status', $request->employment_status);
            }

            if ($request->filled('gender')) {
                $query->where('gender', $request->gender);
            }

            $employees = $query->orderBy('full_name')->get();

            $pdf = \Barryvdh\DomPDF\Facade\Pdf::loadView('employees.pdf', compact('employees'))
                ->setPaper('a4', 'landscape');

            return $pdf->download('daftar-pegawai-aktif-' . now()->format('YmdHis') . '.pdf');
        }

        return \Maatwebsite\Excel\Facades\Excel::download(
            new \App\Exports\EmployeesExport($request->all()),
            'daftar-pegawai-aktif-' . now()->format('YmdHis') . '.xlsx'
        );
    }

    public function pdf(Employee $employee)
    {
        $employee->load([
            'department', 'position', 'supervisor',
            'families', 'contacts', 'educations', 'trainings', 'documents'
        ]);

        $pdf = \Barryvdh\DomPDF\Facade\Pdf::loadView('employees.cv_pdf', compact('employee'));
        return $pdf->download('CV-' . str_replace(' ', '_', $employee->full_name) . '.pdf');
    }

    public function create()
    {
        $departments = Department::where('is_active', true)->orderBy('name')->get();
        $positions   = Position::where('is_active', true)->orderBy('name')->get();
        $supervisors = Employee::active()->orderBy('full_name')->get();

        return view('employees.create', compact('departments', 'positions', 'supervisors'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nik'               => 'nullable|string|unique:employees,nik',
            'full_name'         => 'required|string|max:255',
            'birth_place'       => 'nullable|string|max:100',
            'birth_date'        => 'nullable|date',
            'gender'            => 'nullable|in:L,P',
            'address'           => 'nullable|string',
            'phone'             => 'nullable|string|max:20',
            'email'             => 'nullable|email|max:255',
            'employment_status' => 'required|in:tetap,kontrak,magang,probation',
            'department_id'     => 'nullable|exists:departments,id',
            'position_id'       => 'nullable|exists:positions,id',
            'supervisor_id'     => 'nullable|exists:employees,id',
            'join_date'         => 'nullable|date',
            'contract_end_date' => 'nullable|date',
            'marital_status'    => 'nullable|in:belum_menikah,menikah,cerai,duda_janda',
            'notes'             => 'nullable|string',
            'photo'             => 'nullable|image|max:2048',
        ]);

        if ($request->hasFile('photo')) {
            $validated['photo'] = $request->file('photo')->store('employees/photos', 'public');
        }

        $employee = Employee::create($validated);

        return redirect()->route('employees.show', $employee)
            ->with('success', 'Data pegawai berhasil ditambahkan.');
    }

    public function show(Employee $employee)
    {
        $employee->load([
            'department', 'position', 'supervisor',
            'families', 'contacts', 'educations', 'trainings', 'documents'
        ]);

        return view('employees.show', compact('employee'));
    }

    public function edit(Employee $employee)
    {
        $departments = Department::where('is_active', true)->orderBy('name')->get();
        $positions   = Position::where('is_active', true)->orderBy('name')->get();
        $supervisors = Employee::active()->where('id', '!=', $employee->id)->orderBy('full_name')->get();

        return view('employees.edit', compact('employee', 'departments', 'positions', 'supervisors'));
    }

    public function update(Request $request, Employee $employee)
    {
        $validated = $request->validate([
            'nik'               => 'nullable|string|unique:employees,nik,' . $employee->id,
            'full_name'         => 'required|string|max:255',
            'birth_place'       => 'nullable|string|max:100',
            'birth_date'        => 'nullable|date',
            'gender'            => 'nullable|in:L,P',
            'address'           => 'nullable|string',
            'phone'             => 'nullable|string|max:20',
            'email'             => 'nullable|email|max:255',
            'employment_status' => 'required|in:tetap,kontrak,magang,probation',
            'department_id'     => 'nullable|exists:departments,id',
            'position_id'       => 'nullable|exists:positions,id',
            'supervisor_id'     => 'nullable|exists:employees,id',
            'join_date'         => 'nullable|date',
            'contract_end_date' => 'nullable|date',
            'marital_status'    => 'nullable|in:belum_menikah,menikah,cerai,duda_janda',
            'notes'             => 'nullable|string',
            'photo'             => 'nullable|image|max:2048',
        ]);

        if ($request->hasFile('photo')) {
            if ($employee->photo) Storage::disk('public')->delete($employee->photo);
            $validated['photo'] = $request->file('photo')->store('employees/photos', 'public');
        }

        $employee->update($validated);

        return redirect()->route('employees.show', $employee)
            ->with('success', 'Data pegawai berhasil diperbarui.');
    }

    public function destroy(Employee $employee)
    {
        $employee->delete();
        return redirect()->route('employees.index')
            ->with('success', 'Data pegawai berhasil dihapus.');
    }

    public function resign(Request $request, Employee $employee)
    {
        $validated = $request->validate([
            'resignation_date'  => 'required|date',
            'reason'            => 'required|in:resign_mandiri,habis_kontrak,pensiun,phk,lainnya',
            'reason_detail'     => 'nullable|string',
            'clearance_status'  => 'required|in:pending,process,completed',
            'clearance_notes'   => 'nullable|string',
            'notes'             => 'nullable|string',
        ]);

        // Create resignation detail
        ResignationDetail::updateOrCreate(
            ['employee_id' => $employee->id],
            $validated
        );

        // Soft delete (move to archive)
        $employee->update(['status' => 'inactive']);
        $employee->delete();

        return redirect()->route('employees.index')
            ->with('success', "Pegawai {$employee->full_name} berhasil diarsipkan.");
    }
}
