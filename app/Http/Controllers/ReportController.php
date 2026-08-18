<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\Department;
use App\Models\Position;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\EmployeeReportExport;

class ReportController extends Controller
{
    public function index(Request $request)
    {
        $type       = $request->get('type', 'demografi');
        $year       = $request->get('year', now()->year);
        $month      = $request->get('month');
        $dept_id    = $request->get('department_id');

        $data = match($type) {
            'demografi'   => $this->getDemografiData($dept_id),
            'status'      => $this->getStatusData($dept_id),
            'turnover'    => $this->getTurnoverData($year, $month),
            default       => $this->getDemografiData($dept_id),
        };

        $departments = Department::orderBy('name')->get();

        $years = range(now()->year, max(now()->year - 5, 2020));

        return view('reports.index', compact('type', 'year', 'month', 'dept_id', 'data', 'departments', 'years'));
    }

    public function export(Request $request)
    {
        $type   = $request->get('type', 'demografi');
        $format = $request->get('format', 'excel');

        if ($format === 'pdf') {
            $data  = $this->getReportData($request);
            $pdf   = Pdf::loadView('reports.pdf', ['data' => $data, 'type' => $type])
                ->setPaper('a4', 'landscape');
            return $pdf->download('laporan-' . $type . '-' . now()->format('YmdHis') . '.pdf');
        }

        return Excel::download(
            new EmployeeReportExport($type, $request->all()),
            'laporan-' . $type . '-' . now()->format('YmdHis') . '.xlsx'
        );
    }

    private function getDemografiData(?int $deptId = null): array
    {
        $base = Employee::active();
        if ($deptId) $base->where('department_id', $deptId);

        return [
            'by_gender'        => (clone $base)->selectRaw('gender, COUNT(*) as total')->groupBy('gender')->get(),
            'by_marital'       => (clone $base)->selectRaw('marital_status, COUNT(*) as total')->groupBy('marital_status')->get(),
            'by_education'     => (clone $base)->join('employee_educations', 'employees.id', '=', 'employee_educations.employee_id')
                                    ->selectRaw('employee_educations.level, COUNT(DISTINCT employees.id) as total')
                                    ->groupBy('employee_educations.level')->get(),
            'by_department'    => Department::withCount(['employees' => fn($q) => $q->active()->when($deptId, fn($q) => $q->where('department_id', $deptId))])
                                    ->orderByDesc('employees_count')->get(),
            'age_groups'       => $this->getAgeGroupData($deptId),
        ];
    }

    private function getStatusData(?int $deptId = null): array
    {
        $base = Employee::active();
        if ($deptId) $base->where('department_id', $deptId);

        return [
            'by_employment_status' => (clone $base)->selectRaw('employment_status, COUNT(*) as total')->groupBy('employment_status')->get(),
            'by_department'        => Department::with(['employees' => fn($q) => $q->active()->selectRaw('department_id, employment_status, COUNT(*) as total')->groupBy('department_id', 'employment_status')])
                                        ->get(),
            'contract_expiring'    => Employee::active()->whereNotNull('contract_end_date')
                                        ->where('contract_end_date', '<=', now()->addDays(90))
                                        ->with(['department', 'position'])->orderBy('contract_end_date')->get(),
        ];
    }

    private function getTurnoverData(int $year, ?int $month = null): array
    {
        $query = Employee::onlyTrashed()->with(['department', 'resignationDetail']);
        $query->whereYear('deleted_at', $year);
        if ($month) $query->whereMonth('deleted_at', $month);

        $employees = $query->orderByDesc('deleted_at')->get();

        return [
            'employees'    => $employees,
            'by_reason'    => $employees->groupBy(fn($e) => $e->resignationDetail?->reason ?? 'unknown'),
            'by_month'     => $employees->groupBy(fn($e) => $e->deleted_at->format('m')),
            'by_department'=> $employees->groupBy(fn($e) => $e->department?->name ?? 'Tidak diketahui'),
        ];
    }

    private function getAgeGroupData(?int $deptId = null): \Illuminate\Support\Collection
    {
        $employees = Employee::active()
            ->when($deptId, fn($q) => $q->where('department_id', $deptId))
            ->whereNotNull('birth_date')
            ->get(['birth_date']);

        return $employees->groupBy(function($emp) {
            $age = $emp->birth_date->age;
            if ($age < 25)      return '< 25 tahun';
            elseif ($age < 35)  return '25–34 tahun';
            elseif ($age < 45)  return '35–44 tahun';
            elseif ($age < 55)  return '45–54 tahun';
            else                return '≥ 55 tahun';
        })->map->count();
    }

    private function getReportData(Request $request): array
    {
        return match($request->get('type', 'demografi')) {
            'demografi' => $this->getDemografiData($request->get('department_id')),
            'status'    => $this->getStatusData($request->get('department_id')),
            'turnover'  => $this->getTurnoverData($request->get('year', now()->year), $request->get('month')),
            default     => [],
        };
    }
}
