@extends('layouts.app')
@section('title', 'Dashboard')
@section('page-title', 'Dashboard')

@section('content')
{{-- Stats Row --}}
<div class="row g-3 mb-4">
    <div class="col-sm-6 col-xl-3">
        <div class="stat-card" style="background:linear-gradient(135deg,#1d4ed8,#3b82f6)">
            <div class="stat-icon"><i class="bi bi-people-fill"></i></div>
            <div>
                <div class="stat-value">{{ number_format($stats['total_active']) }}</div>
                <div class="stat-label">Total Pegawai Aktif</div>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-xl-3">
        <div class="stat-card" style="background:linear-gradient(135deg,#059669,#10b981)">
            <div class="stat-icon"><i class="bi bi-person-plus-fill"></i></div>
            <div>
                <div class="stat-value">{{ $stats['new_this_month'] }}</div>
                <div class="stat-label">Pegawai Baru Bulan Ini</div>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-xl-3">
        <div class="stat-card" style="background:linear-gradient(135deg,#dc2626,#ef4444)">
            <div class="stat-icon"><i class="bi bi-person-dash-fill"></i></div>
            <div>
                <div class="stat-value">{{ $stats['resign_this_month'] }}</div>
                <div class="stat-label">Resign Bulan Ini</div>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-xl-3">
        <div class="stat-card" style="background:linear-gradient(135deg,#7c3aed,#8b5cf6)">
            <div class="stat-icon"><i class="bi bi-archive-fill"></i></div>
            <div>
                <div class="stat-value">{{ number_format($stats['total_inactive']) }}</div>
                <div class="stat-label">Total Arsip Resign</div>
            </div>
        </div>
    </div>
</div>

{{-- Alerts Row --}}
@php $alertCount = $expiringDocuments->count() + $expiringContracts->count(); @endphp
@if($alertCount > 0)
<div class="alert alert-expiry alert-dismissible fade show d-flex align-items-start gap-3 mb-4" role="alert">
    <i class="bi bi-exclamation-triangle-fill text-warning fs-5 mt-1"></i>
    <div class="flex-grow-1">
        <strong>Perhatian!</strong> Terdapat <strong>{{ $alertCount }}</strong> item yang memerlukan perhatian segera:
        @if($expiringDocuments->count() > 0)
        <span class="badge bg-warning text-dark ms-1">{{ $expiringDocuments->count() }} dokumen kedaluwarsa</span>
        @endif
        @if($expiringContracts->count() > 0)
        <span class="badge bg-danger ms-1">{{ $expiringContracts->count() }} kontrak berakhir</span>
        @endif
        <div class="mt-2" style="font-size:13px">
            @foreach($expiringContracts->take(3) as $emp)
            <div>🔴 Kontrak <strong>{{ $emp->full_name }}</strong> berakhir {{ $emp->contract_end_date->diffForHumans() }}</div>
            @endforeach
            @foreach($expiringDocuments->take(3) as $doc)
            <div>🟡 Dokumen <strong>{{ $doc->name }}</strong> ({{ $doc->employee->full_name }}) kedaluwarsa {{ $doc->expiry_date->diffForHumans() }}</div>
            @endforeach
        </div>
    </div>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
@endif

{{-- Charts & Tables --}}
<div class="row g-4 mb-4">
    {{-- Status Kepegawaian --}}
    <div class="col-lg-4">
        <div class="card h-100">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h6 class="mb-0 fw-bold"><i class="bi bi-pie-chart-fill text-primary me-2"></i>Status Kepegawaian</h6>
            </div>
            <div class="card-body d-flex align-items-center justify-content-center">
                <canvas id="statusChart" style="max-height:220px"></canvas>
            </div>
        </div>
    </div>

    {{-- Gender --}}
    <div class="col-lg-4">
        <div class="card h-100">
            <div class="card-header">
                <h6 class="mb-0 fw-bold"><i class="bi bi-gender-ambiguous text-success me-2"></i>Jenis Kelamin</h6>
            </div>
            <div class="card-body d-flex align-items-center justify-content-center">
                <canvas id="genderChart" style="max-height:220px"></canvas>
            </div>
        </div>
    </div>

    {{-- Top Departments --}}
    <div class="col-lg-4">
        <div class="card h-100">
            <div class="card-header">
                <h6 class="mb-0 fw-bold"><i class="bi bi-diagram-3-fill text-purple me-2" style="color:#7c3aed"></i>Departemen Terbesar</h6>
            </div>
            <div class="card-body" style="overflow-y:auto">
                @forelse($byDepartment as $dept)
                <div class="d-flex align-items-center gap-3 mb-2">
                    <div style="font-size:12px;width:120px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;color:#374151">
                        {{ $dept->name }}
                    </div>
                    <div class="flex-grow-1">
                        <div class="progress" style="height:6px;border-radius:3px">
                            <div class="progress-bar" style="width:{{ $byDepartment->max('employees_count') > 0 ? ($dept->employees_count / $byDepartment->max('employees_count') * 100) : 0 }}%;background:#3b82f6"></div>
                        </div>
                    </div>
                    <span style="font-size:12px;font-weight:600;color:#0f172a;width:20px;text-align:right">{{ $dept->employees_count }}</span>
                </div>
                @empty
                <p class="text-muted text-center small">Belum ada data</p>
                @endforelse
            </div>
        </div>
    </div>
