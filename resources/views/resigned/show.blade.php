@extends('layouts.app')
@section('title', 'Arsip Pegawai - ' . $employee->full_name)
@section('page-title', 'Detail Arsip Resign')

@section('content')
<div class="d-flex align-items-center justify-content-between mb-4">
    <a href="{{ route('resigned.index') }}" class="btn btn-sm btn-outline-secondary">
        <i class="bi bi-arrow-left me-1"></i>Kembali ke Arsip
    </a>
    @if(!auth()->user()->isGuest())
    <form method="POST" action="{{ route('resigned.restore', $employee->id) }}" onsubmit="return confirm('Pulihkan pegawai ini ke status aktif?')">
        @csrf
        <button type="submit" class="btn btn-success btn-sm">
            <i class="bi bi-arrow-counterclockwise me-1"></i>Pulihkan ke Pegawai Aktif
        </button>
    </form>
    @endif
</div>

{{-- Header Banner --}}
<div class="card mb-4 border-start border-danger border-4">
    <div class="card-body">
        <div class="row align-items-center g-3">
            <div class="col-auto">
                <div class="emp-initials bg-secondary">{{ substr($employee->full_name, 0, 1) }}</div>
            </div>
            <div class="col">
                <div class="d-flex align-items-center gap-2 mb-1">
                    <h4 class="mb-0 fw-bold" style="color:#0f172a">{{ $employee->full_name }}</h4>
                    <span class="badge bg-danger">NON-AKTIF / RESIGN</span>
                </div>
                <div class="text-muted" style="font-size:14px">
                    NIK: <code>{{ $employee->nik }}</code> • Ex-{{ $employee->position?->name ?? '—' }} ({{ $employee->department?->name ?? '—' }})
                </div>
            </div>
        </div>
    </div>
</div>

@php $detail = $employee->resignationDetail; @endphp

<div class="row g-4 mb-4">
    {{-- Detail Pengakhiran Kerja --}}
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-header bg-light d-flex justify-content-between align-items-center">
                <h6 class="mb-0 fw-bold text-danger"><i class="bi bi-file-earmark-x-fill me-2"></i>Detail Pengakhiran Kerja</h6>
                @if(!auth()->user()->isGuest())
                <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#editResignationModal">
                    <i class="bi bi-pencil-square me-1"></i>Edit Alasan
                </button>
                @endif
            </div>
            <div class="card-body">
                <div class="row py-2 border-bottom" style="font-size:13px">
                    <div class="col-5 text-muted fw-medium">Tanggal Resmi Keluar</div>
                    <div class="col-7 fw-bold text-dark">{{ $detail?->resignation_date?->format('d M Y') ?? $employee->deleted_at?->format('d M Y') }}</div>
                </div>
                <div class="row py-2 border-bottom" style="font-size:13px">
                    <div class="col-5 text-muted fw-medium">Alasan Pengakhiran</div>
                    <div class="col-7">
                        <span class="badge bg-secondary">
                            {{ \App\Models\ResignationDetail::$reasonLabels[$detail?->reason] ?? '—' }}
                        </span>
                    </div>
                </div>
                <div class="row py-2 border-bottom" style="font-size:13px">
                    <div class="col-5 text-muted fw-medium">Detail Alasan</div>
                    <div class="col-7">{{ $detail?->reason_detail ?? '—' }}</div>
                </div>
                <div class="row py-2 border-bottom" style="font-size:13px">
                    <div class="col-5 text-muted fw-medium">Status Clearance Aset</div>
                    <div class="col-7">
                        @php
                            $cStatus = $detail?->clearance_status ?? 'pending';
                            $cColors = ['pending'=>'warning','process'=>'info','completed'=>'success'];
                        @endphp
                        <span class="badge bg-{{ $cColors[$cStatus] ?? 'secondary' }}">
                            {{ \App\Models\ResignationDetail::$clearanceStatusLabels[$cStatus] ?? $cStatus }}
                        </span>
                    </div>
                </div>
                <div class="row py-2 border-bottom" style="font-size:13px">
                    <div class="col-5 text-muted fw-medium">Catatan Clearance</div>
                    <div class="col-7">{{ $detail?->clearance_notes ?? '—' }}</div>
                </div>
                <div class="row py-2" style="font-size:13px">
                    <div class="col-5 text-muted fw-medium">Diarsipkan Pada</div>
                    <div class="col-7">{{ $employee->deleted_at?->format('d M Y H:i') }}</div>
                </div>
            </div>
        </div>
    </div>

    {{-- Dokumen Keluar (Exit Documents) --}}
    <div class="col-md-6">
        <div class="card h-100">
            <div class="card-header bg-light d-flex justify-content-between align-items-center">
                <h6 class="mb-0 fw-bold"><i class="bi bi-folder-symlink-fill me-2 text-warning"></i>Dokumen Keluar (Exit Documents)</h6>
                @if(!auth()->user()->isGuest())
                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#uploadExitDocModal">
                    <i class="bi bi-upload me-1"></i>Upload Dokumen Keluar
                </button>
                @endif
            </div>
            <div class="card-body p-0">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr>
                        <th>Dokumen</th><th>Tipe</th><th>Ukuran</th><th>Aksi</th>
                    </tr></thead>
                    <tbody>
                        @forelse($employee->documents as $doc)
                        <tr style="font-size:13px">
                            <td>
                                <i class="bi bi-file-earmark-pdf-fill text-danger me-1"></i>
                                {{ $doc->name }}
                            </td>
                            <td><span class="badge bg-secondary">{{ \App\Models\EmployeeDocument::$typeLabels[$doc->type] ?? $doc->type }}</span></td>
                            <td>{{ $doc->file_size ?? '—' }}</td>
                            <td>
                                <a href="{{ route('documents.download', $doc) }}" class="btn btn-sm btn-outline-success">
                                    <i class="bi bi-download"></i>
                                </a>
                            </td>
                        </tr>
                        @empty
                        <tr><td colspan="4" class="text-center text-muted py-4">Belum ada dokumen keluar diunggah</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

