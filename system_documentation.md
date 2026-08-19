# DOKUMENTASI SISTEM & PANDUAN PENGGUNAAN
## PRISMA-PW (Portal Informasi Sumber Daya Manusia Panti Waluya)
### STIKes Panti Waluya Malang

---

## 1. PENDAHULUAN
**PRISMA-PW** (*Portal Informasi Sumber Daya Manusia Panti Waluya*) adalah Sistem Informasi Manajemen Data Pegawai (SIMPEG) internal yang dirancang khusus untuk mengelola data dosen dan tenaga kependidikan (tendik) di lingkungan **STIKes Panti Waluya Malang**.

Sistem ini membantu unit kerja Kepegawaian (HRD) dalam administrasi data pegawai aktif, riwayat hidup (CV), pelatihan, dokumen digital penting, proses resign (arsip pegawai non-aktif), hingga ekspor laporan demografi dan turnover secara digital dan aman.

---

## 2. ARSITEKTUR TEKNOLOGI & DAFTAR MODEL
Aplikasi ini dibangun menggunakan arsitektur modern berbasis framework PHP:
*   **Framework Utama**: Laravel 11 (PHP 8.2+)
*   **Database**: MySQL/MariaDB (untuk operasional) & SQLite Memory (untuk unit testing)
*   **Frontend UI**: Bootstrap 5, Bootstrap Icons, Google Fonts (Inter)
*   **Library Ekspor**:
    *   `maatwebsite/excel` (Generator Laporan `.xlsx`)
    *   `barryvdh/laravel-dompdf` (Generator Dokumen `.pdf` & CV Instan)

### Skema Database & Model Utama:
1.  **`User`**: Menyimpan data akun login pengelola sistem (Admin IT, HRD, Guest).
2.  **`Employee`**: Menyimpan data utama identitas pegawai (aktif & non-aktif via mekanisme soft delete `deleted_at`).
3.  **`EmployeeFamily`**: Riwayat keluarga dan daftar tanggungan (pasangan, anak, dll).
4.  **`EmployeeEducation`**: Riwayat pendidikan formal pegawai (dari tingkat SD, D3, S1, S2 hingga S3).
5.  **`EmployeeTraining`**: Riwayat pelatihan, sertifikasi kompetensi, dan lisensi profesi (serta masa berlakunya).
6.  **`EmployeeDocument`**: Unggahan berkas digital penting (KTP, NPWP, BPJS, Ijazah, dll).
7.  **`ResignationDetail`**: Catatan alasan pengakhiran kerja, status clearance aset, dan catatan penyerahan berkas.
8.  **`Setting`**: Menyimpan konfigurasi dinamis nama aplikasi dan nama instansi di database.

---

## 3. PANDUAN INSTALASI & INSTALASI ULANG

Untuk memasang sistem PRISMA-PW di server lokal baru, ikuti langkah-langkah berikut:

```bash
# 1. Masuk ke folder proyek
cd C:\Users\Tobias\Documents\prisma-pw

# 2. Pasang library dependensi PHP via Composer
composer install

# 3. Buat file .env dan sesuaikan konfigurasi database Anda
cp .env.example .env

# 4. Jalankan migrasi tabel dan seeding data awal (impor data CSV dosen/karyawan)
php artisan migrate:fresh --seed

# 5. Jalankan local development server
php artisan serve
```

---

## 4. SISTEM KEAMANAN & PENYIMPANAN DOKUMEN (SECURE STORAGE)
Untuk menjaga keamanan data privasi kepegawaian dari pencurian berkas (oleh peretas/hacker) atau akses ilegal lainnya:

1.  **Penyimpanan Privat (Private Storage)**:
    Semua dokumen yang diunggah (KTP, NPWP, Ijazah, BPJS) **tidak** disimpan di folder publik. Berkas disimpan di direktori privat:
    `storage/app/private/employees/documents/{employee_id}/`
2.  **Proteksi Rute (Auth Gatekeeper)**:
    Berkas tidak memiliki alamat URL publik langsung. Akses pengunduhan dan pratinjau dilakukan melalui rute dinamis yang divalidasi oleh `DocumentController`:
    *   `GET /documents/{document}/download` (Unduh Berkas)
    *   `GET /documents/{document}/preview` (Pratinjau Berkas)
    Rute ini dilindungi middleware `auth` sehingga hanya pengguna yang telah login resmi yang dapat membuka dokumen tersebut.
