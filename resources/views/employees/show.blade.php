@extends('layouts.app')
@section('title', $employee->full_name)
@section('page-title', 'Detail Pegawai')

@section('content')
{{-- Back + Action buttons --}}
<div class="d-flex align-items-center justify-content-between mb-4">
    <a href="{{ route('employees.index') }}" class="btn btn-sm btn-outline-secondary">
        <i class="bi bi-arrow-left me-1"></i>Kembali
    </a>
    <div class="d-flex gap-2">
        <a href="{{ route('employees.pdf', $employee) }}" class="btn btn-danger btn-sm" target="_blank">
            <i class="bi bi-file-earmark-pdf-fill me-1"></i>Cetak CV (PDF)
        </a>
        @if(!auth()->user()->isGuest())
        <a href="{{ route('employees.edit', $employee) }}" class="btn btn-primary btn-sm">
            <i class="bi bi-pencil me-1"></i>Edit Data
        </a>
        <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#resignModalShow">
            <i class="bi bi-door-open me-1"></i>Proses Resign
        </button>
        @endif
    </div>
</div>

{{-- Profile Header --}}
<div class="card mb-4">
    <div class="card-body">
        <div class="row align-items-center g-3">
            <div class="col-auto">
                @if($employee->photo)
                <img src="{{ asset('storage/'.$employee->photo) }}" class="emp-photo">
                @else
                <div class="emp-initials">{{ substr($employee->full_name, 0, 1) }}</div>
                @endif
            </div>
            <div class="col">
                <h4 class="mb-1 fw-bold" style="color:#0f172a">{{ $employee->full_name }}</h4>
                <div class="text-muted mb-2" style="font-size:14px">
                    {{ $employee->position?->name ?? '—' }} — {{ $employee->department?->name ?? '—' }}
                </div>
                <div class="d-flex flex-wrap gap-2">
                    @php
                        $colors = ['tetap'=>'success','kontrak'=>'primary','magang'=>'secondary','probation'=>'warning'];
                    @endphp
                    <span class="badge badge-status bg-{{ $colors[$employee->employment_status] ?? 'secondary' }} fs-6">
                        {{ \App\Models\Employee::$employmentStatusLabels[$employee->employment_status] ?? $employee->employment_status }}
                    @if($employee->isDosen())
                    <span class="badge badge-status bg-primary fs-6"><i class="bi bi-mortarboard-fill me-1"></i>Dosen</span>
                    @if($employee->nidn)
                    <span class="badge badge-status bg-info text-dark border"><i class="bi bi-person-vcard me-1"></i>NIDN: {{ $employee->nidn }}</span>
                    @endif
                    @if($employee->functional_position)
                    <span class="badge badge-status bg-light text-dark border"><i class="bi bi-award me-1"></i>{{ $employee->functional_position }}</span>
                    @endif
                    @elseif($employee->isTendik())
                    <span class="badge badge-status bg-secondary fs-6"><i class="bi bi-briefcase-fill me-1"></i>Tenaga Kependidikan</span>
                    @endif
                    <span class="badge badge-status bg-success bg-opacity-10 text-success border border-success">
                        <i class="bi bi-circle-fill me-1" style="font-size:7px"></i>Aktif
                    </span>
                </div>
            </div>
            <div class="col-auto">
                <div class="row g-3 text-center">
                    <div class="col-6">
                        <div style="font-size:11px;color:#64748b;font-weight:600;text-transform:uppercase">NIK</div>
                        <code style="font-size:14px">{{ $employee->nik }}</code>
                    </div>
                    <div class="col-6">
                        <div style="font-size:11px;color:#64748b;font-weight:600;text-transform:uppercase">Masa Kerja</div>
                        <div style="font-size:13px;font-weight:600">{{ $employee->work_duration ?? '—' }}</div>
                    </div>
                    <div class="col-6">
                        <div style="font-size:11px;color:#64748b;font-weight:600;text-transform:uppercase">Bergabung</div>
                        <div style="font-size:13px;font-weight:600">{{ $employee->join_date?->format('d M Y') ?? '—' }}</div>
                    </div>
                    <div class="col-6">
                        <div style="font-size:11px;color:#64748b;font-weight:600;text-transform:uppercase">Dokumen</div>
                        <div style="font-size:13px;font-weight:600">{{ $employee->documents->count() }} file</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- Tabs --}}