</div>

{{-- Recent Employees --}}
<div class="card">
    <div class="card-header d-flex align-items-center justify-content-between">
        <h6 class="mb-0 fw-bold"><i class="bi bi-clock-history text-primary me-2"></i>Pegawai Terbaru</h6>
        <a href="{{ route('employees.index') }}" class="btn btn-sm btn-outline-primary">Lihat Semua</a>
    </div>
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead class="table-light">
                    <tr>
                        <th>Pegawai</th>
                        <th>NIK</th>
                        <th>Departemen</th>
                        <th>Jabatan</th>
                        <th>Status</th>
                        <th>Bergabung</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($recentEmployees as $emp)
                    <tr>
                        <td>
                            <div class="d-flex align-items-center gap-2">
                                @if($emp->photo)
                                <img src="{{ asset('storage/'.$emp->photo) }}" class="emp-initials-sm" style="object-fit:cover">
                                @else
                                <div class="emp-initials-sm">{{ substr($emp->full_name, 0, 1) }}</div>
                                @endif
                                <span class="fw-medium" style="font-size:13px">{{ $emp->full_name }}</span>
                            </div>
                        </td>
                        <td><code style="font-size:12px">{{ $emp->nik }}</code></td>
                        <td style="font-size:13px">{{ $emp->department?->name ?? '—' }}</td>
                        <td style="font-size:13px">{{ $emp->position?->name ?? '—' }}</td>
                        <td>
                            @php
                                $colors = ['tetap'=>'success','kontrak'=>'primary','magang'=>'secondary','probation'=>'warning'];
                                $labels = \App\Models\Employee::$employmentStatusLabels;
                            @endphp
                            <span class="badge badge-status bg-{{ $colors[$emp->employment_status] ?? 'secondary' }}">
                                {{ $labels[$emp->employment_status] ?? $emp->employment_status }}
                            </span>
                        </td>
                        <td style="font-size:13px">{{ $emp->join_date?->format('d M Y') ?? '—' }}</td>
                        <td>
                            <a href="{{ route('employees.show', $emp) }}" class="btn btn-sm btn-outline-secondary">
                                <i class="bi bi-eye"></i>
                            </a>
                        </td>
                    </tr>
                    @empty
                    <tr><td colspan="7" class="text-center text-muted py-4">Belum ada data pegawai</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
// Status Kepegawaian Chart
const statusCtx = document.getElementById('statusChart').getContext('2d');
new Chart(statusCtx, {
    type: 'doughnut',
    data: {
        labels: {!! json_encode(collect(\App\Models\Employee::$employmentStatusLabels)->only($byStatus->keys())->values()) !!},
        datasets: [{
            data: {!! $byStatus->values() !!},
            backgroundColor: ['#10b981','#3b82f6','#8b5cf6','#f59e0b'],
            borderWidth: 0, hoverOffset: 6
        }]
    },
    options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { position: 'bottom', labels: { font: { size: 12 }, boxWidth: 14, padding: 12 } } }
    }
});

// Gender Chart
const genderCtx = document.getElementById('genderChart').getContext('2d');
new Chart(genderCtx, {
    type: 'doughnut',
    data: {
        labels: ['Laki-laki', 'Perempuan'],
        datasets: [{
            data: [{{ $byGender->get('L', 0) }}, {{ $byGender->get('P', 0) }}],
            backgroundColor: ['#3b82f6','#ec4899'],
            borderWidth: 0, hoverOffset: 6
        }]
    },
    options: {
        responsive: true, maintainAspectRatio: false,
        plugins: { legend: { position: 'bottom', labels: { font: { size: 12 }, boxWidth: 14, padding: 12 } } }
    }
});
</script>
@endpush
