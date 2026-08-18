<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>CV Pegawai - {{ $employee->full_name }}</title>
    <style>
        body { font-family: sans-serif; font-size: 11px; color: #333; line-height: 1.4; }
        .header { border-bottom: 2px solid #2563eb; padding-bottom: 12px; margin-bottom: 20px; }
        .header table { width: 100%; border: none; }
        .header td { border: none; padding: 0; }
        .header h1 { margin: 0; font-size: 20px; color: #0f172a; }
        .header p { margin: 3px 0 0; color: #475569; font-size: 11px; }
        
        .section-title { font-size: 12px; font-weight: bold; color: #1e3a8a; border-bottom: 1px solid #cbd5e1; padding-bottom: 4px; margin-top: 18px; margin-bottom: 8px; text-transform: uppercase; }
        
        .profile-table { width: 100%; margin-bottom: 15px; }
        .profile-table td { padding: 4px 6px; vertical-align: top; border: none; }
        .profile-table td.label { width: 25%; color: #64748b; font-weight: bold; }
        .profile-table td.value { width: 75%; color: #0f172a; }

        table.data-table { width: 100%; border-collapse: collapse; margin-top: 5px; margin-bottom: 15px; }
        table.data-table th, table.data-table td { border: 1px solid #cbd5e1; padding: 6px 8px; text-align: left; }
        table.data-table th { background-color: #f8fafc; font-weight: bold; color: #1e3a8a; font-size: 10px; text-transform: uppercase; }
        table.data-table tr:nth-child(even) { background-color: #fafafa; }
        
        .footer { text-align: center; margin-top: 30px; font-size: 9px; color: #94a3b8; border-top: 1px solid #e2e8f0; padding-top: 10px; }
    </style>
</head>
<body>

    <div class="header">
        <table>
            <tr>
                <td style="width: 50px; padding-right: 12px; vertical-align: top; border: none;">
                    <img src="{{ public_path('images/logo-stikes.png') }}" style="height: 52px; width: auto; object-fit: contain;">
                </td>
                <td style="vertical-align: top; border: none;">
                    <h1>{{ $employee->full_name }}</h1>
                    <p>{{ $employee->position?->name ?? 'Pegawai' }} — {{ $employee->department?->name ?? 'STIKes Panti Waluya Malang' }}</p>
                    <p>NIK/NIP: {{ $employee->nik ?? '—' }} • Status Kerja: {{ \App\Models\Employee::$employmentStatusLabels[$employee->employment_status] ?? $employee->employment_status }}</p>
                </td>
                <td style="text-align: right; vertical-align: bottom; border: none;">
                    <p style="font-weight: bold; color: #2563eb; margin: 0 0 2px 0;">CURRICULUM VITAE</p>
                    <p style="font-size: 8.5px; margin: 0; color: #64748b;">Dicetak: {{ now()->translatedFormat('d F Y H:i') }}</p>
                </td>
            </tr>
        </table>
    </div>

    <div class="section-title">Informasi Pribadi & Kepegawaian</div>
    <table class="profile-table">
        <tr>
            <td class="label">Nama Lengkap</td>
            <td class="value">: <strong>{{ $employee->full_name }}</strong></td>
        </tr>
        <tr>
            <td class="label">NIP / NIK</td>
            <td class="value">: {{ $employee->nik ?? '—' }}</td>
        </tr>
        <tr>
            <td class="label">Tempat, Tanggal Lahir</td>
            <td class="value">: {{ $employee->birth_place ?? '—' }}{{ $employee->birth_date ? ', ' . $employee->birth_date->format('d F Y') : '' }}</td>
        </tr>
        <tr>
            <td class="label">Jenis Kelamin</td>
            <td class="value">: {{ $employee->gender === 'L' ? 'Laki-laki' : ($employee->gender === 'P' ? 'Perempuan' : '—') }}</td>
        </tr>
        <tr>
            <td class="label">Status Pernikahan</td>
            <td class="value">: {{ \App\Models\Employee::$maritalStatusLabels[$employee->marital_status] ?? '—' }}</td>
        </tr>
        <tr>
            <td class="label">Alamat Lengkap</td>
            <td class="value">: {{ $employee->address ?? '—' }}</td>
        </tr>
        <tr>
            <td class="label">Kontak Karyawan</td>
            <td class="value">: Telepon: {{ $employee->phone ?? '—' }} | Email: {{ $employee->email ?? '—' }}</td>
        </tr>
        <tr>
            <td class="label">Mulai Bekerja</td>
            <td class="value">: {{ $employee->join_date?->format('d F Y') ?? '—' }} (Masa Kerja: {{ $employee->work_duration ?? '—' }})</td>
        </tr>
        @if($employee->notes)
        <tr>
            <td class="label">Catatan Tambahan</td>
            <td class="value">: {{ $employee->notes }}</td>
        </tr>
        @endif
    </table>

    <div class="section-title">Riwayat Pendidikan Formal</div>
    @if($employee->educations->isNotEmpty())
    <table class="data-table">
        <thead>
            <tr>
                <th style="width: 15%">Jenjang</th>
                <th style="width: 50%">Nama Institusi / Sekolah</th>
                <th style="width: 20%">Jurusan</th>
                <th style="width: 15%">Tahun Lulus</th>
            </tr>
        </thead>
        <tbody>
            @foreach($employee->educations->sortByDesc('graduation_year') as $edu)
            <tr>
                <td><strong>{{ $edu->level }}</strong></td>
                <td>{{ $edu->institution }}</td>
                <td>{{ $edu->major ?? '—' }}</td>
                <td>{{ $edu->graduation_year ?? '—' }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
    @else
    <p style="color: #64748b; font-style: italic; margin-left: 6px;">Belum ada riwayat pendidikan yang tercatat.</p>
    @endif

    <div class="section-title">Pelatihan, Lisensi & Sertifikasi</div>
    @if($employee->trainings->isNotEmpty())
    <table class="data-table">
        <thead>
            <tr>
                <th style="width: 20%">Tipe</th>
                <th style="width: 45%">Nama Pelatihan / Sertifikasi</th>
                <th style="width: 20%">Penyelenggara</th>
                <th style="width: 15%">Masa Berlaku</th>
            </tr>
        </thead>
        <tbody>
            @foreach($employee->trainings->sortByDesc('start_date') as $trg)
            <tr>
                <td><span style="font-weight: bold; color: #475569;">{{ ucfirst($trg->type) }}</span></td>
                <td>{{ $trg->name }}</td>
                <td>{{ $trg->organizer ?? '—' }}</td>
                <td>{{ $trg->expiry_date ? $trg->expiry_date->format('d/m/Y') : 'Seumur Hidup' }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
    @else
    <p style="color: #64748b; font-style: italic; margin-left: 6px;">Belum ada riwayat pelatihan/sertifikasi yang tercatat.</p>
    @endif

    <div class="section-title">Data Keluarga & Tanggungan</div>
    @if($employee->families->isNotEmpty())
    <table class="data-table">
        <thead>
            <tr>
                <th style="width: 25%">Hubungan</th>
                <th style="width: 45%">Nama Lengkap</th>
                <th style="width: 30%">Pekerjaan / Keterangan</th>
            </tr>
        </thead>
        <tbody>
            @foreach($employee->families as $fam)
            <tr>
                <td><strong>{{ ucfirst($fam->relation) }}</strong></td>
                <td>{{ $fam->full_name }}</td>
                <td>{{ $fam->occupation ?? '—' }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
    @else
    <p style="color: #64748b; font-style: italic; margin-left: 6px;">Belum ada data anggota keluarga yang tercatat.</p>
    @endif

    <div class="footer">
        {{ $sys_settings['app_name'] ?? 'PRISMA-PW' }} — Sekolah Tinggi Ilmu Kesehatan Panti Waluya Malang
    </div>

</body>
</html>
