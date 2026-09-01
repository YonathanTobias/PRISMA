@extends('layouts.app')
@section('title', 'Laporan & Statistik')
@section('page-title', 'Laporan & Statistik Kepegawaian')

@section('content')
<div class="d-flex align-items-center justify-content-between mb-4">
    <div>
        <h4 class="mb-1 fw-bold" style="color:#0f172a">Laporan & Rekap Kepegawaian</h4>
        <p class="text-muted mb-0" style="font-size:13px">Rekapitulasi data kepegawaian demografi, status, dan statistik turnover</p>
    </div>
    <div class="d-flex gap-2">
        <a href="{{ route('reports.export', array_merge(request()->all(), ['format'=>'excel'])) }}" class="btn btn-success btn-sm">
            <i class="bi bi-file-earmark-excel-fill me-1"></i>Export Excel
        </a>
        <a href="{{ route('reports.export', array_merge(request()->all(), ['format'=>'pdf'])) }}" class="btn btn-danger btn-sm" target="_blank">
            <i class="bi bi-file-earmark-pdf-fill me-1"></i>Export PDF
        </a>
    </div>
</div>

{{-- Navigation Pills --}}
<ul class="nav nav-pills mb-4">
    <li class="nav-item">
        <a class="nav-link {{ $type === 'demografi' ? 'active' : '' }}" href="{{ route('reports.index', ['type'=>'demografi']) }}">
            <i class="bi bi-people-fill me-1"></i>Laporan Demografi
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link {{ $type === 'status' ? 'active' : '' }}" href="{{ route('reports.index', ['type'=>'status']) }}">
            <i class="bi bi-patch-check-fill me-1"></i>Status Kepegawaian
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link {{ $type === 'turnover' ? 'active' : '' }}" href="{{ route('reports.index', ['type'=>'turnover']) }}">
            <i class="bi bi-graph-down-arrow me-1"></i>Statistik Turnover
        </a>
    </li>
</ul>

