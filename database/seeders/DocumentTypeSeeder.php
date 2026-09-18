<?php

namespace Database\Seeders;

use App\Models\DocumentType;
use Illuminate\Database\Seeder;

class DocumentTypeSeeder extends Seeder
{
    public function run(): void
    {
        $types = [
            [
                'code'        => 'ktp',
                'name'        => 'KTP (Kartu Tanda Penduduk)',
                'description' => 'Identitas kependudukan resmi WNI',
                'is_active'   => true,
            ],
            [
                'code'        => 'kk',
                'name'        => 'KK (Kartu Keluarga)',
                'description' => 'Dokumen susunan dan hubungan anggota keluarga',
                'is_active'   => true,
            ],
            [
                'code'        => 'npwp',
                'name'        => 'NPWP (Nomor Pokok Wajib Pajak)',
                'description' => 'Kartu identitas perpajakan',
                'is_active'   => true,
            ],
            [
                'code'        => 'bpjs_kesehatan',
                'name'        => 'BPJS Kesehatan',
                'description' => 'Kartu kepesertaan jaminan kesehatan nasional',
                'is_active'   => true,
            ],
            [
                'code'        => 'bpjs_ketenagakerjaan',
                'name'        => 'BPJS Ketenagakerjaan',
                'description' => 'Kartu kepesertaan jaminan ketenagakerjaan',
                'is_active'   => true,
            ],
            [
                'code'        => 'ijazah',
                'name'        => 'Ijazah Pendidikan Formal',
                'description' => 'Ijazah D3, D4, S1, S2, Profesi, atau S3',
                'is_active'   => true,
            ],
            [
                'code'        => 'transkrip',
                'name'        => 'Transkrip Nilai Akademik',
                'description' => 'Transkrip nilai jenjang pendidikan tinggi',
                'is_active'   => true,
            ],
            [
                'code'        => 'kontrak_kerja',
                'name'        => 'Kontrak Kerja / Perjanjian Kerja',
                'description' => 'Surat perjanjian kerja pegawai kontrak/tetap',
                'is_active'   => true,
            ],
            [
                'code'        => 'sk_jabatan',
                'name'        => 'SK Jabatan / SK Yayasan',
                'description' => 'Surat Keputusan pengangkatan jabatan struktural / yayasan',
                'is_active'   => true,
            ],
            [
                'code'        => 'serdos',
                'name'        => 'Sertifikat Pendidik (SERDOS)',
                'description' => 'Sertifikat kelulusan sertifikasi dosen nasional',
                'is_active'   => true,
            ],
            [
                'code'        => 'pekerti_aa',
                'name'        => 'Sertifikat PEKERTI / Applied Approach (AA)',
                'description' => 'Pelatihan peningkatan keterampilan dasar teknik instruksional',
                'is_active'   => true,
            ],
            [
                'code'        => 'inpassing',
                'name'        => 'SK Inpassing / Penyetaraan Pangkat',
                'description' => 'SK penetapan kesetaraan pangkat/golongan dosen LLDIKTI',
                'is_active'   => true,
            ],
            [
                'code'        => 'str_sip',
                'name'        => 'STR / SIP Tenaga Kesehatan',
                'description' => 'Surat Tanda Registrasi / Surat Izin Praktik Perawat, Apoteker, Ners',
                'is_active'   => true,
            ],
            [
                'code'        => 'sertifikat_pelatihan',
                'name'        => 'Sertifikat Pelatihan / Uji Kompetensi',
                'description' => 'Sertifikat workshop, seminar, sertifikasi kompetensi keahlian',
                'is_active'   => true,
            ],
            [
                'code'        => 'foto',
                'name'        => 'Foto Profil Resmi',
                'description' => 'Pas foto formal pegawai',
                'is_active'   => true,
            ],
            [
                'code'        => 'lainnya',
                'name'        => 'Dokumen Lainnya',
                'description' => 'Berkas dan dokumen pendukung lainnya',
                'is_active'   => true,
            ],
        ];

        foreach ($types as $type) {
            DocumentType::updateOrCreate(['code' => $type['code']], $type);
        }
    }
}
