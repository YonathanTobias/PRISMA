<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Employee;
use App\Models\Department;
use App\Models\Position;
use App\Models\EmployeeEducation;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Shared\Date;

class ImportPsdmExcelSeeder extends Seeder
{
    public function run(): void
    {
        $baseDir = base_path('data_master/');
        $dosenFile = $baseDir . 'Data Dosen.xlsx';
        $tendikFile = $baseDir . 'Data Tendik.xlsx';

        if (!file_exists($dosenFile) || !file_exists($tendikFile)) {
            $this->command->warn('File Data Dosen.xlsx atau Data Tendik.xlsx tidak ditemukan di data_master/.');
            return;
        }

        $this->importDosen($dosenFile);
        $this->importTendik($tendikFile);
    }

    protected function parseIndoDate($str)
    {
        if (empty($str)) return null;
        $str = trim((string)$str);
        if (is_numeric($str)) {
            try {
                return Date::excelToDateTimeObject($str)->format('Y-m-d');
            } catch (\Throwable $e) {
                return null;
            }
        }
        $months = [
            'januari' => 'January', 'februari' => 'February', 'maret' => 'March',
            'april' => 'April', 'mei' => 'May', 'juni' => 'June',
            'juli' => 'July', 'agustus' => 'August', 'september' => 'September',
            'oktober' => 'October', 'november' => 'November', 'desember' => 'December',
            'jan' => 'Jan', 'feb' => 'Feb', 'mar' => 'Mar', 'apr' => 'Apr',
            'jun' => 'Jun', 'jul' => 'Jul', 'ags' => 'Aug', 'agu' => 'Aug',
            'sep' => 'Sep', 'okt' => 'Oct', 'nov' => 'Nov', 'des' => 'Dec'
        ];
        $clean = str_ireplace(array_keys($months), array_values($months), $str);
        $ts = strtotime($clean);
        return $ts ? date('Y-m-d', $ts) : null;
    }

    protected function getOrCreateDept($name, $code = 'DEPT')
    {
        $dept = Department::where('name', $name)->first();
        if ($dept) return $dept;

        $baseCode = strtoupper(substr(preg_replace('/[^A-Za-z0-9]/', '', $code ?: $name), 0, 8));
        if (empty($baseCode)) $baseCode = 'DEPT';

        $finalCode = $baseCode;
        $counter = 1;
        while (Department::where('code', $finalCode)->exists()) {
            $finalCode = substr($baseCode, 0, 6) . $counter;
            $counter++;
        }

        return Department::create([
            'name'        => $name,
            'code'        => $finalCode,
            'description' => $name,
        ]);
    }

    protected function getOrCreatePosition($title, $deptId = null)
    {
        return Position::firstOrCreate(
            ['name' => $title],
            ['department_id' => $deptId, 'is_active' => true]
        );
    }

    protected function findOrCreateEmployee($name, $nik = null)
    {
        $employee = null;
        if (!empty($nik)) {
            $employee = Employee::where('nik', $nik)->first();
        }
        if (!$employee) {
            $clean = preg_replace('/^(Ns\.|dr\.|apt\.)\s*/i', '', trim($name));
            $clean = explode(',', $clean)[0];
            $clean = trim($clean);
            if (strlen($clean) >= 4) {
                $employee = Employee::where('full_name', 'LIKE', '%' . $clean . '%')->first();
            }
        }
        if (!$employee) {
            $employee = new Employee();
            $employee->full_name = $name;
        }
        return $employee;
    }

