@extends('layouts.app')
@section('title', 'Master Data')
@section('page-title', 'Pengaturan Master Data')

@section('content')
<div class="d-flex align-items-center justify-content-between mb-4">
    <div>
        <h4 class="mb-1 fw-bold" style="color:#0f172a">Master Data Kepegawaian</h4>
        <p class="text-muted mb-0" style="font-size:13px">Kelola Unit Kerja/Departemen dan Jabatan/Posisi</p>
    </div>
</div>

<div class="row g-4">
    {{-- Departemen --}}
    <div class="col-lg-6">
        <div class="card h-100">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h6 class="mb-0 fw-bold"><i class="bi bi-building text-primary me-2"></i>Departemen / Unit Kerja</h6>
                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addDeptModal">
                    <i class="bi bi-plus-lg me-1"></i>Tambah Departemen
                </button>
            </div>
            <div class="card-body p-0">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr><th>Kode</th><th>Nama Departemen</th><th>Jumlah Pegawai</th><th style="width:90px">Aksi</th></tr></thead>
                    <tbody>
                        @forelse($departments as $dept)
                        <tr style="font-size:13px">
                            <td><code>{{ $dept->code ?? '—' }}</code></td>
                            <td class="fw-medium">{{ $dept->name }}</td>
                            <td><span class="badge bg-secondary">{{ $dept->employees_count }} orang</span></td>
                            <td>
                                <div class="d-flex gap-1">
                                    <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editDeptModal{{ $dept->id }}">
                                        <i class="bi bi-pencil"></i>
                                    </button>
                                    <form method="POST" action="{{ route('departments.destroy', $dept) }}" onsubmit="return confirm('Hapus departemen ini?')">
                                        @csrf @method('DELETE')
                                        <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                                    </form>
                                </div>
                            </td>
                        </tr>

                        {{-- Edit Dept Modal --}}
                        <div class="modal fade" id="editDeptModal{{ $dept->id }}" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header"><h5 class="modal-title">Edit Departemen</h5><button class="btn-close" data-bs-dismiss="modal"></button></div>
                                    <form method="POST" action="{{ route('departments.update', $dept) }}">
                                        @csrf @method('PUT')
                                        <div class="modal-body row g-3">
                                            <div class="col-4">
                                                <label class="form-label fw-semibold" style="font-size:13px">Kode</label>
                                                <input type="text" name="code" class="form-control" value="{{ $dept->code }}">
                                            </div>
                                            <div class="col-8">
                                                <label class="form-label fw-semibold" style="font-size:13px">Nama</label>
                                                <input type="text" name="name" class="form-control" value="{{ $dept->name }}" required>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                            <button type="submit" class="btn btn-primary">Simpan</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        @empty
                        <tr><td colspan="4" class="text-center text-muted py-4">Belum ada departemen</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    {{-- Jabatan --}}
    <div class="col-lg-6">
        <div class="card h-100">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h6 class="mb-0 fw-bold"><i class="bi bi-award text-success me-2"></i>Jabatan / Posisi</h6>
                <button class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#addPosModal">
                    <i class="bi bi-plus-lg me-1"></i>Tambah Jabatan
                </button>
            </div>
            <div class="card-body p-0">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr><th>Kode</th><th>Nama Jabatan</th><th>Departemen</th><th style="width:90px">Aksi</th></tr></thead>
                    <tbody>
                        @forelse($positions as $pos)
                        <tr style="font-size:13px">
                            <td><code>{{ $pos->code ?? '—' }}</code></td>
                            <td class="fw-medium">{{ $pos->name }}</td>
                            <td>{{ $pos->department?->name ?? '—' }}</td>
                            <td>
                                <div class="d-flex gap-1">
                                    <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editPosModal{{ $pos->id }}">
                                        <i class="bi bi-pencil"></i>
                                    </button>
                                    <form method="POST" action="{{ route('positions.destroy', $pos) }}" onsubmit="return confirm('Hapus jabatan ini?')">
                                        @csrf @method('DELETE')
                                        <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                                    </form>
                                </div>
                            </td>
                        </tr>

                        {{-- Edit Pos Modal --}}
                        <div class="modal fade" id="editPosModal{{ $pos->id }}" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header"><h5 class="modal-title">Edit Jabatan</h5><button class="btn-close" data-bs-dismiss="modal"></button></div>
                                    <form method="POST" action="{{ route('positions.update', $pos) }}">
                                        @csrf @method('PUT')
                                        <div class="modal-body row g-3">
                                            <div class="col-4">
                                                <label class="form-label fw-semibold" style="font-size:13px">Kode</label>
                                                <input type="text" name="code" class="form-control" value="{{ $pos->code }}">
                                            </div>
                                            <div class="col-8">
                                                <label class="form-label fw-semibold" style="font-size:13px">Nama Jabatan</label>
                                                <input type="text" name="name" class="form-control" value="{{ $pos->name }}" required>
                                            </div>
                                            <div class="col-12">
                                                <label class="form-label fw-semibold" style="font-size:13px">Departemen</label>
                                                <select name="department_id" class="form-select">
                                                    <option value="">— Tidak Ada / General —</option>
                                                    @foreach($departments as $d)
                                                    <option value="{{ $d->id }}" {{ $pos->department_id == $d->id ? 'selected' : '' }}>{{ $d->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                            <button type="submit" class="btn btn-primary">Simpan</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        @empty
                        <tr><td colspan="4" class="text-center text-muted py-4">Belum ada jabatan</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

{{-- Add Dept Modal --}}
<div class="modal fade" id="addDeptModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"><h5 class="modal-title">Tambah Departemen</h5><button class="btn-close" data-bs-dismiss="modal"></button></div>
            <form method="POST" action="{{ route('departments.store') }}">
                @csrf
                <div class="modal-body row g-3">
                    <div class="col-4">
                        <label class="form-label fw-semibold" style="font-size:13px">Kode</label>
                        <input type="text" name="code" class="form-control" placeholder="HRD">
                    </div>
                    <div class="col-8">
                        <label class="form-label fw-semibold" style="font-size:13px">Nama Departemen</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- Add Pos Modal --}}
<div class="modal fade" id="addPosModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"><h5 class="modal-title">Tambah Jabatan</h5><button class="btn-close" data-bs-dismiss="modal"></button></div>
            <form method="POST" action="{{ route('positions.store') }}">
                @csrf
                <div class="modal-body row g-3">
                    <div class="col-4">
                        <label class="form-label fw-semibold" style="font-size:13px">Kode</label>
                        <input type="text" name="code" class="form-control" placeholder="DEV">
                    </div>
                    <div class="col-8">
                        <label class="form-label fw-semibold" style="font-size:13px">Nama Jabatan</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Departemen</label>
                        <select name="department_id" class="form-select">
                            <option value="">— Tidak Ada / General —</option>
                            @foreach($departments as $d)
                            <option value="{{ $d->id }}">{{ $d->name }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-success">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
