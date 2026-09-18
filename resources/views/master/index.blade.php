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
    {{-- Tipe Dokumen --}}
    <div class="col-12">
        <div class="card h-100">
            <div class="card-header d-flex justify-content-between align-items-center">
                <div>
                    <h6 class="mb-0 fw-bold"><i class="bi bi-file-earmark-text text-info me-2"></i>Tipe & Kategori Dokumen Pegawai</h6>
                    <small class="text-muted" style="font-size:12px">Kelola jenis berkas administrasi dan dokumen yang dapat diunggah pada profil pegawai</small>
                </div>
                <button class="btn btn-sm btn-info text-white" data-bs-toggle="modal" data-bs-target="#addDocTypeModal">
                    <i class="bi bi-plus-lg me-1"></i>Tambah Tipe Dokumen
                </button>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead class="table-light">
                            <tr>
                                <th style="width:140px">Kode Tipe</th>
                                <th>Nama Dokumen</th>
                                <th>Deskripsi</th>
                                <th style="width:140px">Berkas Terunggah</th>
                                <th style="width:100px">Status</th>
                                <th style="width:90px">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($documentTypes as $dt)
                            <tr style="font-size:13px">
                                <td><code>{{ $dt->code }}</code></td>
                                <td class="fw-semibold text-dark">{{ $dt->name }}</td>
                                <td class="text-muted" style="font-size:12px">{{ $dt->description ?? '—' }}</td>
                                <td>
                                    <span class="badge bg-secondary-subtle text-secondary border border-secondary-subtle">
                                        {{ $dt->documents_count ?? 0 }} berkas
                                    </span>
                                </td>
                                <td>
                                    @if($dt->is_active)
                                    <span class="badge-status badge-tetap" style="font-size:10.5px">Aktif</span>
                                    @else
                                    <span class="badge-status badge-magang" style="font-size:10.5px">Non-aktif</span>
                                    @endif
                                </td>
                                <td>
                                    <div class="d-flex gap-1">
                                        <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editDocTypeModal{{ $dt->id }}" title="Edit">
                                            <i class="bi bi-pencil"></i>
                                        </button>
                                        <form method="POST" action="{{ route('document-types.destroy', $dt) }}" onsubmit="return confirm('Hapus tipe dokumen \'{{ $dt->name }}\'?')">
                                            @csrf @method('DELETE')
                                            <button class="btn btn-sm btn-outline-danger" title="Hapus"><i class="bi bi-trash"></i></button>
                                        </form>
                                    </div>
                                </td>
                            </tr>

                            {{-- Edit DocType Modal --}}
                            <div class="modal fade" id="editDocTypeModal{{ $dt->id }}" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Edit Tipe Dokumen</h5>
                                            <button class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <form method="POST" action="{{ route('document-types.update', $dt) }}">
                                            @csrf @method('PUT')
                                            <div class="modal-body row g-3">
                                                <div class="col-5">
                                                    <label class="form-label fw-semibold" style="font-size:13px">Kode (Slug)</label>
                                                    <input type="text" name="code" class="form-control" value="{{ $dt->code }}" required>
                                                </div>
                                                <div class="col-7">
                                                    <label class="form-label fw-semibold" style="font-size:13px">Nama Tipe Dokumen</label>
                                                    <input type="text" name="name" class="form-control" value="{{ $dt->name }}" required>
                                                </div>
                                                <div class="col-12">
                                                    <label class="form-label fw-semibold" style="font-size:13px">Deskripsi / Keterangan</label>
                                                    <textarea name="description" class="form-control" rows="2">{{ $dt->description }}</textarea>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" name="is_active" value="1" id="activeCheck{{ $dt->id }}" {{ $dt->is_active ? 'checked' : '' }}>
                                                        <label class="form-check-label fw-semibold" for="activeCheck{{ $dt->id }}" style="font-size:13px">Aktifkan tipe dokumen ini</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            @empty
                            <tr><td colspan="6" class="text-center text-muted py-4">Belum ada tipe dokumen</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
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

{{-- Add DocType Modal --}}
<div class="modal fade" id="addDocTypeModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah Tipe Dokumen</h5>
                <button class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form method="POST" action="{{ route('document-types.store') }}">
                @csrf
                <div class="modal-body row g-3">
                    <div class="col-5">
                        <label class="form-label fw-semibold" style="font-size:13px">Kode (Opsional)</label>
                        <input type="text" name="code" class="form-control" placeholder="serdos / str_sip">
                        <small class="text-muted" style="font-size:11px">Otomatis jika dikosongkan</small>
                    </div>
                    <div class="col-7">
                        <label class="form-label fw-semibold" style="font-size:13px">Nama Tipe Dokumen</label>
                        <input type="text" name="name" class="form-control" placeholder="e.g. Sertifikat Pendidik (SERDOS)" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Deskripsi / Keterangan</label>
                        <textarea name="description" class="form-control" rows="2" placeholder="Penjelasan singkat mengenai berkas ini..."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-info text-white">Simpan Tipe Dokumen</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
