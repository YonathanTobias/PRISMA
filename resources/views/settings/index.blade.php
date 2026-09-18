@extends('layouts.app')
@section('title', 'Pengaturan Sistem')
@section('page-title', 'Pengaturan Sistem')

@section('content')
<div class="d-flex align-items-center justify-content-between mb-4">
    <div>
        <h4 class="mb-1 fw-bold" style="color:#0f172a">Pengaturan Identitas Sistem</h4>
        <p class="text-muted mb-0" style="font-size:13px">Ubah nama aplikasi, nama panjang, dan instansi secara dinamis di sini</p>
    </div>
</div>

<form method="POST" action="{{ route('settings.update') }}">
    @csrf
    @method('PUT')
    
    <div class="row g-4">
        <div class="col-md-7">
            <div class="card shadow-sm h-100">
                <div class="card-header bg-light">
                    <h6 class="mb-0 fw-bold text-dark"><i class="bi bi-gear-fill me-2 text-primary"></i>Branding & Identitas</h6>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label fw-semibold" style="font-size:13.5px">Nama Singkat Aplikasi</label>
                        <input type="text" name="app_name" class="form-control" value="{{ $settings['app_name'] ?? 'PRISMA-PW' }}" required>
                        <div class="form-text" style="font-size:11px">Digunakan pada sidebar atas, judul tab browser, footer, dan kop dokumen ekspor.</div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold" style="font-size:13.5px">Nama Panjang / Deskripsi Aplikasi</label>
                        <input type="text" name="app_description" class="form-control" value="{{ $settings['app_description'] ?? 'Portal Informasi Sumber Daya Manusia Panti Waluya' }}" required>
                        <div class="form-text" style="font-size:11px">Digunakan pada halaman login dan deskripsi meta sistem.</div>
                    </div>

                    <div class="mb-0">
                        <label class="form-label fw-semibold" style="font-size:13.5px">Nama Institusi / Organisasi</label>
                        <input type="text" name="institution_name" class="form-control" value="{{ $settings['institution_name'] ?? 'STIKes Panti Waluya Malang' }}" required>
                        <div class="form-text" style="font-size:11px">Digunakan pada sub-header sidebar, halaman login, dan kop surat PDF.</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-5">
            <div class="card shadow-sm h-100">
                <div class="card-header bg-light">
                    <h6 class="mb-0 fw-bold text-dark"><i class="bi bi-sliders me-2 text-primary"></i>Visibilitas Modul & Tab</h6>
                </div>
                <div class="card-body">
                    <p class="text-muted" style="font-size:12.5px">Aktifkan atau sembunyikan modul tertentu dari sistem sesuai kebutuhan institusi:</p>

                    <div class="p-3 bg-light rounded border mb-3">
                        <div class="form-check form-switch mb-1">
                            <input class="form-check-input" type="checkbox" role="switch" id="enable_training_module" name="enable_training_module" value="1" {{ ($settings['enable_training_module'] ?? '0') == '1' ? 'checked' : '' }}>
                            <label class="form-check-label fw-bold text-dark" for="enable_training_module" style="font-size:13.5px">
                                Modul Pelatihan & Sertifikasi
                            </label>
                        </div>
                        <div class="text-muted ms-4" style="font-size:11.5px">
                            Jika dinonaktifkan, tab & formulir pelatihan pada detail pegawai akan disembunyikan tanpa menghapus data yang tersimpan.
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="d-flex justify-content-end">
                <button type="submit" class="btn btn-primary px-4 py-2 fw-semibold shadow-sm">
                    <i class="bi bi-save me-2"></i>Simpan Pengaturan
                </button>
            </div>
        </div>
    </div>
</form>
@endsection
