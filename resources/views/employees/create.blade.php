@extends('layouts.app')
@section('title', 'Tambah Pegawai')
@section('page-title', 'Tambah Pegawai Baru')

@section('content')
<div class="d-flex align-items-center mb-4">
    <a href="{{ route('employees.index') }}" class="btn btn-sm btn-outline-secondary me-3">
        <i class="bi bi-arrow-left me-1"></i>Kembali
    </a>
    <div>
        <h4 class="mb-0 fw-bold" style="color:#0f172a">Tambah Pegawai Baru</h4>
        <p class="text-muted mb-0" style="font-size:13px">Isi data pegawai di bawah ini</p>
    </div>
</div>

<form method="POST" action="{{ route('employees.store') }}" enctype="multipart/form-data">
    @csrf
    <div class="row g-4">
        {{-- Data Pribadi --}}
        <div class="col-lg-8">
            <div class="card mb-4">
                <div class="card-header"><h6 class="mb-0 fw-bold"><i class="bi bi-person-fill text-primary me-2"></i>Data Pribadi</h6></div>
                <div class="card-body">
                    @if($errors->any())
                    <div class="alert alert-danger">
                        <ul class="mb-0">@foreach($errors->all() as $e)<li>{{ $e }}</li>@endforeach</ul>
                    </div>
                    @endif
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Kategori Pegawai <span class="text-danger">*</span></label>
                            <select name="employee_type" id="employeeTypeSelect" class="form-select fw-semibold" required>
                                <option value="tendik" {{ old('employee_type', 'tendik') == 'tendik' ? 'selected' : '' }}>🏢 Tenaga Kependidikan (Tendik)</option>
                                <option value="dosen" {{ old('employee_type') == 'dosen' ? 'selected' : '' }}>🎓 Dosen</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Agama</label>
                            <select name="religion" class="form-select">
                                <option value="">— Pilih Agama —</option>
                                @foreach(['Katolik', 'Kristen', 'Islam', 'Hindu', 'Budha', 'Konghucu'] as $ag)
                                <option value="{{ $ag }}" {{ old('religion') == $ag ? 'selected' : '' }}>{{ $ag }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">NIK / ID Pegawai</label>
                            <input type="text" name="nik" class="form-control @error('nik') is-invalid @enderror"
                                value="{{ old('nik') }}" placeholder="cth: 2025.02.61/STIKes">
                            @error('nik')<div class="invalid-feedback">{{ $message }}</div>@enderror
                            <div class="form-text" style="font-size:11px">Kosongkan jika berstatus kontrak tanpa NIP</div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Nama Lengkap <span class="text-danger">*</span></label>
                            <input type="text" name="full_name" class="form-control @error('full_name') is-invalid @enderror"
                                value="{{ old('full_name') }}" required placeholder="Nama lengkap beserta gelar">
                            @error('full_name')<div class="invalid-feedback">{{ $message }}</div>@enderror
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold" style="font-size:13px">Jenis Kelamin</label>
                            <select name="gender" class="form-select">
                                <option value="">— Pilih —</option>
                                @foreach(\App\Models\Employee::$genderLabels as $v => $l)
                                <option value="{{ $v }}" {{ old('gender') == $v ? 'selected' : '' }}>{{ $l }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold" style="font-size:13px">Tempat Lahir</label>
                            <input type="text" name="birth_place" class="form-control" value="{{ old('birth_place') }}">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold" style="font-size:13px">Tanggal Lahir</label>
                            <input type="date" name="birth_date" class="form-control" value="{{ old('birth_date') }}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Status Pernikahan</label>
                            <select name="marital_status" class="form-select">
                                <option value="">— Pilih —</option>
                                @foreach(\App\Models\Employee::$maritalStatusLabels as $v => $l)
                                <option value="{{ $v }}" {{ old('marital_status') == $v ? 'selected' : '' }}>{{ $l }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Nomor Telepon</label>
                            <input type="text" name="phone" class="form-control" value="{{ old('phone') }}" placeholder="08xxxxxxxx">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Email</label>
                            <input type="email" name="email" class="form-control" value="{{ old('email') }}">
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-semibold" style="font-size:13px">Alamat</label>
                            <textarea name="address" class="form-control" rows="2">{{ old('address') }}</textarea>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Informasi Kepegawaian --}}
            <div class="card">
                <div class="card-header"><h6 class="mb-0 fw-bold"><i class="bi bi-briefcase-fill text-primary me-2"></i>Informasi Kepegawaian</h6></div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Status Kepegawaian <span class="text-danger">*</span></label>
                            <select name="employment_status" class="form-select" required>
                                @foreach(\App\Models\Employee::$employmentStatusLabels as $v => $l)
                                <option value="{{ $v }}" {{ old('employment_status', 'tetap') == $v ? 'selected' : '' }}>{{ $l }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Departemen</label>
                            <select name="department_id" class="form-select">
                                <option value="">— Pilih Departemen —</option>
                                @foreach($departments as $dept)
                                <option value="{{ $dept->id }}" {{ old('department_id') == $dept->id ? 'selected' : '' }}>{{ $dept->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Jabatan / Posisi</label>
                            <select name="position_id" class="form-select">
                                <option value="">— Pilih Jabatan —</option>
                                @foreach($positions as $pos)
                                <option value="{{ $pos->id }}" {{ old('position_id') == $pos->id ? 'selected' : '' }}>{{ $pos->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Atasan Langsung</label>
                            <select name="supervisor_id" class="form-select">
                                <option value="">— Pilih Atasan —</option>
                                @foreach($supervisors as $sup)
                                <option value="{{ $sup->id }}" {{ old('supervisor_id') == $sup->id ? 'selected' : '' }}>{{ $sup->full_name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Pangkat / Golongan</label>
                            <input type="text" name="rank_group" class="form-control" value="{{ old('rank_group') }}" placeholder="cth: Penata Muda Tk.I Golongan III/b">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Tanggal Bergabung</label>
                            <input type="date" name="join_date" class="form-control" value="{{ old('join_date') }}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Akhir Kontrak</label>
                            <input type="date" name="contract_end_date" class="form-control" value="{{ old('contract_end_date') }}">
                            <div class="form-text">Isi jika berstatus kontrak</div>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-semibold" style="font-size:13px">Catatan</label>
                            <textarea name="notes" class="form-control" rows="2">{{ old('notes') }}</textarea>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Informasi Akademik (Khusus Dosen) --}}
            <div class="card mt-4" id="dosenAcademicSection" style="display:none">
                <div class="card-header bg-primary bg-opacity-10 d-flex justify-content-between align-items-center">
                    <h6 class="mb-0 fw-bold text-primary"><i class="bi bi-mortarboard-fill me-2"></i>Informasi Akademik Dosen (PSDM)</h6>
                    <span class="badge bg-primary">Khusus Dosen</span>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">NIDN / NIDK</label>
                            <input type="text" name="nidn" class="form-control" value="{{ old('nidn') }}" placeholder="Nomor Induk Dosen Nasional">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">NUPTK</label>
                            <input type="text" name="nuptk" class="form-control" value="{{ old('nuptk') }}" placeholder="Nomor Unik Pendidik & Tendik">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Jabatan Fungsional (Jafung)</label>
                            <input type="text" name="functional_position" class="form-control" value="{{ old('functional_position') }}" placeholder="cth: Asisten Ahli (150 kum) / Lektor">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Bidang Keahlian / Peminatan</label>
                            <input type="text" name="specialization" class="form-control" value="{{ old('specialization') }}" placeholder="cth: Keperawatan Maternitas / Farmakologi">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">Sertifikasi Dosen (SERDOS)</label>
                            <input type="text" name="serdos" class="form-control" value="{{ old('serdos') }}" placeholder="No. Peserta Serdos atau status">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold" style="font-size:13px">SK Dosen Tetap Yayasan</label>
                            <input type="text" name="sk_dosen_tetap" class="form-control" value="{{ old('sk_dosen_tetap') }}" placeholder="Nomor atau TMT SK">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold" style="font-size:13px">Pelatihan PEKERTI</label>
                            <input type="text" name="pekerti" class="form-control" value="{{ old('pekerti') }}" placeholder="No. Sertifikat / Tanggal">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold" style="font-size:13px">Applied Approach (AA)</label>
                            <input type="text" name="applied_approach" class="form-control" value="{{ old('applied_approach') }}" placeholder="No. Sertifikat / Tanggal">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-semibold" style="font-size:13px">Inpassing</label>
                            <input type="text" name="inpassing" class="form-control" value="{{ old('inpassing') }}" placeholder="SK / Status Inpassing">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- Photo --}}
        <div class="col-lg-4">
            <div class="card">
                <div class="card-header"><h6 class="mb-0 fw-bold"><i class="bi bi-image-fill text-primary me-2"></i>Foto Pegawai</h6></div>
                <div class="card-body text-center">
                    <div class="emp-initials mx-auto mb-3" id="photoPreview" style="display:flex">?</div>
                    <img id="photoPreviewImg" class="emp-photo mx-auto d-none mb-3">
                    <input type="file" name="photo" class="form-control" id="photoInput" accept="image/*">
                    <div class="form-text mt-2">JPG, PNG, maks 2MB</div>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-4 d-flex gap-2">
        <button type="submit" class="btn btn-primary px-4">
            <i class="bi bi-check-lg me-2"></i>Simpan Data Pegawai
        </button>
        <a href="{{ route('employees.index') }}" class="btn btn-outline-secondary px-4">Batal</a>
    </div>
</form>
@endsection

@push('scripts')
<script>
function toggleDosenFields() {
    const select = document.getElementById('employeeTypeSelect');
    const section = document.getElementById('dosenAcademicSection');
    if (select && section) {
        section.style.display = (select.value === 'dosen') ? 'block' : 'none';
    }
}
document.getElementById('employeeTypeSelect')?.addEventListener('change', toggleDosenFields);
toggleDosenFields();

document.getElementById('photoInput').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = (ev) => {
            document.getElementById('photoPreview').style.display = 'none';
            const img = document.getElementById('photoPreviewImg');
            img.src = ev.target.result;
            img.classList.remove('d-none');
        };
        reader.readAsDataURL(file);
    }
});
</script>
@endpush