{{-- Filter Card --}}
<div class="card mb-4">
    <div class="card-body py-3">
        <form method="GET" action="{{ route('reports.index') }}" class="row g-2 align-items-end">
            <input type="hidden" name="type" value="{{ $type }}">
            @if($type !== 'turnover')
            <div class="col-md-4">
                <label class="form-label mb-1" style="font-size:12px;font-weight:600">Departemen</label>
                <select name="department_id" class="form-select" onchange="this.form.submit()">
                    <option value="">Semua Departemen</option>
                    @foreach($departments as $dept)
                    <option value="{{ $dept->id }}" {{ $dept_id == $dept->id ? 'selected' : '' }}>{{ $dept->name }}</option>
                    @endforeach
                </select>
            </div>
            @else
            <div class="col-md-3">
                <label class="form-label mb-1" style="font-size:12px;font-weight:600">Tahun Keluar</label>
                <select name="year" class="form-select" onchange="this.form.submit()">
                    <option value="all" {{ $year === 'all' || empty($year) ? 'selected' : '' }}>Semua Tahun</option>
                    @foreach($years as $y)
                    <option value="{{ $y }}" {{ $year == $y && $year !== 'all' ? 'selected' : '' }}>{{ $y }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label mb-1" style="font-size:12px;font-weight:600">Bulan</label>
                <select name="month" class="form-select" onchange="this.form.submit()">
                    <option value="">Semua Bulan</option>
                    @for($m=1;$m<=12;$m++)
                    <option value="{{ $m }}" {{ $month == $m ? 'selected' : '' }}>
                        {{ \Carbon\Carbon::create(2024, $m, 1)->translatedFormat('F') }}
                    </option>
                    @endfor
                </select>
            </div>
            @endif
        </form>
    </div>
</div>

{{-- Content per Type --}}
@if($type === 'demografi')
<div class="row g-4 mb-4">
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-header"><h6 class="mb-0 fw-bold"><i class="bi bi-gender-ambiguous text-primary me-2"></i>Berdasarkan Jenis Kelamin</h6></div>
            <div class="card-body">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr><th>Jenis Kelamin</th><th class="text-end">Jumlah</th></tr></thead>
                    <tbody>
                        @foreach($data['by_gender'] as $g)
                        <tr>
                            <td>{{ $g->gender === 'L' ? 'Laki-laki' : 'Perempuan' }}</td>
                            <td class="text-end fw-bold">{{ $g->total }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-header"><h6 class="mb-0 fw-bold"><i class="bi bi-calendar-event text-success me-2"></i>Berdasarkan Kelompok Usia</h6></div>
            <div class="card-body">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr><th>Rentang Usia</th><th class="text-end">Jumlah</th></tr></thead>
                    <tbody>
                        @foreach($data['age_groups'] as $group => $count)
                        <tr>
                            <td>{{ $group }}</td>
                            <td class="text-end fw-bold">{{ $count }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-header"><h6 class="mb-0 fw-bold"><i class="bi bi-mortarboard text-warning me-2"></i>Berdasarkan Pendidikan</h6></div>
            <div class="card-body">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr><th>Jenjang</th><th class="text-end">Jumlah</th></tr></thead>
                    <tbody>
                        @foreach($data['by_education'] as $edu)
                        <tr>
                            <td>{{ $edu->level }}</td>
                            <td class="text-end fw-bold">{{ $edu->total }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-header"><h6 class="mb-0 fw-bold"><i class="bi bi-building text-info me-2"></i>Berdasarkan Departemen</h6></div>
            <div class="card-body">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr><th>Departemen</th><th class="text-end">Jumlah Pegawai</th></tr></thead>
                    <tbody>
                        @foreach($data['by_department'] as $dept)
                        <tr>
                            <td>{{ $dept->name }}</td>
                            <td class="text-end fw-bold">{{ $dept->employees_count }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

@elseif($type === 'status')
<div class="row g-4 mb-4">
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-header"><h6 class="mb-0 fw-bold"><i class="bi bi-pie-chart-fill text-primary me-2"></i>Perbandingan Tetap vs Kontrak</h6></div>
            <div class="card-body">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr><th>Status Kepegawaian</th><th class="text-end">Jumlah</th></tr></thead>
                    <tbody>
                        @foreach($data['by_employment_status'] as $st)
                        <tr>
                            <td>{{ \App\Models\Employee::$employmentStatusLabels[$st->employment_status] ?? $st->employment_status }}</td>
                            <td class="text-end fw-bold">{{ $st->total }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-header"><h6 class="mb-0 fw-bold text-danger"><i class="bi bi-clock-history me-2"></i>Kontrak Segera Berakhir (&lt; 90 Hari)</h6></div>
            <div class="card-body p-0">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr><th>Nama</th><th>Departemen</th><th>Akhir Kontrak</th></tr></thead>
                    <tbody>
                        @forelse($data['contract_expiring'] as $emp)
                        <tr style="font-size:13px">
                            <td>{{ $emp->full_name }}</td>
                            <td>{{ $emp->department?->name ?? '—' }}</td>
                            <td class="text-danger fw-semibold">{{ $emp->contract_end_date?->format('d M Y') }}</td>
                        </tr>
                        @empty
                        <tr><td colspan="3" class="text-center text-muted py-3">Tidak ada kontrak akan berakhir</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

@elseif($type === 'turnover')
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h6 class="mb-0 fw-bold">
            <i class="bi bi-person-x-fill text-danger me-2"></i>Daftar Pegawai Keluar ({{ (!empty($year) && $year !== 'all') ? 'Tahun ' . $year : 'Semua Periode / Tahun' }})
        </h6>
        <span class="badge bg-secondary">{{ count($data['employees']) }} Pegawai</span>
    </div>
    <div class="card-body p-0">
        <table class="table table-hover mb-0">
            <thead class="table-light"><tr><th>#</th><th>NIK</th><th>Nama</th><th>Departemen</th><th>Tgl Keluar</th><th>Alasan</th></tr></thead>
            <tbody>
                @forelse($data['employees'] as $index => $emp)
                <tr style="font-size:13px">
                    <td>{{ $index + 1 }}</td>
                    <td><code>{{ $emp->nik }}</code></td>
                    <td>{{ $emp->full_name }}</td>
                    <td>{{ $emp->department?->name ?? '—' }}</td>
                    <td>{{ $emp->resignationDetail?->resignation_date?->format('d M Y') ?? $emp->deleted_at->format('d M Y') }}</td>
                    <td><span class="badge bg-secondary">{{ \App\Models\ResignationDetail::$reasonLabels[$emp->resignationDetail?->reason] ?? '—' }}</span></td>
                </tr>
                @empty
                <tr><td colspan="6" class="text-center text-muted py-4">Tidak ada data pegawai keluar pada periode ini</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@endif
@endsection