<ul class="nav nav-pills mb-4" id="empTabs">
    <li class="nav-item"><a class="nav-link active" data-bs-toggle="pill" href="#tab-biodata">Biodata</a></li>
    <li class="nav-item"><a class="nav-link" data-bs-toggle="pill" href="#tab-keluarga">Keluarga ({{ $employee->families->count() }})</a></li>
    <li class="nav-item"><a class="nav-link" data-bs-toggle="pill" href="#tab-dokumen">Dokumen ({{ $employee->documents->count() }})</a></li>
    <li class="nav-item"><a class="nav-link" data-bs-toggle="pill" href="#tab-pendidikan">Pendidikan ({{ $employee->educations->count() }})</a></li>
    <li class="nav-item"><a class="nav-link" data-bs-toggle="pill" href="#tab-pelatihan">Pelatihan ({{ $employee->trainings->count() }})</a></li>
</ul>

<div class="tab-content">
    {{-- ─ Biodata Tab ─ --}}
    <div class="tab-pane fade show active" id="tab-biodata">
        <div class="row g-4">
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header"><h6 class="mb-0 fw-bold"><i class="bi bi-person-fill text-primary me-2"></i>Data Pribadi</h6></div>
                    <div class="card-body">
                        @php
                        $rows = [
                            ['label'=>'Nama Lengkap','value'=>$employee->full_name],
                            ['label'=>'NIK / NIP','value'=>$employee->nik ?? '—'],
                            ['label'=>'Jenis Kelamin','value'=>\App\Models\Employee::$genderLabels[$employee->gender] ?? '—'],
                            ['label'=>'Agama','value'=>$employee->religion ?? '—'],
                            ['label'=>'Tempat Lahir','value'=>$employee->birth_place ?? '—'],
                            ['label'=>'Tanggal Lahir','value'=>$employee->birth_date?->format('d M Y').' ('.$employee->age.' tahun)' ?? '—'],
                            ['label'=>'Status Pernikahan','value'=>\App\Models\Employee::$maritalStatusLabels[$employee->marital_status] ?? '—'],
                            ['label'=>'Alamat','value'=>$employee->address ?? '—'],
                            ['label'=>'Telepon','value'=>$employee->phone ?? '—'],
                            ['label'=>'Email','value'=>$employee->email ?? '—'],
                        ];
                        @endphp
                        @foreach($rows as $r)
                        <div class="row py-2 border-bottom" style="font-size:13px">
                            <div class="col-5 text-muted fw-medium">{{ $r['label'] }}</div>
                            <div class="col-7">{{ $r['value'] }}</div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header"><h6 class="mb-0 fw-bold"><i class="bi bi-briefcase-fill text-primary me-2"></i>Informasi Kepegawaian</h6></div>
                    <div class="card-body">
                        @php
                        $rows2 = [
                            ['label'=>'Kategori Pegawai','value'=>$employee->isDosen() ? 'Dosen' : 'Tenaga Kependidikan (Tendik)'],
                            ['label'=>'Status Kepegawaian','value'=>\App\Models\Employee::$employmentStatusLabels[$employee->employment_status] ?? '—'],
                            ['label'=>'Unit / Program Studi','value'=>$employee->department?->name ?? '—'],
                            ['label'=>'Jabatan','value'=>$employee->position?->name ?? '—'],
                            ['label'=>'Pangkat / Golongan','value'=>$employee->rank_group ?? '—'],
                            ['label'=>'Atasan Langsung','value'=>$employee->supervisor?->full_name ?? '—'],
                            ['label'=>'Tanggal Bergabung','value'=>$employee->join_date?->format('d M Y') ?? '—'],
                            ['label'=>'Akhir Kontrak','value'=>$employee->contract_end_date?->format('d M Y') ?? '—'],
                            ['label'=>'Catatan','value'=>$employee->notes ?? '—'],
                        ];
                        @endphp
                        @foreach($rows2 as $r)
                        <div class="row py-2 border-bottom" style="font-size:13px">
                            <div class="col-5 text-muted fw-medium">{{ $r['label'] }}</div>
                            <div class="col-7">{{ $r['value'] }}</div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>

            @if($employee->isDosen())
            {{-- Card Khusus Dosen: Informasi Akademik --}}
            <div class="col-12">
                <div class="card border-primary border-opacity-25 shadow-sm">
                    <div class="card-header bg-primary bg-opacity-10 d-flex justify-content-between align-items-center py-2">
                        <h6 class="mb-0 fw-bold text-primary"><i class="bi bi-mortarboard-fill me-2"></i>Informasi Akademik Dosen</h6>
                        <span class="badge bg-primary">PSDM STIKes</span>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-md-3">
                                <div class="p-3 bg-light rounded border h-100">
                                    <div class="text-muted" style="font-size:11px;font-weight:600;text-transform:uppercase">NIDN / NIDK</div>
                                    <div class="fw-bold fs-6 text-primary mt-1">{{ $employee->nidn ?? '—' }}</div>
                                    <div class="text-muted mt-2" style="font-size:11px;font-weight:600;text-transform:uppercase">NUPTK</div>
                                    <div class="fw-semibold mt-1" style="font-size:13px">{{ $employee->nuptk ?? '—' }}</div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="p-3 bg-light rounded border h-100">
                                    <div class="text-muted" style="font-size:11px;font-weight:600;text-transform:uppercase">Jabatan Fungsional (Jafung)</div>
                                    <div class="fw-bold text-dark mt-1" style="font-size:14px">{{ $employee->functional_position ?? '—' }}</div>
                                    
                                    <div class="text-muted mt-3" style="font-size:11px;font-weight:600;text-transform:uppercase">Bidang Keahlian / Peminatan</div>
                                    <div class="fw-semibold mt-1" style="font-size:13px">{{ $employee->specialization ?? '—' }}</div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="p-3 bg-light rounded border h-100">
                                    <div class="row g-2" style="font-size:12.5px">
                                        <div class="col-6 text-muted">SERDOS:</div>
                                        <div class="col-6 fw-semibold text-end">{{ $employee->serdos ?? '—' }}</div>
                                        <div class="col-6 text-muted">PEKERTI:</div>
                                        <div class="col-6 fw-semibold text-end">{{ $employee->pekerti ?? '—' }}</div>
                                        <div class="col-6 text-muted">Applied Approach:</div>
                                        <div class="col-6 fw-semibold text-end">{{ $employee->applied_approach ?? '—' }}</div>
                                        <div class="col-6 text-muted">Inpassing:</div>
                                        <div class="col-6 fw-semibold text-end text-truncate" title="{{ $employee->inpassing }}">{{ $employee->inpassing ?? '—' }}</div>
                                        <div class="col-6 text-muted">SK Dosen Tetap:</div>
                                        <div class="col-6 fw-semibold text-end text-truncate" title="{{ $employee->sk_dosen_tetap }}">{{ $employee->sk_dosen_tetap ?? '—' }}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endif
            {{-- Emergency Contacts --}}
            <div class="col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h6 class="mb-0 fw-bold"><i class="bi bi-telephone-fill text-danger me-2"></i>Kontak Darurat</h6>
                        @if(!auth()->user()->isGuest())
                        <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#addContactModal">
                            <i class="bi bi-plus-lg"></i>
                        </button>
                        @endif
                    </div>
                    <div class="card-body">
                        @forelse($employee->contacts as $c)
                        <div class="d-flex align-items-center justify-content-between py-2 border-bottom" style="font-size:13px">
                            <div>
                                <strong>{{ $c->name }}</strong> ({{ $c->relation }})
                                @if($c->is_primary)<span class="badge bg-success ms-1" style="font-size:10px">Utama</span>@endif
                                <div class="text-muted">{{ $c->phone }}</div>
                            </div>
                        </div>
                        @empty
                        <p class="text-muted small text-center py-2">Belum ada kontak darurat</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- ─ Keluarga Tab ─ --}}
    <div class="tab-pane fade" id="tab-keluarga">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h6 class="mb-0 fw-bold"><i class="bi bi-house-heart-fill text-primary me-2"></i>Data Keluarga & Tanggungan</h6>
                @if(!auth()->user()->isGuest())
                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addFamilyModal">
                    <i class="bi bi-plus-lg me-1"></i>Tambah
                </button>
                @endif
            </div>
            <div class="card-body p-0">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr>
                        <th>Nama</th><th>Hubungan</th><th>Tgl Lahir</th><th>Pekerjaan</th><th>Tanggungan</th><th></th>
                    </tr></thead>
                    <tbody>
                        @forelse($employee->families as $f)
                        <tr style="font-size:13px">
                            <td>{{ $f->full_name }}</td>
                            <td>{{ \App\Models\EmployeeFamily::$relationLabels[$f->relation] ?? $f->relation }}</td>
                            <td>{{ $f->birth_date?->format('d M Y') ?? '—' }}</td>
                            <td>{{ $f->occupation ?? '—' }}</td>
                            <td>
                                @if($f->is_dependent)
                                <span class="badge bg-info">Ya</span>
                                @else
                                <span class="badge bg-light text-muted">Tidak</span>
                                @endif
                            </td>
                            <td>
                                @if(!auth()->user()->isGuest())
                                <form method="POST" action="{{ route('employee-families.destroy', $f) }}" onsubmit="return confirm('Hapus data ini?')">
                                    @csrf @method('DELETE')
                                    <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                                </form>
                                @endif
                            </td>
                        </tr>
                        @empty
                        <tr><td colspan="6" class="text-center text-muted py-4">Belum ada data keluarga</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    {{-- ─ Dokumen Tab ─ --}}
    <div class="tab-pane fade" id="tab-dokumen">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h6 class="mb-0 fw-bold"><i class="bi bi-folder-fill text-warning me-2"></i>Dokumen Digital</h6>
                @if(!auth()->user()->isGuest())
                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addDocModal">
                    <i class="bi bi-upload me-1"></i>Upload Dokumen
                </button>
                @endif
            </div>
            <div class="card-body p-0">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr>
                        <th>Nama Dokumen</th><th>Tipe</th><th>Ukuran</th><th>Tgl Terbit</th><th>Kedaluwarsa</th><th>Aksi</th>
                    </tr></thead>
                    <tbody>
                        @forelse($employee->documents as $doc)
                        @php $expired = $doc->isExpired(); $expiring = $doc->isExpiringSoon(); @endphp
                        <tr style="font-size:13px" class="{{ $expired ? 'table-danger' : ($expiring ? 'table-warning' : '') }}">
                            <td>
                                <i class="bi bi-file-earmark-fill text-primary me-1"></i>
                                {{ $doc->name }}
                            </td>
                            <td>
                                <span class="badge bg-secondary">
                                    {{ \App\Models\EmployeeDocument::$typeLabels[$doc->type] ?? $doc->type }}
                                </span>
                            </td>
                            <td>{{ $doc->file_size ?? '—' }}</td>
                            <td>{{ $doc->issued_date?->format('d M Y') ?? '—' }}</td>
                            <td>
                                @if($doc->expiry_date)
                                    @if($expired)
                                        <span class="text-danger fw-semibold">{{ $doc->expiry_date->format('d M Y') }} <i class="bi bi-exclamation-triangle-fill"></i></span>
                                    @elseif($expiring)
                                        <span class="text-warning fw-semibold">{{ $doc->expiry_date->format('d M Y') }} <i class="bi bi-clock-fill"></i></span>
                                    @else
                                        {{ $doc->expiry_date->format('d M Y') }}
                                    @endif
                                @else —
                                @endif
                            </td>
                            <td>
                                <div class="d-flex gap-1">
                                    <a href="{{ route('documents.preview', $doc) }}" target="_blank" class="btn btn-sm btn-outline-primary" title="Lihat/Preview Dokumen">
                                        <i class="bi bi-eye"></i>
                                    </a>
                                    <a href="{{ route('documents.download', $doc) }}" class="btn btn-sm btn-outline-success" title="Download">
                                        <i class="bi bi-download"></i>
                                    </a>
                                    @if(!auth()->user()->isGuest())
                                    <form method="POST" action="{{ route('documents.destroy', $doc) }}" onsubmit="return confirm('Hapus dokumen ini?')">
                                        @csrf @method('DELETE')
                                        <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                                    </form>
                                    @endif
                                </div>
                            </td>
                        </tr>
                        @empty
                        <tr><td colspan="6" class="text-center text-muted py-4">Belum ada dokumen</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    {{-- ─ Pendidikan Tab ─ --}}
    <div class="tab-pane fade" id="tab-pendidikan">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h6 class="mb-0 fw-bold"><i class="bi bi-mortarboard-fill text-primary me-2"></i>Riwayat Pendidikan</h6>
                @if(!auth()->user()->isGuest())
                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addEduModal">
                    <i class="bi bi-plus-lg me-1"></i>Tambah
                </button>
                @endif
            </div>
            <div class="card-body p-0">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr><th>Jenjang</th><th>Institusi</th><th>Jurusan</th><th>Lulus</th><th>IPK</th><th></th></tr></thead>
                    <tbody>
                        @forelse($employee->educations as $edu)
                        <tr style="font-size:13px">
                            <td><span class="badge bg-primary">{{ $edu->level }}</span></td>
                            <td>{{ $edu->institution }}</td>
                            <td>{{ $edu->major ?? '—' }}</td>
                            <td>{{ $edu->graduation_year ?? '—' }}</td>
                            <td>{{ $edu->gpa ?? '—' }}</td>
                            <td>
                                @if(!auth()->user()->isGuest())
                                <form method="POST" action="{{ route('employee-educations.destroy', $edu) }}" onsubmit="return confirm('Hapus?')">
                                    @csrf @method('DELETE')
                                    <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                                </form>
                                @endif
                            </td>
                        </tr>
                        @empty
                        <tr><td colspan="6" class="text-center text-muted py-4">Belum ada riwayat pendidikan</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    {{-- ─ Pelatihan Tab ─ --}}
    <div class="tab-pane fade" id="tab-pelatihan">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h6 class="mb-0 fw-bold"><i class="bi bi-award-fill text-primary me-2"></i>Pelatihan & Sertifikasi</h6>
                @if(!auth()->user()->isGuest())
                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addTrainModal">
                    <i class="bi bi-plus-lg me-1"></i>Tambah
                </button>
                @endif
            </div>
            <div class="card-body p-0">
                <table class="table table-hover mb-0">
                    <thead class="table-light"><tr><th>Nama</th><th>Tipe</th><th>Penyelenggara</th><th>Tanggal</th><th>Kedaluwarsa</th><th>Aksi</th></tr></thead>
                    <tbody>
                        @forelse($employee->trainings as $tr)
                        @php $tExpired = $tr->isExpired(); $tExpiring = $tr->isExpiringSoon(); @endphp
                        <tr style="font-size:13px" class="{{ $tExpired ? 'table-danger' : ($tExpiring ? 'table-warning' : '') }}">
                            <td>{{ $tr->name }}</td>
                            <td><span class="badge bg-info text-dark">{{ \App\Models\EmployeeTraining::$typeLabels[$tr->type] ?? $tr->type }}</span></td>
                            <td>{{ $tr->organizer ?? '—' }}</td>
                            <td>{{ $tr->start_date?->format('d M Y') ?? '—' }}</td>
                            <td>
                                @if($tr->expiry_date)
                                    @if($tExpired)
                                        <span class="text-danger fw-semibold">{{ $tr->expiry_date->format('d M Y') }} <i class="bi bi-exclamation-triangle-fill"></i></span>
                                    @elseif($tExpiring)
                                        <span class="text-warning fw-semibold">{{ $tr->expiry_date->format('d M Y') }} <i class="bi bi-clock-fill"></i></span>
                                    @else {{ $tr->expiry_date->format('d M Y') }}
                                    @endif
                                @else —
                                @endif
                            </td>
                            <td>
                                <div class="d-flex gap-1">
                                    @if($tr->attachment)
                                    <a href="{{ asset('storage/'.$tr->attachment) }}" target="_blank" class="btn btn-sm btn-outline-success" title="Unduh">
                                        <i class="bi bi-download"></i>
                                    </a>
                                    @endif
                                    @if(!auth()->user()->isGuest())
                                    <form method="POST" action="{{ route('employee-trainings.destroy', $tr) }}" onsubmit="return confirm('Hapus?')">
                                        @csrf @method('DELETE')
                                        <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                                    </form>
                                    @endif
                                </div>
                            </td>
                        </tr>
                        @empty
                        <tr><td colspan="6" class="text-center text-muted py-4">Belum ada data pelatihan</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