3.  **Safety Catch Koneksi**:
    Inisialisasi konfigurasi sistem menggunakan `try-catch` block khusus pada `AppServiceProvider` untuk memastikan server web tidak akan crash saat database MySQL offline secara tidak sengaja.

---

## 5. HAK AKSES PENGGUNA (ROLE ACCESS)

Sistem ini menerapkan **Role-Based Access Control (RBAC)** dengan 3 tingkatan hak akses:

| Fitur / Menu | Admin IT | Tim HRD | Akun Guest / Tamu |
| :--- | :---: | :---: | :---: |
| **Login Aplikasi** | Ya | Ya | Ya |
| **Lihat Dashboard & Daftar Pegawai** | Ya | Ya | Ya |
| **Tambah & Edit Data Pegawai** | Ya | Ya | Tidak (Read-only) |
| **Unggah Dokumen / Pendidikan / Keluarga** | Ya | Ya | Tidak (Read-only) |
| **Proses Resign & Edit Alasan** | Ya | Ya | Tidak (Read-only) |
| **Ekspor Excel & PDF Laporan** | Ya | Ya | Ya |
| **Cetak CV Pegawai (PDF)** | Ya | Ya | Ya |
| **Manajemen Master Departemen & Jabatan** | Ya | Ya | Tidak |
| **Ubah Identitas / Branding Aplikasi** | Ya | Ya | Tidak |
| **Manajemen User (Tambah/Edit User)** | Ya | Tidak | Tidak |

---

## 6. PANDUAN PENGGUNAAN (USER MANUAL)

### A. Manajemen Pegawai Aktif
1.  Buka menu **Pegawai Aktif** di sidebar.
2.  Gunakan bar pencarian (Cari Nama/NIK) dan filter Departemen, Status Kerja (Tetap/Kontrak), atau Jenis Kelamin untuk menyaring data.
3.  Klik tombol **Export Excel** atau **Export PDF** di pojok kanan atas untuk mengekspor daftar pegawai sesuai dengan filter pencarian yang Anda terapkan.
4.  Klik ikon 👁️ pada salah satu pegawai untuk masuk ke halaman detail profilnya.

### B. Cetak CV Pegawai ke PDF
1.  Masuk ke halaman detail salah satu pegawai aktif.
2.  Klik tombol merah 🔴 **Cetak CV (PDF)** di bagian kanan atas halaman.
3.  Sistem secara otomatis akan mengunduh lembar biodata formal lengkap yang dihiasi Logo Resmi STIKes Malang dan tata letak yang siap cetak (hardcopy).

### C. Pemrosesan Pegawai Keluar (Resign)
1.  Buka detail pegawai aktif yang ingin dinonaktifkan.
2.  Klik tombol kuning ⚠️ **Proses Resign**.
3.  Isi tanggal pengakhiran kerja, kategori alasan (Resign Mandiri, PHK, Pensiun, dll), dan catatan clearance penyerahan aset kantor.
4.  Klik **Simpan**. Pegawai secara otomatis dikeluarkan dari daftar aktif dan dipindahkan ke **Arsip Resign**.

### D. Mengedit Riwayat Arsip Resign
1.  Buka menu **Arsip Resign** di sidebar.
2.  Klik detail mantan pegawai yang ingin disunting.
3.  Klik tombol **Edit Alasan** di header *"Detail Pengakhiran Kerja"*.
4.  Anda dapat mengedit **Tanggal Resmi Keluar** maupun **Tanggal Diarsipkan (Soft Delete)**, kategori alasan keluar, hingga status clearance berkas.
5.  Jika pegawai bersangkutan bekerja kembali, klik tombol hijau **Pulihkan Pegawai** di bagian atas untuk mengembalikan statusnya ke Pegawai Aktif secara utuh.

### E. Mengubah Nama & Branding Aplikasi secara Mandiri
1.  Buka menu **Pengaturan Sistem** di sidebar kiri.
2.  Ubah isian:
    *   **Nama Singkat Aplikasi** (misal: *PRISMA-PW*).
    *   **Nama Panjang Deskripsi Aplikasi** (misal: *Portal Informasi Sumber Daya Manusia Panti Waluya*).
    *   **Nama Institusi** (misal: *STIKes Panti Waluya Malang*).
3.  Klik **Simpan Perubahan**. Semua tulisan di website (termasuk halaman login, sidebar, footer, dan kop dokumen PDF) akan langsung berubah secara real-time.

---

*Dokumentasi ini dibuat otomatis oleh Antigravity untuk STIKes Panti Waluya Malang.*