{{-- Upload Exit Doc Modal --}}
<div class="modal fade" id="uploadExitDocModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Upload Dokumen Keluar</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form method="POST" action="{{ route('documents.store', $employee->id) }}" enctype="multipart/form-data">
                @csrf
                <div class="modal-body row g-3">
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Tipe Dokumen</label>
                        <select name="type" class="form-select" required>
                            <option value="sk_jabatan">Surat Keterangan Kerja (Paklaring)</option>
                            <option value="kontrak_kerja">Surat Pengunduran Diri</option>
                            <option value="lainnya">Form Clearance Aset / Exit Interview</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Nama Dokumen</label>
                        <input type="text" name="name" class="form-control" placeholder="misal: Paklaring - Budi Santoso" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">File PDF/Gambar</label>
                        <input type="file" name="file" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary"><i class="bi bi-upload me-1"></i>Upload</button>
                </div>
            </form>
        </div>
    </div>
</div>

@if(!auth()->user()->isGuest())
{{-- Edit Resignation Modal --}}
<div class="modal fade" id="editResignationModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title fw-bold text-danger">Edit Detail Pengakhiran Kerja</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form method="POST" action="{{ route('resigned.update-resignation', $employee->id) }}">
                @csrf
                @method('PUT')
                <div class="modal-body row g-3">
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Tanggal Resmi Keluar</label>
                        <input type="date" name="resignation_date" class="form-control" value="{{ $detail?->resignation_date?->format('Y-m-d') ?? $employee->deleted_at?->format('Y-m-d') }}" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Tanggal Diarsipkan (Sistem)</label>
                        <input type="date" name="deleted_at" class="form-control" value="{{ $employee->deleted_at?->format('Y-m-d') }}" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Alasan Pengakhiran</label>
                        <select name="reason" class="form-select" required>
                            @foreach(\App\Models\ResignationDetail::$reasonLabels as $key => $label)
                                <option value="{{ $key }}" {{ ($detail?->reason === $key) ? 'selected' : '' }}>{{ $label }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Detail Alasan / Keterangan</label>
                        <textarea name="reason_detail" class="form-control" rows="3" placeholder="Masukkan detail alasan pengunduran diri/pemutusan hubungan kerja...">{{ $detail?->reason_detail }}</textarea>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Status Clearance Aset</label>
                        <select name="clearance_status" class="form-select" required>
                            @foreach(\App\Models\ResignationDetail::$clearanceStatusLabels as $key => $label)
                                <option value="{{ $key }}" {{ (($detail?->clearance_status ?? 'pending') === $key) ? 'selected' : '' }}>{{ $label }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Catatan Clearance</label>
                        <textarea name="clearance_notes" class="form-control" rows="2" placeholder="Detail pengembalian laptop, kunci, email kantor, dll...">{{ $detail?->clearance_notes }}</textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary"><i class="bi bi-save me-1"></i>Simpan Perubahan</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endif
@endsection
