<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Daftar Pegawai Aktif</title>
    <style>
        body { font-family: sans-serif; font-size: 11px; color: #333; }
        .header { text-align: center; margin-bottom: 20px; }
        .header h2 { margin: 0; font-size: 18px; color: #0f172a; }
        .header p { margin: 4px 0 0; color: #64748b; font-size: 12px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { border: 1px solid #cbd5e1; padding: 8px; text-align: left; }
        th { background-color: #2563eb; color: white; font-weight: bold; text-transform: uppercase; font-size: 10px; }
        tr:nth-child(even) { background-color: #f8fafc; }
        .footer { text-align: right; margin-top: 20px; font-size: 9px; color: #94a3b8; }
    </style>
</head>
<body>

    <div class="header">
        <table style="width: 100%; border: none; margin: 0 0 15px 0;">
            <tr>
                <td style="width: 50px; border: none; padding: 0; vertical-align: middle;">
                    <img src="{{ public_path('images/logo-stikes.png') }}" style="height: 50px;">
                </td>
                <td style="border: none; padding: 0 0 0 12px; vertical-align: middle; text-align: left;">
                    <h2 style="margin: 0; font-size: 16px; color: #0f172a; font-weight: bold;">STIKes Panti Waluya Malang</h2>
                    <p style="margin: 3px 0 0; color: #475569; font-size: 11px; font-weight: normal;">Daftar Pegawai Aktif (Dosen & Tenaga Kependidikan)</p>
                </td>
                <td style="border: none; padding: 0; vertical-align: middle; text-align: right; font-size: 8.5px; color: #64748b;">
                    Dicetak: {{ now()->translatedFormat('d F Y H:i') }}
                </td>
            </tr>
        </table>
    </div>

    <table>
        <thead>
            <tr>
                <th style="width: 5%">No</th>
                <th style="width: 15%">NIP/NIK</th>
                <th style="width: 25%">Nama Lengkap</th>
                <th style="width: 10%">JK</th>
                <th style="width: 20%">Departemen / Jabatan</th>
                <th style="width: 13%">Status Kerja</th>
                <th style="width: 12%">Bergabung</th>
            </tr>
        </thead>
        <tbody>
            @foreach($employees as $index => $emp)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td><code>{{ $emp->nik ?? '—' }}</code></td>
                <td style="font-weight: bold;">{{ $emp->full_name }}</td>
                <td>{{ $emp->gender === 'L' ? 'Laki-laki' : 'Perempuan' }}</td>
                <td>
                    {{ $emp->department?->name ?? '—' }}<br>
                    <small style="color: #64748b;">{{ $emp->position?->name ?? '—' }}</small>
                </td>
                <td>{{ \App\Models\Employee::$employmentStatusLabels[$emp->employment_status] ?? $emp->employment_status }}</td>
                <td>{{ $emp->join_date?->format('d M Y') ?? '—' }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <div class="footer">
        {{ $sys_settings['app_name'] ?? 'PRISMA-PW' }} — {{ $sys_settings['institution_name'] ?? 'STIKes Panti Waluya Malang' }}
    </div>

</body>
</html>
