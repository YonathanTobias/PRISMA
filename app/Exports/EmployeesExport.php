<?php

namespace App\Exports;

use App\Models\Employee;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class EmployeesExport implements FromCollection, WithHeadings, WithTitle, WithStyles, ShouldAutoSize
{
    protected array $filters;

    public function __construct(array $filters = [])
    {
        $this->filters = $filters;
    }

    public function collection()
    {
        $query = Employee::active()->with(['department', 'position']);

        if (!empty($this->filters['search'])) {
            $search = $this->filters['search'];
            $query->where(function($q) use ($search) {
                $q->where('full_name', 'like', '%' . $search . '%')
                  ->orWhere('nik', 'like', '%' . $search . '%')
                  ->orWhere('phone', 'like', '%' . $search . '%');
            });
        }

        if (!empty($this->filters['department_id'])) {
            $query->where('department_id', $this->filters['department_id']);
        }

        if (!empty($this->filters['employment_status'])) {
            $query->where('employment_status', $this->filters['employment_status']);
        }

        if (!empty($this->filters['gender'])) {
            $query->where('gender', $this->filters['gender']);
        }

        return $query->get()->map(function($e, $i) {
            return [
                $i + 1,
                $e->nik ?? '-',
                $e->full_name,
                $e->gender === 'L' ? 'Laki-laki' : ($e->gender === 'P' ? 'Perempuan' : '-'),
                $e->birth_place . ($e->birth_date ? ', ' . $e->birth_date->format('d/m/Y') : ''),
                $e->department?->name ?? '-',
                $e->position?->name ?? '-',
                Employee::$employmentStatusLabels[$e->employment_status] ?? $e->employment_status,
                $e->join_date?->format('d/m/Y') ?? '-',
            ];
        });
    }

    public function headings(): array
    {
        return [
            'No',
            'NIP/NIK',
            'Nama Lengkap',
            'Jenis Kelamin',
            'Tempat, Tanggal Lahir',
            'Departemen',
            'Jabatan',
            'Status Kerja',
            'Tanggal Bergabung'
        ];
    }

    public function title(): string
    {
        return 'Data Karyawan Aktif';
    }

    public function styles(Worksheet $sheet): array
    {
        return [
            1 => [
                'font' => ['bold' => true, 'color' => ['rgb' => 'FFFFFF']],
                'fill' => ['fillType' => 'solid', 'startColor' => ['rgb' => '2563EB']]
            ],
        ];
    }
}