{{-- ═══ Modals ═══ --}}

{{-- Resign Modal --}}
<div class="modal fade" id="resignModalShow" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><i class="bi bi-door-open text-warning me-2"></i>Proses Resign</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form method="POST" action="{{ route('employees.resign', $employee) }}">
                @csrf
                <div class="modal-body">
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
                        <textarea name="reason_detail" class="form-control" rows="2"></textarea>
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
                    <button type="submit" class="btn btn-warning"><i class="bi bi-archive me-1"></i>Arsipkan</button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- Add Family Modal --}}
<div class="modal fade" id="addFamilyModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"><h5 class="modal-title">Tambah Data Keluarga</h5><button class="btn-close" data-bs-dismiss="modal"></button></div>
            <form method="POST" action="{{ route('employee-families.store', $employee) }}">
                @csrf
                <div class="modal-body row g-3">
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Hubungan</label>
                        <select name="relation" class="form-select" required>
                            @foreach(\App\Models\EmployeeFamily::$relationLabels as $v => $l)
                            <option value="{{ $v }}">{{ $l }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Nama Lengkap</label>
                        <input type="text" name="full_name" class="form-control" required>
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Tanggal Lahir</label>
                        <input type="date" name="birth_date" class="form-control">
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Pekerjaan</label>
                        <input type="text" name="occupation" class="form-control">
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Telepon</label>
                        <input type="text" name="phone" class="form-control">
                    </div>
                    <div class="col-6 d-flex align-items-end">
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" name="is_dependent" value="1" id="isDependentCheck">
                            <label class="form-check-label fw-semibold" for="isDependentCheck" style="font-size:13px">Tanggungan</label>
                        </div>
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

{{-- Upload Document Modal --}}
<div class="modal fade" id="addDocModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"><h5 class="modal-title">Upload Dokumen</h5><button class="btn-close" data-bs-dismiss="modal"></button></div>
            <form method="POST" action="{{ route('documents.store', $employee) }}" enctype="multipart/form-data">
                @csrf
                <div class="modal-body row g-3">
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Tipe Dokumen</label>
                        <select name="type" class="form-select" required>
                            @foreach(\App\Models\EmployeeDocument::$typeLabels as $v => $l)
                            <option value="{{ $v }}">{{ $l }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Nama Dokumen</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">File Dokumen (PDF, Gambar, Word)</label>
                        <input type="file" name="file" class="form-control" accept=".pdf,.jpg,.jpeg,.png,.docx,.doc" required>
                        <div class="form-text" style="font-size:11px">Format yang didukung: PDF, JPG, PNG, DOCX (Maksimal 10MB)</div>
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Tanggal Terbit</label>
                        <input type="date" name="issued_date" class="form-control">
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Tanggal Kedaluwarsa</label>
                        <input type="date" name="expiry_date" class="form-control">
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Catatan</label>
                        <textarea name="notes" class="form-control" rows="2"></textarea>
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

{{-- Add Education Modal --}}
<div class="modal fade" id="addEduModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"><h5 class="modal-title">Tambah Pendidikan</h5><button class="btn-close" data-bs-dismiss="modal"></button></div>
            <form method="POST" action="{{ route('employee-educations.store', $employee) }}">
                @csrf
                <div class="modal-body row g-3">
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Jenjang</label>
                        <select name="level" class="form-select" required>
                            @foreach(\App\Models\EmployeeEducation::$levelLabels as $v => $l)
                            <option value="{{ $v }}">{{ $l }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Nama Institusi</label>
                        <input type="text" name="institution" class="form-control" required>
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Jurusan</label>
                        <input type="text" name="major" class="form-control">
                    </div>
                    <div class="col-3">
                        <label class="form-label fw-semibold" style="font-size:13px">Tahun Lulus</label>
                        <input type="number" name="graduation_year" class="form-control" min="1970" max="{{ date('Y') }}">
                    </div>
                    <div class="col-3">
                        <label class="form-label fw-semibold" style="font-size:13px">IPK</label>
                        <input type="text" name="gpa" class="form-control" placeholder="3.50">
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

{{-- Add Training Modal --}}
<div class="modal fade" id="addTrainModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header"><h5 class="modal-title">Tambah Pelatihan / Sertifikasi</h5><button class="btn-close" data-bs-dismiss="modal"></button></div>
            <form method="POST" action="{{ route('employee-trainings.store', $employee) }}" enctype="multipart/form-data">
                @csrf
                <div class="modal-body row g-3">
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Tipe</label>
                        <select name="type" class="form-select" required>
                            @foreach(\App\Models\EmployeeTraining::$typeLabels as $v => $l)
                            <option value="{{ $v }}">{{ $l }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Nama</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">Penyelenggara</label>
                        <input type="text" name="organizer" class="form-control">
                    </div>
                    <div class="col-6">
                        <label class="form-label fw-semibold" style="font-size:13px">No. Sertifikat</label>
                        <input type="text" name="certificate_number" class="form-control">
                    </div>
                    <div class="col-4">
                        <label class="form-label fw-semibold" style="font-size:13px">Tgl Mulai</label>
                        <input type="date" name="start_date" class="form-control">
                    </div>
                    <div class="col-4">
                        <label class="form-label fw-semibold" style="font-size:13px">Tgl Selesai</label>
                        <input type="date" name="end_date" class="form-control">
                    </div>
                    <div class="col-4">
                        <label class="form-label fw-semibold" style="font-size:13px">Kedaluwarsa</label>
                        <input type="date" name="expiry_date" class="form-control">
                    </div>
                    <div class="col-12">
                        <label class="form-label fw-semibold" style="font-size:13px">Lampiran Sertifikat</label>
                        <input type="file" name="attachment" class="form-control">
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
@endsection