    protected function importDosen($filePath)
    {
        $spreadsheet = IOFactory::load($filePath);
        $sheet = $spreadsheet->getSheet(0);
        $highestRow = $sheet->getHighestRow();

        $currentProdi = 'S1 Keperawatan';
        $currentDept = $this->getOrCreateDept('S1 Keperawatan', 'KEP-S1');
        $posDosen = $this->getOrCreatePosition('Dosen', $currentDept->id);

        for ($r = 1; $r <= $highestRow; $r++) {
            $colA = trim((string)$sheet->getCell('A' . $r)->getValue());
            $colB = trim((string)$sheet->getCell('B' . $r)->getValue());
            $colC = trim((string)$sheet->getCell('C' . $r)->getValue()); // NIDN / NIDK
            $colD = trim((string)$sheet->getCell('D' . $r)->getValue()); // NUPTK
            $colE = trim((string)$sheet->getCell('E' . $r)->getValue()); // NAMA
            $colF = trim((string)$sheet->getCell('F' . $r)->getValue()); // TTL
            $colG = trim((string)$sheet->getCell('G' . $r)->getValue()); // Gender
            $colH = trim((string)$sheet->getCell('H' . $r)->getValue()); // Agama
            $colI = trim((string)$sheet->getCell('I' . $r)->getValue()); // Pendidikan
            $colJ = trim((string)$sheet->getCell('J' . $r)->getValue()); // Peminatan
            $colK = trim((string)$sheet->getCell('K' . $r)->getValue()); // SERDOS
            $colL = trim((string)$sheet->getCell('L' . $r)->getValue()); // Asisten Ahli
            $colM = trim((string)$sheet->getCell('M' . $r)->getValue()); // Lektor
            $colN = trim((string)$sheet->getCell('N' . $r)->getValue()); // Lektor Kepala
            $colO = trim((string)$sheet->getCell('O' . $r)->getValue()); // Guru Besar
            $colP = trim((string)$sheet->getCell('P' . $r)->getValue()); // SK Dosen Tetap
            $colQ = trim((string)$sheet->getCell('Q' . $r)->getValue()); // Pekerti
            $colR = trim((string)$sheet->getCell('R' . $r)->getValue()); // AA
            $colS = trim((string)$sheet->getCell('S' . $r)->getValue()); // Inpassing
            $colT = trim((string)$sheet->getCell('T' . $r)->getValue()); // Pangkat
            $colU = $sheet->getCell('U' . $r)->getValue(); // Masuk

            // Detect section headers
            if ($colA && !is_numeric($colA) && stripos($colA, 'Dosen Prodi') !== false) {
                if (stripos($colA, 'Keperawatan') !== false) {
                    $currentDept = $this->getOrCreateDept('S1 Keperawatan', 'KEP-S1');
                } elseif (stripos($colA, 'Ners') !== false) {
                    $currentDept = $this->getOrCreateDept('Profesi Ners', 'NERS');
                } elseif (stripos($colA, 'Farmasi') !== false) {
                    $currentDept = $this->getOrCreateDept('S1 Farmasi', 'FAR-S1');
                } elseif (stripos($colA, 'MIK') !== false) {
                    $currentDept = $this->getOrCreateDept('D4 Manajemen Informasi Kesehatan', 'MIK-D4');
                }
                continue;
            }

            if (is_numeric($colA) && !empty($colE)) {
                // Birth place and date
                $birthPlace = rtrim($colF, " ,\t\n\r\0\x0B");
                $birthDate = null;
                $nextF = $sheet->getCell('F' . ($r + 1))->getValue();
                if (!empty($nextF)) {
                    $birthDate = $this->parseIndoDate($nextF);
                }

                // Education history spanning next rows
                $educations = [];
                if (!empty($colI)) $educations[] = $colI;
                for ($sub = $r + 1; $sub <= $r + 5 && $sub <= $highestRow; $sub++) {
                    $subA = trim((string)$sheet->getCell('A' . $sub)->getValue());
                    if (is_numeric($subA) || stripos($subA, 'Dosen Prodi') !== false) break;
                    $subI = trim((string)$sheet->getCell('I' . $sub)->getValue());
                    if (!empty($subI)) $educations[] = $subI;
                }

                // Highest Jafung
                $jafung = null;
                $nextL = trim((string)$sheet->getCell('L' . ($r + 1))->getValue());
                $nextM = trim((string)$sheet->getCell('M' . ($r + 1))->getValue());
                $nextN = trim((string)$sheet->getCell('N' . ($r + 1))->getValue());
                $nextO = trim((string)$sheet->getCell('O' . ($r + 1))->getValue());

                if (!empty($colO) && $colO !== '-') {
                    $jafung = 'Guru Besar' . ($nextO ? " ($nextO)" : '');
                } elseif (!empty($colN) && $colN !== '-') {
                    $jafung = 'Lektor Kepala' . ($nextN ? " ($nextN)" : '');
                } elseif (!empty($colM) && $colM !== '-') {
                    $jafung = 'Lektor' . ($nextM ? " ($nextM)" : '');
                } elseif (!empty($colL) && $colL !== '-') {
                    $jafung = 'Asisten Ahli' . ($nextL ? " ($nextL)" : '');
                }

                $nip = !empty($colB) ? $colB : null;
                $empStatus = $nip ? 'tetap' : 'kontrak';

                $employee = $this->findOrCreateEmployee($colE, $nip);
                $employee->fill([
                    'full_name'           => $colE,
                    'nik'                 => $nip,
                    'employee_type'       => 'dosen',
                    'nidn'                => $colC ?: null,
                    'nuptk'               => $colD ?: null,
                    'department_id'       => $currentDept->id,
                    'position_id'         => $posDosen->id,
                    'employment_status'   => $empStatus,
                    'status'              => 'active',
                    'birth_place'         => $birthPlace ?: null,
                    'birth_date'          => $birthDate,
                    'gender'              => strncasecmp($colG, 'P', 1) === 0 ? 'P' : 'L',
                    'religion'            => $colH ?: null,
                    'specialization'      => $colJ ?: null,
                    'serdos'              => $colK ?: null,
                    'functional_position' => $jafung,
                    'sk_dosen_tetap'      => $colP ?: null,
                    'pekerti'             => $colQ ?: null,
                    'applied_approach'    => $colR ?: null,
                    'inpassing'           => $colS ?: null,
                    'rank_group'          => $colT ?: null,
                    'join_date'           => $this->parseIndoDate($colU),
                ]);
                $employee->save();

                // Insert education
                if (!empty($educations)) {
                    $employee->educations()->delete();
                    foreach ($educations as $eduStr) {
                        $level = 'S1';
                        if (stripos($eduStr, 'S3') !== false || stripos($eduStr, 'Doktor') !== false) $level = 'S3';
                        elseif (stripos($eduStr, 'S2') !== false || stripos($eduStr, 'Magister') !== false || stripos($eduStr, 'MAN') !== false) $level = 'S2';
                        elseif (stripos($eduStr, 'Profesi') !== false || stripos($eduStr, 'Ners') !== false || stripos($eduStr, 'Apt') !== false) $level = 'lainnya';
                        elseif (stripos($eduStr, 'D4') !== false || stripos($eduStr, 'DIV') !== false) $level = 'D4';
                        elseif (stripos($eduStr, 'D3') !== false || stripos($eduStr, 'D-III') !== false || stripos($eduStr, 'Akper') !== false) $level = 'D3';

                        $year = null;
                        if (preg_match('/\b(19|20)\d{2}\b/', $eduStr, $matches)) {
                            $year = (int)$matches[0];
                        }

                        EmployeeEducation::create([
                            'employee_id'     => $employee->id,
                            'level'           => $level,
                            'institution'     => $eduStr,
                            'major'           => $colJ ?: '-',
                            'graduation_year' => $year,
                        ]);
                    }
                }
            }
        }
    }

