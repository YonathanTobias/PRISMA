# Walkthrough — Sistem Manajemen Data Pegawai (SIMPEG)

Seluruh modul dan fitur **Sistem Manajemen Data Pegawai (SIMPEG)** berbasis **Laravel 11** dan **Bootstrap 5** telah selesai dibangun.

---

## 🚀 Status Aplikasi
Server pengembangan Laravel saat ini telah aktif di:
👉 **[http://127.0.0.1:8000](http://127.0.0.1:8000)**

---

## 🔑 Kredensial Login Default

| Role | Email | Password | Hak Akses |
|---|---|---|---|
| **Admin IT** | `admin@simpeg.local` | `password` | Full Administrative Access (termasuk Manajemen User) |
| **Tim HRD** | `hrd@simpeg.local` | `password` | CRUD Pegawai, Dokumen, Arsip Resign, & Laporan |

---

## 📦 Ringkasan Fitur Terimplementasi

### 1. **Modul 1: Halaman Data Pegawai Aktif**
- 📋 **CRUD Pegawai**: Tambah, edit, dan tampilkan profil pegawai lengkap.
- 🗂️ **Navigasi Tab Profil**:
  - **Biodata & Informasi Kepegawaian** (NIK, Status PKWTT/PKWT/Probation/Magang, Departemen, Jabatan, Atasan).
  - **Keluarga & Tanggungan** (Data pasangan, anak, orang tua, status tanggungan).
  - **Dokumen Digital** (Repository berkas KTP, NPWP, BPJS, Ijazah, Kontrak Kerja, SK).
  - **Riwayat Pendidikan** (Formal dari SD-S3, IPK, Tahun Lulus).
  - **Pelatihan & Sertifikasi** (Sertifikasi profesi, lisensi, penyelenggara, masa berlaku).
- ⚠️ **Alert Otomatis**: Warning di Dashboard untuk dokumen dan kontrak kerja yang akan kedaluwarsa (&lt; 30 hari).

### 2. **Modul 2: Halaman Arsip Pegawai Resign / Non-Aktif**
- 🗄️ **Mekanisme Soft Delete**: Mengubah status pegawai menjadi resign secara otomatis memindahkan record ke Arsip Resign tanpa menghapus permanen.
- 📋 **Detail Pengakhiran Kerja**: Catatan tanggal resmi keluar, alasan (Resign Mandiri, Habis Kontrak, Pensiun, PHK), dan status clearance aset.
- 📁 **Dokumen Keluar (Exit Documents)**: Upload & download Paklaring, Surat Pengunduran Diri, & Form Clearance.
- 🔍 **Pencarian Historis & Pemulihan**: Cari mantan pegawai untuk verifikasi ulang, cetak ulang dokumen, atau pulihkan (restore) ke status aktif jika diperlukan.

### 3. **Modul 3: Laporan & Statistik (Reporting)**
- 📊 **Laporan Demografi**: Berdasarkan jenis kelamin, usia, tingkat pendidikan, dan departemen.
- 📈 **Laporan Status Kepegawaian**: Perbandingan pegawai Tetap vs Kontrak vs Probation & alert kontrak berakhir.
- 📉 **Laporan Turnover**: Rekapitulasi statistik pegawai keluar per periode waktu (tahun/bulan).
- 📤 **Ekspor Multi-Format**:
  - **Export Excel** (`.xlsx`) via `maatwebsite/excel`
  - **Export PDF** (`.pdf`) via `barryvdh/laravel-dompdf`
  - **Export Instan dari Tabel Utama**: Pengguna dapat mengekspor daftar Pegawai Aktif langsung dari tabel utama sesuai filter pencarian yang diterapkan.

### 4. **Fitur Tambahan & Branding Resmi STIKes**
- 📄 **Cetak CV Pegawai Instan (PDF)**: Tombol cetak CV individual pada profil pegawai untuk mengunduh biodata lengkap, riwayat pendidikan, keluarga, dan pelatihan dalam format PDF resmi.
- 🎨 **Branding Logo Institusi**: Logo resmi STIKes Panti Waluya Malang telah diintegrasikan di sidebar dashboard, kop surat laporan PDF (Daftar Pegawai & Detail CV), serta halaman login sistem.
- 🔑 **Favicon Kustom**: Logo STIKes digunakan sebagai tab icon (favicon) browser pada seluruh halaman sistem.
- 📅 **Modifikasi Tanggal Diarsipkan**: Mendukung perubahan manual untuk **Tanggal Resmi Keluar** dan **Tanggal Diarsipkan (Soft Delete)** pada data arsip pegawai resign langsung melalui modal edit alasan.
- ⚙️ **Pengaturan Sistem Dinamis**: Menu baru bagi HRD dan Admin IT untuk mengubah nama aplikasi (App Name), deskripsi aplikasi, dan nama institusi/organisasi secara langsung dan real-time dari database tanpa menyentuh kode.
- 🔒 **Penyimpanan Dokumen Terproteksi (Private Storage)**: Seluruh berkas digital sensitif (KTP, NPWP, BPJS, Ijazah) disimpan pada penyimpanan lokal terisolasi (`storage/app/private/`) di luar folder publik. Akses download & preview dilindungi middleware otentikasi sehingga wajib login terlebih dahulu (mencegah eksploitasi URL langsung).

### 5. **Master Data & Hak Akses (RBAC)**
- 🏢 **Master Departemen & Jabatan**: Kelola unit kerja & struktur posisi organisasi.
- 🛡️ **Role-Based Access Control**: Middleware pembatas hak akses untuk `admin_it` dan `hrd`.
- 👥 **Manajemen User**: Khusus role Admin IT untuk menambah, mengedit, atau menonaktifkan akun pengelola.

### 5. **Integrasi Data Master & Migrasi Database Lokal**
- 📥 **Impor Instan TablePress CSV Pegawai Aktif**: Sukses mengimpor 70+ data pegawai riil STIKes Panti Waluya Malang beserta data keluarga, riwayat pendidikan, dan jabatan/golongan.
- ⚙️ **Logika NIP Kosong**: Karyawan/dosen tanpa NIP otomatis diset sebagai pegawai **kontrak** dengan NIP bernilai `null` (di UI ditampilkan sebagai `—`).
- 📁 **Impor Instan CSV Pegawai Non-Aktif / Resign**: Sukses mengimpor 45+ data riwayat karyawan/dosen non-aktif (resign) lengkap dengan tanggal penghentian kerja, alasan resign/habis kontrak, dan status clearance berkas. Record secara otomatis di-softdelete dan diposisikan ke dalam Arsip Pegawai Resign.
- 🗄️ **Migrasi DB Lokal (MySQL/MariaDB)**: Database telah berhasil dimigrasikan dan diseed ke database lokal aktif milik user (`db_simpeg`).

---

## 🛠️ Lokasi Project

File proyek tersimpan di:
`C:\Users\Tobias\.gemini\antigravity\scratch\simpeg`

> 💡 **Rekomendasi**: Disarankan untuk membuka folder `C:\Users\Tobias\.gemini\antigravity\scratch\simpeg` sebagai **Active Workspace** Anda.
