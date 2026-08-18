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

<div class="row g-4">
    <div class="col-md-8 col-lg-6">
        <div class="card shadow-sm">
            <div class="card-header bg-light">
                <h6 class="mb-0 fw-bold text-dark"><i class="bi bi-gear-fill me-2 text-primary"></i>Branding & Identitas</h6>
            </div>
            <div class="card-body">
                <form method="POST" action="{{ route('settings.update') }}">
                    @csrf
                    @method('PUT')
                    
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

                    <div class="mb-4">
                        <label class="form-label fw-semibold" style="font-size:13.5px">Nama Institusi / Organisasi</label>
                        <input type="text" name="institution_name" class="form-control" value="{{ $settings['institution_name'] ?? 'STIKes Panti Waluya Malang' }}" required>
                        <div class="form-text" style="font-size:11px">Digunakan pada sub-header sidebar, halaman login, dan kop surat PDF.</div>
                    </div>

                    <hr class="my-4" style="color: #cbd5e1;">

                    <div class="d-flex gap-2 justify-content-end">
                        <button type="submit" class="btn btn-primary px-4 py-2 fw-semibold">
                            <i class="bi bi-save me-2"></i>Simpan Perubahan
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