    protected function importTendik($filePath)
    {
        $spreadsheet = IOFactory::load($filePath);
        $sheet = $spreadsheet->getSheet(0);
        $highestRow = $sheet->getHighestRow();

        for ($r = 2; $r <= $highestRow; $r++) {
            $colA = trim((string)$sheet->getCell('A' . $r)->getValue()); // No
            $colB = trim((string)$sheet->getCell('B' . $r)->getValue()); // NIP
            $colC = trim((string)$sheet->getCell('C' . $r)->getValue()); // NAMA
            $colD = trim((string)$sheet->getCell('D' . $r)->getValue()); // TTL
            $colE = trim((string)$sheet->getCell('E' . $r)->getValue()); // Gender
            $colF = trim((string)$sheet->getCell('F' . $r)->getValue()); // Agama
            $colG = trim((string)$sheet->getCell('G' . $r)->getValue()); // Pendidikan
            $colH = trim((string)$sheet->getCell('H' . $r)->getValue()); // Bagian
            $colI = $sheet->getCell('I' . $r)->getValue(); // Mulai masuk
            $colJ = trim((string)$sheet->getCell('J' . $r)->getValue()); // Pangkat / Golongan

            if (is_numeric($colA) && !empty($colC)) {
                // Parse TTL
                $birthPlace = null;
                $birthDate = null;
                if (!empty($colD)) {
                    $parts = explode(',', $colD, 2);
                    $birthPlace = trim($parts[0]);
                    if (isset($parts[1]) && trim($parts[1]) !== '') {
                        $birthDate = $this->parseIndoDate($parts[1]);
                    }
                }

                // Department and Position based on Bagian
                $bagian = $colH ?: 'Umum';
                $deptCode = strtoupper(substr(preg_replace('/[^A-Za-z0-9]/', '', $bagian), 0, 6));
                $dept = $this->getOrCreateDept($bagian, $deptCode ?: 'TNDK');
                $pos = $this->getOrCreatePosition('Staf ' . $bagian, $dept->id);

                // Collect education spanning multi-rows
                $educations = [];
                if (!empty($colG)) $educations[] = $colG;
                for ($sub = $r + 1; $sub <= $r + 4 && $sub <= $highestRow; $sub++) {
                    $subA = trim((string)$sheet->getCell('A' . $sub)->getValue());
                    if (is_numeric($subA)) break;
                    $subG = trim((string)$sheet->getCell('G' . $sub)->getValue());
                    if (!empty($subG)) $educations[] = $subG;
                }

                $nip = !empty($colB) ? $colB : null;
                $empStatus = $nip ? 'tetap' : 'kontrak';

                $employee = $this->findOrCreateEmployee($colC, $nip);
                $employee->fill([
                    'full_name'         => $colC,
                    'nik'               => $nip,
                    'employee_type'     => 'tendik',
                    'department_id'     => $dept->id,
                    'position_id'       => $pos->id,
                    'employment_status' => $empStatus,
                    'status'            => 'active',
                    'birth_place'       => $birthPlace,
                    'birth_date'        => $birthDate,
                    'gender'            => strncasecmp($colE, 'P', 1) === 0 ? 'P' : 'L',
                    'religion'          => $colF ?: null,
                    'rank_group'        => $colJ ?: null,
                    'join_date'         => $this->parseIndoDate($colI),
                ]);
                $employee->save();

                if (!empty($educations)) {
                    $employee->educations()->delete();
                    foreach ($educations as $eduStr) {
                        $level = 'S1';
                        if (stripos($eduStr, 'S2') !== false) $level = 'S2';
                        elseif (stripos($eduStr, 'Profesi') !== false || stripos($eduStr, 'Ners') !== false) $level = 'lainnya';
                        elseif (stripos($eduStr, 'D4') !== false || stripos($eduStr, 'DIV') !== false || stripos($eduStr, 'D Iv') !== false) $level = 'D4';
                        elseif (stripos($eduStr, 'D3') !== false || stripos($eduStr, 'Diii') !== false) $level = 'D3';
                        elseif (stripos($eduStr, 'SMA') !== false || stripos($eduStr, 'SMK') !== false) $level = 'SMA/SMK';

                        $year = null;
                        if (preg_match('/\b(19|20)\d{2}\b/', $eduStr, $matches)) {
                            $year = (int)$matches[0];
                        }

                        EmployeeEducation::create([
                            'employee_id'     => $employee->id,
                            'level'           => $level,
                            'institution'     => $eduStr,
                            'major'           => '-',
                            'graduation_year' => $year,
                        ]);
                    }
                }
            }
        }
    }
}
