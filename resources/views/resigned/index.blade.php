@extends('layouts.app')
@section('title', 'Arsip Pegawai Resign')
@section('page-title', 'Arsip Pegawai Resign / Non-Aktif')

@section('content')
<div class="d-flex align-items-center justify-content-between mb-4">
    <div>
        <h4 class="mb-1 fw-bold" style="color:#0f172a">Arsip Mantan Pegawai</h4>
        <p class="text-muted mb-0" style="font-size:13px">Kelola data pegawai non-aktif (soft delete), pencarian historis, dan verifikasi ulang</p>
    </div>
</div>

{{-- Filter Card --}}
<div class="card mb-4">
    <div class="card-body py-3">
        <form method="GET" action="{{ route('resigned.index') }}" class="row g-2 align-items-end">
            <div class="col-md-5">
                <label class="form-label mb-1" style="font-size:12px;font-weight:600">Pencarian Historis</label>
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="bi bi-search text-muted"></i></span>
                    <input type="text" name="search" class="form-control" placeholder="Nama atau NIK..."
                           value="{{ request('search') }}">
                </div>
            </div>
            <div class="col-md-3">
                <label class="form-label mb-1" style="font-size:12px;font-weight:600">Alasan Keluar</label>
                <select name="reason" class="form-select">
                    <option value="">Semua Alasan</option>
                    @foreach(\App\Models\ResignationDetail::$reasonLabels as $v => $l)
                    <option value="{{ $v }}" {{ request('reason') == $v ? 'selected' : '' }}>{{ $l }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-2">
                <label class="form-label mb-1" style="font-size:12px;font-weight:600">Tahun Keluar</label>
                <select name="year" class="form-select">
                    <option value="">Semua Tahun</option>
                    @foreach($years as $y)
                    <option value="{{ $y }}" {{ request('year') == $y ? 'selected' : '' }}>{{ $y }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-2 d-flex gap-2">
                <button type="submit" class="btn btn-primary flex-grow-1">
                    <i class="bi bi-funnel-fill"></i> Filter
                </button>
                @if(request()->anyFilled(['search','reason','year']))
                <a href="{{ route('resigned.index') }}" class="btn btn-outline-secondary">
                    <i class="bi bi-x-lg"></i>
                </a>
                @endif
            </div>
        </form>
    </div>
</div>

{{-- Table --}}
<div class="card">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead class="table-light">
                    <tr>
                        <th style="width:40px">#</th>
                        <th>Mantan Pegawai</th>
                        <th>NIK</th>
                        <th>Departemen & Jabatan</th>
                        <th>Tgl Resmi Keluar</th>
                        <th>Alasan Pengakhiran</th>
                        <th>Clearance Status</th>
                        <th style="width:140px">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($employees as $emp)
                    @php $detail = $emp->resignationDetail; @endphp
                    <tr>
                        <td class="text-muted" style="font-size:12px">{{ $employees->firstItem() + $loop->index }}</td>
                        <td>
                            <div class="d-flex align-items-center gap-2">
                                <div class="emp-initials-sm bg-secondary">{{ substr($emp->full_name, 0, 1) }}</div>
                                <div>
                                    <div class="fw-medium" style="font-size:13px">{{ $emp->full_name }}</div>
                                    <div class="text-muted" style="font-size:11px">{{ $emp->phone ?? $emp->email ?? '—' }}</div>
                                </div>
                            </div>
                        </td>
                        <td><code style="font-size:12px">{{ $emp->nik }}</code></td>
                        <td>
                            <div style="font-size:13px">{{ $emp->department?->name ?? '—' }}</div>
                            <div class="text-muted" style="font-size:11px">{{ $emp->position?->name ?? '—' }}</div>
                        </td>
                        <td style="font-size:13px">
                            {{ $detail?->resignation_date?->format('d M Y') ?? $emp->deleted_at?->format('d M Y') }}
                        </td>
                        <td>
                            <span class="badge bg-secondary">
                                {{ \App\Models\ResignationDetail::$reasonLabels[$detail?->reason] ?? '—' }}
                            </span>
                        </td>
                        <td>
                            @php
                                $cStatus = $detail?->clearance_status ?? 'pending';
                                $cColors = ['pending'=>'warning','process'=>'info','completed'=>'success'];
                            @endphp
                            <span class="badge bg-{{ $cColors[$cStatus] ?? 'secondary' }}">
                                {{ \App\Models\ResignationDetail::$clearanceStatusLabels[$cStatus] ?? $cStatus }}
                            </span>
                        </td>
                        <td>
                            <div class="d-flex gap-1">
                                <a href="{{ route('resigned.show', $emp->id) }}" class="btn btn-sm btn-outline-secondary" title="Detail & Dokumen Keluar">
                                    <i class="bi bi-eye"></i>
                                </a>
                                @if(!auth()->user()->isGuest())
                                <form method="POST" action="{{ route('resigned.restore', $emp->id) }}" onsubmit="return confirm('Pulihkan pegawai ini kembali ke status aktif?')">
                                    @csrf
                                    <button type="submit" class="btn btn-sm btn-outline-success" title="Pulihkan ke Aktif">
                                        <i class="bi bi-arrow-counterclockwise"></i>
                                    </button>
                                </form>
                                @endif
                                @if(auth()->user()->isAdminIT())
                                <form method="POST" action="{{ route('resigned.force-delete', $emp->id) }}" onsubmit="return confirm('Hapus permanen data ini? Tindakan ini tidak dapat dibatalkan!')">
                                    @csrf @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-outline-danger" title="Hapus Permanen (Admin IT)">
                                        <i class="bi bi-trash"></i>
                                    </button>
                                </form>
                                @endif
                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="8" class="text-center py-5 text-muted">
                            <i class="bi bi-archive fs-1 d-block mb-2"></i>
                            Tidak ada arsip mantan pegawai ditemukan
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
            Menampilkan {{ $employees->firstItem() }}–{{ $employees->lastItem() }} dari {{ $employees->total() }} mantan pegawai
        </div>
        {{ $employees->links('pagination::bootstrap-5') }}
    </div>
    @endif
</div>
@endsection
