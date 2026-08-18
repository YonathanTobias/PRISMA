<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\EmployeeDocument;
use App\Models\EmployeeTraining;
use App\Models\Department;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $stats = [
            'total_active'      => Employee::active()->count(),
            'total_inactive'    => Employee::onlyTrashed()->count(),
            'new_this_month'    => Employee::active()
                ->whereMonth('join_date', now()->month)
                ->whereYear('join_date', now()->year)
                ->count(),
            'resign_this_month' => Employee::onlyTrashed()
                ->whereMonth('deleted_at', now()->month)
                ->whereYear('deleted_at', now()->year)
                ->count(),
        ];

        // By employment status
        $byStatus = Employee::active()
            ->selectRaw('employment_status, COUNT(*) as total')
            ->groupBy('employment_status')
            ->pluck('total', 'employment_status');

        // By department
        $byDepartment = Department::whereHas('employees', fn($q) => $q->active())
            ->withCount(['employees' => fn($q) => $q->active()])
            ->orderByDesc('employees_count')
            ->limit(8)
            ->get();

        // By gender
        $byGender = Employee::active()
            ->selectRaw('gender, COUNT(*) as total')
            ->groupBy('gender')
            ->pluck('total', 'gender');

        // Document expiry alerts (within 30 days)
        $expiringDocuments = EmployeeDocument::with('employee')
            ->whereNotNull('expiry_date')
            ->whereBetween('expiry_date', [now(), now()->addDays(30)])
            ->orderBy('expiry_date')
            ->limit(10)
            ->get();

        // Contract expiry alerts (within 30 days)
        $expiringContracts = Employee::active()
            ->whereNotNull('contract_end_date')
            ->whereBetween('contract_end_date', [now(), now()->addDays(30)])
            ->orderBy('contract_end_date')
            ->limit(10)
            ->get();

        // Recent employees
        $recentEmployees = Employee::active()
            ->with(['department', 'position'])
            ->latest()
            ->limit(5)
            ->get();

        return view('dashboard.index', compact(
            'stats', 'byStatus', 'byDepartment', 'byGender',
            'expiringDocuments', 'expiringContracts', 'recentEmployees'
        ));
    }
}
