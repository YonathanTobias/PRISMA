<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Laporan PRISMA-PW — {{ ucfirst($type) }}</title>
    <style>
        body { font-family: sans-serif; font-size: 11px; color: #1e293b; }
        .header { text-align: center; border-bottom: 2px solid #0f172a; padding-bottom: 10px; margin-bottom: 20px; }
        .header h2 { margin: 0; font-size: 18px; text-transform: uppercase; color: #0f172a; }
        .header p { margin: 3px 0 0; color: #64748b; font-size: 11px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { border: 1px solid #cbd5e1; padding: 6px 8px; text-align: left; }
        th { background-color: #f1f5f9; font-weight: bold; text-transform: uppercase; font-size: 10px; color: #475569; }
        .text-right { text-align: right; }
        .footer { margin-top: 30px; font-size: 9px; color: #94a3b8; text-align: right; }
    </style>
</head>
<body>
    <div class="header">
        <table style="width: 100%; border: none; margin: 0 0 10px 0;">
            <tr>
                <td style="width: 50px; border: none; padding: 0; vertical-align: middle;">
                    <img src="{{ public_path('images/logo-stikes.png') }}" style="height: 48px;">
                </td>
                <td style="border: none; padding: 0 0 0 12px; vertical-align: middle; text-align: left;">
                    <h2 style="margin: 0; font-size: 15px; color: #0f172a; font-weight: bold; text-transform: uppercase;">STIKes Panti Waluya Malang</h2>
                    <p style="margin: 3px 0 0; color: #475569; font-size: 11px; font-weight: normal; text-transform: none;">Laporan {{ ucfirst($type) }} Kepegawaian (PRISMA-PW)</p>
                </td>
                <td style="border: none; padding: 0; vertical-align: middle; text-align: right; font-size: 8.5px; color: #64748b;">
                    Dicetak: {{ now()->translatedFormat('d F Y H:i') }}
                </td>
            </tr>
        </table>
    </div>

    @if($type === 'demografi')
        <h3>1. Berdasarkan Jenis Kelamin</h3>
        <table>
            <thead><tr><th>Jenis Kelamin</th><th class="text-right">Jumlah</th></tr></thead>
            <tbody>
                @foreach($data['by_gender'] as $g)
                <tr>
                    <td>{{ $g->gender === 'L' ? 'Laki-laki' : 'Perempuan' }}</td>
                    <td class="text-right">{{ $g->total }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        <h3>2. Berdasarkan Kelompok Usia</h3>
        <table>
            <thead><tr><th>Rentang Usia</th><th class="text-right">Jumlah</th></tr></thead>
            <tbody>
                @foreach($data['age_groups'] as $group => $count)
                <tr>
                    <td>{{ $group }}</td>
                    <td class="text-right">{{ $count }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    @elseif($type === 'status')
        <h3>Perbandingan Status Kepegawaian</h3>
        <table>
            <thead><tr><th>Status Kepegawaian</th><th class="text-right">Jumlah</th></tr></thead>
            <tbody>
                @foreach($data['by_employment_status'] as $st)
                <tr>
                    <td>{{ \App\Models\Employee::$employmentStatusLabels[$st->employment_status] ?? $st->employment_status }}</td>
                    <td class="text-right">{{ $st->total }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    @elseif($type === 'turnover')
        <h3>Daftar Pegawai Keluar</h3>
        <table>
            <thead><tr><th>#</th><th>NIK</th><th>Nama Pegawai</th><th>Departemen</th><th>Tanggal Keluar</th><th>Alasan</th></tr></thead>
            <tbody>
                @foreach($data['employees'] as $index => $emp)
                <tr>
                    <td>{{ $index + 1 }}</td>
                    <td>{{ $emp->nik }}</td>
                    <td>{{ $emp->full_name }}</td>
                    <td>{{ $emp->department?->name ?? '-' }}</td>
                    <td>{{ $emp->resignationDetail?->resignation_date?->format('d/m/Y') ?? $emp->deleted_at->format('d/m/Y') }}</td>
                    <td>{{ \App\Models\ResignationDetail::$reasonLabels[$emp->resignationDetail?->reason] ?? '-' }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    @endif

    <div class="footer">
        Dokumen ini dihasilkan secara otomatis oleh PRISMA-PW (Portal Informasi Sumber Daya Manusia Panti Waluya).
    </div>
</body>
</html>
