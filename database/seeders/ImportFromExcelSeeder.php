<?php

namespace Database\Seeders;

use App\Models\Department;
use App\Models\Position;
use App\Models\User;
use App\Models\Employee;
use App\Models\EmployeeEducation;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Shared\Date as ExcelDate;
use Carbon\Carbon;

class ImportFromExcelSeeder extends Seeder
{
    public function run(): void
    {
        $filePath = base_path('data_master/DATA KARYAWAN STIKES TAHUN 2025.xls');

        if (!file_exists($filePath)) {
            $this->command->error("Excel file not found at: $filePath");
            return;
        }

        $spreadsheet = IOFactory::load($filePath);

        // 1. Clear existing dynamic tables disabling foreign keys for MySQL compatibility
        Schema::disableForeignKeyConstraints();
        Employee::truncate();
        Department::truncate();
        Position::truncate();
        EmployeeEducation::truncate();
        Schema::enableForeignKeyConstraints();

        // 2. Build Lookup maps from "Dos" and "Tendik" sheets for detailed profile data
        $lookupMap = [];

        // Parse Dosen details from "Dos" sheet (Index 1)
        $sheetDos = $spreadsheet->getSheet(1);
        $highestRowDos = $sheetDos->getHighestRow();
        for ($row = 6; $row <= $highestRowDos; $row++) {
            $nip = trim($sheetDos->getCell('B' . $row)->getValue() ?? '');
            $name = trim($sheetDos->getCell('E' . $row)->getValue() ?? '');
            
            if ($nip || $name) {
                $key = $nip ?: $name;
                if (!isset($lookupMap[$key])) {
                    $gender = trim($sheetDos->getCell('G' . $row)->getValue() ?? '');
                    $religion = trim($sheetDos->getCell('H' . $row)->getValue() ?? '');
                    $functional = trim($sheetDos->getCell('L' . $row)->getValue() ?? '');
                    
                    $lookupMap[$key] = [
                        'gender' => strtolower($gender) === 'perempuan' ? 'P' : 'L',
                        'religion' => $religion,
                        'functional' => $functional,
                        'educations' => []
                    ];
                }

                // Add educations from current row and subsequent empty-NIP rows
                $edu = trim($sheetDos->getCell('I' . $row)->getValue() ?? '');
                if ($edu) {
                    $lookupMap[$key]['educations'][] = $edu;
                }
            } elseif (isset($key)) {
                // Subsequent education rows
                $edu = trim($sheetDos->getCell('I' . $row)->getValue() ?? '');
                if ($edu) {
                    $lookupMap[$key]['educations'][] = $edu;
                }
            }
        }

        // Parse Tendik details from "Tendik" sheet (Index 2)
        $sheetTendik = $spreadsheet->getSheet(2);
        $highestRowTendik = $sheetTendik->getHighestRow();
        for ($row = 2; $row <= $highestRowTendik; $row++) {
            $nip = trim($sheetTendik->getCell('B' . $row)->getValue() ?? '');
            $name = trim($sheetTendik->getCell('C' . $row)->getValue() ?? '');
            
            if ($nip || $name) {
                $key = $nip ?: $name;
                if (!isset($lookupMap[$key])) {
                    $gender = trim($sheetTendik->getCell('E' . $row)->getValue() ?? '');
                    $religion = trim($sheetTendik->getCell('F' . $row)->getValue() ?? '');
                    $pangkat = trim($sheetTendik->getCell('J' . $row)->getValue() ?? '');
                    
                    $lookupMap[$key] = [
                        'gender' => strtolower($gender) === 'perempuan' ? 'P' : 'L',
                        'religion' => $religion,
                        'functional' => $pangkat,
                        'educations' => []
                    ];
                }

                $edu = trim($sheetTendik->getCell('G' . $row)->getValue() ?? '');
                if ($edu) {
                    $lookupMap[$key]['educations'][] = $edu;
                }
            } elseif (isset($key)) {
                $edu = trim($sheetTendik->getCell('G' . $row)->getValue() ?? '');
                if ($edu) {
                    $lookupMap[$key]['educations'][] = $edu;
                }
            }
        }

        // 3. Import unified employees from "Far" sheet (Index 0)
        $sheetFar = $spreadsheet->getSheet(0);
        $highestRowFar = $sheetFar->getHighestRow();

        $currentDeptName = 'Umum';
        $departmentsMap = [];
        $positionsMap = [];

        for ($row = 4; $row <= $highestRowFar; $row++) {
            $col0 = trim($sheetFar->getCell('A' . $row)->getValue() ?? '');
            $col3 = trim($sheetFar->getCell('D' . $row)->getValue() ?? '');

            // Detect department sections in Column D
            if (empty($col0) && !empty($col3) && empty(trim($sheetFar->getCell('B' . $row)->getValue() ?? '')) && empty(trim($sheetFar->getCell('C' . $row)->getValue() ?? ''))) {
                $currentDeptName = $col3;
                continue;
            }

            // Parse valid employee row
            if (!empty($col0) && is_numeric($col0)) {
                $nip = trim($sheetFar->getCell('B' . $row)->getValue() ?? '');
                $nidn = trim($sheetFar->getCell('C' . $row)->getValue() ?? '');
                $fullName = trim($sheetFar->getCell('D' . $row)->getValue() ?? '');
                $birthStr = trim($sheetFar->getCell('E' . $row)->getValue() ?? '');

                if (!$nip) {
                    $nip = 'EMP-' . str_pad($col0, 3, '0', STR_PAD_LEFT);
                }

                // Parse Birth Place & Birth Date
                $birthPlace = null;
                $birthDate = null;
                if ($birthStr) {
                    $parts = explode(',', $birthStr);
                    $birthPlace = trim($parts[0]);
                    if (isset($parts[1])) {
                        $birthDate = $this->parseIndonesianDate(trim($parts[1]));
                    }
                }

                // Resolve Department
                if (!isset($departmentsMap[$currentDeptName])) {
                    $code = strtoupper(substr(str_replace('Prodi ', '', $currentDeptName), 0, 8));
                    $departmentsMap[$currentDeptName] = Department::create([
                        'name' => $currentDeptName,
                        'code' => $code,
                        'is_active' => true
                    ]);
                }
                $dept = $departmentsMap[$currentDeptName];

                // Check lookup map for detailed data
                $lookupKey = $nip ?: $fullName;
                $lookupData = $lookupMap[$lookupKey] ?? ($lookupMap[$nip] ?? ($lookupMap[$fullName] ?? null));

                // Determine Gender
                $gender = 'L';
                if ($lookupData) {
                    $gender = $lookupData['gender'];
                } else {
                    // Fallback gender guessing
                    $femaleKeywords = ['ns.', 'siti', 'maria', 'yustina', 'sri', 'ni ', 'kristina', 'elisabeth', 'oda', 'ferra', 'dyla', 'vania', 'katarina', 'miasih', 'indarti', 'luluk', 'venny', 'ika', 'yulinda', 'nita', 'nancy', 'fransiska', 'yolanda', 'agnes', 'eli ', 'raswati', 'vincensia', 'oktavia', 'yushinta', 'theresia'];
                    $lowerName = strtolower($fullName);
                    foreach ($femaleKeywords as $kw) {
                        if (str_contains($lowerName, $kw)) {
                            $gender = 'P';
                            break;
                        }
                    }
                }

                // Resolve Position
                $jobTitle = 'Staf';
                if ($lookupData && !empty($lookupData['functional'])) {
                    $jobTitle = $lookupData['functional'];
                } elseif (str_contains(strtolower($currentDeptName), 'prodi') || str_contains(strtolower($currentDeptName), 'dosen')) {
                    $jobTitle = 'Dosen Tetap';
                }

                if (!isset($positionsMap[$jobTitle])) {
                    $positionsMap[$jobTitle] = Position::create([
                        'name' => $jobTitle,
                        'code' => strtoupper(substr(str_replace(' ', '', $jobTitle), 0, 6)),
                        'department_id' => $dept->id,
                        'is_active' => true
                    ]);
                }
                $position = $positionsMap[$jobTitle];

                // Create Employee
                $employee = Employee::create([
                    'nik' => $nip,
                    'full_name' => $fullName,
                    'birth_place' => $birthPlace,
                    'birth_date' => $birthDate,
                    'gender' => $gender,
                    'employment_status' => 'tetap',
                    'department_id' => $dept->id,
                    'position_id' => $position->id,
                    'work_location' => 'Kampus STIKes Panti Waluya Malang',
                    'join_date' => now()->subYears(3), // default/placeholder
                    'status' => 'active',
                    'notes' => $lookupData && !empty($lookupData['religion']) ? 'Agama: ' . $lookupData['religion'] : null,
                ]);

                // Insert Educations
                $hasEdu = false;
                // Try from lookup map first
                if ($lookupData && !empty($lookupData['educations'])) {
                    foreach ($lookupData['educations'] as $eduText) {
                        $this->createEducationRecord($employee->id, $eduText);
                        $hasEdu = true;
                    }
                }

                // If not found in lookup, extract from columns F, G, H, I, J (indexes 5, 6, 7, 8, 9) of Far sheet
                if (!$hasEdu) {
                    for ($colIdx = 5; $colIdx <= 9; $colIdx++) {
                        $eduVal = trim($sheetFar->getCellByColumnAndRow($colIdx + 1, $row)->getValue() ?? '');
                        if ($eduVal && $eduVal !== '-') {
                            $this->createEducationRecord($employee->id, $eduVal);
                        }
                    }
                }
            }
        }
    }

