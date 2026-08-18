<?php

namespace App\Exports;

use App\Models\Employee;
use App\Models\Department;
use App\Models\ResignationDetail;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class EmployeeReportExport implements FromCollection, WithHeadings, WithTitle, WithStyles, ShouldAutoSize
{
    protected string $type;
    protected array $filters;

    public function __construct(string $type, array $filters = [])
    {
        $this->type    = $type;
        $this->filters = $filters;
    }

    public function collection()
    {
        return match($this->type) {
            'demografi' => $this->demografiCollection(),
            'status'    => $this->statusCollection(),
            'turnover'  => $this->turnoverCollection(),
            default     => collect(),
        };
    }

    public function headings(): array
    {
        return match($this->type) {
            'demografi' => ['No', 'NIK', 'Nama Lengkap', 'Jenis Kelamin', 'Usia', 'Status Nikah', 'Departemen', 'Jabatan', 'Tanggal Bergabung'],
            'status'    => ['No', 'NIK', 'Nama Lengkap', 'Status Kepegawaian', 'Departemen', 'Jabatan', 'Tanggal Bergabung', 'Akhir Kontrak'],
            'turnover'  => ['No', 'NIK', 'Nama Lengkap', 'Departemen', 'Jabatan', 'Tanggal Keluar', 'Alasan', 'Status Clearance'],
            default     => [],
        };
    }

    public function title(): string
    {
        return match($this->type) {
            'demografi' => 'Laporan Demografi',
            'status'    => 'Laporan Status Kepegawaian',
            'turnover'  => 'Laporan Turnover',
            default     => 'Laporan',
        };
    }

    public function styles(Worksheet $sheet): array
    {
        return [
            1 => ['font' => ['bold' => true], 'fill' => ['fillType' => 'solid', 'startColor' => ['rgb' => '2563EB']], 'font' => ['color' => ['rgb' => 'FFFFFF'], 'bold' => true]],
        ];
    }

    private function demografiCollection()
    {
        return Employee::active()->with(['department', 'position'])->get()->map(function($e, $i) {
            return [
                $i + 1,
                $e->nik,
                $e->full_name,
                $e->gender === 'L' ? 'Laki-laki' : ($e->gender === 'P' ? 'Perempuan' : '-'),
                $e->age ?? '-',
                Employee::$maritalStatusLabels[$e->marital_status] ?? '-',
                $e->department?->name ?? '-',
                $e->position?->name ?? '-',
                $e->join_date?->format('d/m/Y') ?? '-',
            ];
        });
    }

    private function statusCollection()
    {
        return Employee::active()->with(['department', 'position'])->get()->map(function($e, $i) {
            return [
                $i + 1,
                $e->nik,
                $e->full_name,
                Employee::$employmentStatusLabels[$e->employment_status] ?? $e->employment_status,
                $e->department?->name ?? '-',
                $e->position?->name ?? '-',
                $e->join_date?->format('d/m/Y') ?? '-',
                $e->contract_end_date?->format('d/m/Y') ?? '-',
            ];
        });
    }

    private function turnoverCollection()
    {
        $year  = $this->filters['year'] ?? now()->year;
        $month = $this->filters['month'] ?? null;

        return Employee::onlyTrashed()->with(['department', 'position', 'resignationDetail'])
            ->whereYear('deleted_at', $year)
            ->when($month, fn($q) => $q->whereMonth('deleted_at', $month))
            ->get()
            ->map(function($e, $i) {
                $detail = $e->resignationDetail;
                return [
                    $i + 1,
                    $e->nik,
                    $e->full_name,
                    $e->department?->name ?? '-',
                    $e->position?->name ?? '-',
                    $detail?->resignation_date?->format('d/m/Y') ?? $e->deleted_at->format('d/m/Y'),
                    ResignationDetail::$reasonLabels[$detail?->reason] ?? '-',
                    ResignationDetail::$clearanceStatusLabels[$detail?->clearance_status] ?? '-',
                ];
            });
    }
}
