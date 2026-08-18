@extends('layouts.app')
@section('title', 'Data Pegawai Aktif')
@section('page-title', 'Data Pegawai Aktif')

@section('content')
{{-- Header --}}
<div class="d-flex align-items-center justify-content-between mb-4">
    <div>
        <h4 class="mb-1 fw-bold" style="color:#0f172a">Pegawai Aktif</h4>
        <p class="text-muted mb-0" style="font-size:13px">{{ $employees->total() }} pegawai ditemukan</p>
    </div>
    <div class="d-flex gap-2">
        <a href="{{ route('employees.export', array_merge(request()->all(), ['format' => 'excel'])) }}" class="btn btn-success">
            <i class="bi bi-file-earmark-excel-fill me-2"></i>Export Excel
        </a>
        <a href="{{ route('employees.export', array_merge(request()->all(), ['format' => 'pdf'])) }}" class="btn btn-danger" target="_blank">
            <i class="bi bi-file-earmark-pdf-fill me-2"></i>Export PDF
        </a>
        @if(!auth()->user()->isGuest())
        <a href="{{ route('employees.create') }}" class="btn btn-primary">
            <i class="bi bi-person-plus-fill me-2"></i>Tambah Pegawai
        </a>
        @endif
    </div>
</div>

{{-- Filter Card --}}
<div class="card mb-4">
    <div class="card-body py-3">
        <form method="GET" action="{{ route('employees.index') }}" class="row g-2 align-items-end">
            <div class="col-md-4">
                <label class="form-label mb-1" style="font-size:12px;font-weight:600">Cari Pegawai</label>
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="bi bi-search text-muted"></i></span>
                    <input type="text" name="search" class="form-control" placeholder="Nama, NIK, atau telepon..."
                           value="{{ request('search') }}">
                </div>
            </div>
            <div class="col-md-3">
                <label class="form-label mb-1" style="font-size:12px;font-weight:600">Departemen</label>
                <select name="department_id" class="form-select">
                    <option value="">Semua Departemen</option>
                    @foreach($departments as $dept)
                    <option value="{{ $dept->id }}" {{ request('department_id') == $dept->id ? 'selected' : '' }}>
                        {{ $dept->name }}
                    </option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-2">
                <label class="form-label mb-1" style="font-size:12px;font-weight:600">Status Kerja</label>
                <select name="employment_status" class="form-select">
                    <option value="">Semua Status</option>
                    @foreach(\App\Models\Employee::$employmentStatusLabels as $val => $label)
                    <option value="{{ $val }}" {{ request('employment_status') == $val ? 'selected' : '' }}>
                        {{ $label }}
                    </option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-1">
                <label class="form-label mb-1" style="font-size:12px;font-weight:600">JK</label>
                <select name="gender" class="form-select">
                    <option value="">Semua</option>
                    <option value="L" {{ request('gender') == 'L' ? 'selected' : '' }}>L</option>
                    <option value="P" {{ request('gender') == 'P' ? 'selected' : '' }}>P</option>
                </select>
            </div>
            <div class="col-md-2 d-flex gap-2">
                <button type="submit" class="btn btn-primary flex-grow-1">
                    <i class="bi bi-funnel-fill"></i> Filter
                </button>
                @if(request()->anyFilled(['search','department_id','employment_status','gender']))
                <a href="{{ route('employees.index') }}" class="btn btn-outline-secondary">
                    <i class="bi bi-x-lg"></i>
                </a>
                @endif
            </div>
        </form>
    </div>
</div>