    private function parseIndonesianDate(string $dateStr): ?string
    {
        $months = [
            'januari' => '01', 'februari' => '02', 'maret' => '03', 'april' => '04',
            'mei' => '05', 'juni' => '06', 'juli' => '07', 'agustus' => '08',
            'september' => '09', 'oktober' => '10', 'november' => '11', 'nopember' => '11', 'desember' => '12'
        ];

        $dateStr = strtolower(trim($dateStr));
        $parts = explode(' ', $dateStr);

        if (count($parts) === 3) {
            $day = str_pad($parts[0], 2, '0', STR_PAD_LEFT);
            $monthName = $parts[1];
            $year = $parts[2];

            $month = $months[$monthName] ?? '01';
            return "$year-$month-$day";
        }

        return null;
    }

    private function createEducationRecord(int $employeeId, string $eduText): void
    {
        $eduTextLower = strtolower($eduText);
        $level = 'lainnya';

        if (str_contains($eduTextLower, 's3')) {
            $level = 'S3';
        } elseif (str_contains($eduTextLower, 's2') || str_contains($eduTextLower, 'magister')) {
            $level = 'S2';
        } elseif (str_contains($eduTextLower, 's1') || str_contains($eduTextLower, 'sarjana') || str_contains($eduTextLower, 'ners')) {
            $level = 'S1';
        } elseif (str_contains($eduTextLower, 'd iv') || str_contains($eduTextLower, 'div') || str_contains($eduTextLower, 'd4')) {
            $level = 'D4';
        } elseif (str_contains($eduTextLower, 'd iii') || str_contains($eduTextLower, 'diii') || str_contains($eduTextLower, 'd3')) {
            $level = 'D3';
        }

        EmployeeEducation::create([
            'employee_id' => $employeeId,
            'level' => $level,
            'institution' => $eduText,
            'graduation_year' => $this->extractYear($eduText) ?: null,
        ]);
    }

    private function extractYear(string $text): ?int
    {
        if (preg_match('/\b(19|20)\d{2}\b/', $text, $matches)) {
            return (int)$matches[0];
        }
        return null;
    }
}