{{-- Employee Table --}}
<div class="card">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead class="table-light">
                    <tr>
                        <th style="width:40px">#</th>
                        <th>Pegawai</th>
                        <th>NIK</th>
                        <th>Departemen / Jabatan</th>
                        <th>Status Kerja</th>
                        <th>Bergabung</th>
                        <th>Kontak</th>
                        <th style="width:120px">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($employees as $emp)
                    <tr>
                        <td class="text-muted" style="font-size:12px">{{ $employees->firstItem() + $loop->index }}</td>
                        <td>
                            <div class="d-flex align-items-center gap-2">
                                @if($emp->photo)
                                <img src="{{ asset('storage/'.$emp->photo) }}" class="emp-initials-sm" style="object-fit:cover">
                                @else
                                <div class="emp-initials-sm" style="font-size:13px">{{ substr($emp->full_name, 0, 1) }}</div>
                                @endif
                                <div>
                                    <div class="fw-medium" style="font-size:13px">{{ $emp->full_name }}</div>
                                    <div class="text-muted" style="font-size:11px">
                                        {{ $emp->gender === 'L' ? 'Laki-laki' : ($emp->gender === 'P' ? 'Perempuan' : '') }}
                                        {{ $emp->birth_date ? '• ' . $emp->age . ' tahun' : '' }}
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td><code style="font-size:12px">{{ $emp->nik }}</code></td>
                        <td>
                            <div style="font-size:13px">{{ $emp->department?->name ?? '—' }}</div>
                            <div class="text-muted" style="font-size:11px">{{ $emp->position?->name ?? '—' }}</div>
                        </td>
                        <td>
                            @php
                                $colors = ['tetap'=>'success','kontrak'=>'primary','magang'=>'secondary','probation'=>'warning'];
                                $labels = \App\Models\Employee::$employmentStatusLabels;
                            @endphp
                            <span class="badge badge-status bg-{{ $colors[$emp->employment_status] ?? 'secondary' }}">
                                {{ $labels[$emp->employment_status] ?? $emp->employment_status }}
                            </span>
                            @if($emp->contract_end_date && $emp->contract_end_date->isPast())
                                <br><span class="badge badge-status bg-danger mt-1">Kontrak Expired</span>
                            @elseif($emp->contract_end_date && $emp->contract_end_date->diffInDays(now()) >= 0 && $emp->contract_end_date->isFuture() && $emp->contract_end_date->diffInDays() <= 30)
                                <br><span class="badge badge-status bg-warning text-dark mt-1">Kontrak ~{{ $emp->contract_end_date->diffInDays() }}h</span>
                            @endif
                        </td>
                        <td style="font-size:12px">{{ $emp->join_date?->format('d M Y') ?? '—' }}</td>
                        <td style="font-size:12px">{{ $emp->phone ?? '—' }}</td>
                        <td>
                            <div class="d-flex gap-1">
                                <a href="{{ route('employees.show', $emp) }}" class="btn btn-sm btn-outline-secondary" title="Detail">
                                    <i class="bi bi-eye"></i>
                                </a>
                                @if(!auth()->user()->isGuest())
                                <a href="{{ route('employees.edit', $emp) }}" class="btn btn-sm btn-outline-primary" title="Edit">
                                    <i class="bi bi-pencil"></i>
                                </a>
                                <button type="button" class="btn btn-sm btn-outline-warning" title="Proses Resign"
                                    data-bs-toggle="modal" data-bs-target="#resignModal{{ $emp->id }}">
                                    <i class="bi bi-door-open"></i>
                                </button>
                                @endif
                            </div>
                        </td>
                    </tr>

                    {{-- Resign Modal --}}
                    <div class="modal fade" id="resignModal{{ $emp->id }}" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title"><i class="bi bi-door-open text-warning me-2"></i>Proses Resign</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <form method="POST" action="{{ route('employees.resign', $emp) }}">
                                    @csrf
                                    <div class="modal-body">
                                        <div class="alert alert-warning py-2" style="font-size:13px">
                                            <i class="bi bi-exclamation-triangle-fill me-1"></i>
                                            Pegawai <strong>{{ $emp->full_name }}</strong> akan dipindahkan ke arsip resign.
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label fw-semibold" style="font-size:13px">Tanggal Keluar</label>
                                            <input type="date" name="resignation_date" class="form-control" required value="{{ now()->format('Y-m-d') }}">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label fw-semibold" style="font-size:13px">Alasan</label>
                                            <select name="reason" class="form-select" required>
                                                @foreach(\App\Models\ResignationDetail::$reasonLabels as $val => $label)
                                                <option value="{{ $val }}">{{ $label }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label fw-semibold" style="font-size:13px">Keterangan</label>
                                            <textarea name="reason_detail" class="form-control" rows="2" placeholder="Opsional..."></textarea>
                                        </div>
                                        <div class="mb-0">
                                            <label class="form-label fw-semibold" style="font-size:13px">Status Clearance</label>
                                            <select name="clearance_status" class="form-select">
                                                @foreach(\App\Models\ResignationDetail::$clearanceStatusLabels as $val => $label)
                                                <option value="{{ $val }}">{{ $label }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                        <button type="submit" class="btn btn-warning">
                                            <i class="bi bi-archive me-1"></i>Arsipkan
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    @empty
                    <tr>
                        <td colspan="8" class="text-center py-5 text-muted">
                            <i class="bi bi-person-x fs-1 d-block mb-2"></i>
                            Tidak ada pegawai ditemukan
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
    @if($employees->hasPages())
    <div class="card-footer d-flex align-items-center justify-content-between py-3">
        <div style="font-size:13px;color:#64748b">
            Menampilkan {{ $employees->firstItem() }}–{{ $employees->lastItem() }} dari {{ $employees->total() }} pegawai
        </div>
        {{ $employees->links('pagination::bootstrap-5') }}
    </div>
    @endif
</div>
@endsection
