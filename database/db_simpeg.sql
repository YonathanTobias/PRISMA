-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2026 at 05:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_simpeg`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `code`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'DOSEN', 'DOSEN', NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(2, 'S1 Farmasi', 'S1FARM', NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(3, 'TENAGA PENGAJAR', 'TENAGA', NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(4, 'TENAGA KEPENDIDIKAN', 'TENA1', NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(5, 'TENAGA PENDIDIK', 'TENA2', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(6, 'LABORAN', 'LABORA', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(7, 'PERTUKANGAN', 'PERTUK', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(8, 'PENGEMUDI', 'PENGEM', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(9, 'RUMAH TANGGA', 'RUMAHT', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(10, 'SATPAM', 'SATPAM', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(11, 'ADMINISTRASI', 'ADMINI', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(12, 'AKADEMIK/KEMAHASISWAAN AKPW', 'AKADEM', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(13, 'LABORAN PRODI RM', 'LABO1', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(14, 'PUSTAKAWAN', 'PUSTAK', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(15, 'STAF IT', 'STAFIT', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(16, 'LABORAN FARMASI', 'LABO2', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(17, 'DOSEN MIK', 'DOSENM', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(18, 'DOSEN FARMASI', 'DOSENF', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(19, 'LABORAN MIK', 'LABO3', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(20, 'RESEPSIONIS', 'RESEPS', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(21, 'KEUANGAN', 'KEUANG', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(22, 'K3', 'K3', NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(23, 'IT', 'IT', NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(24, 'Umum', 'UMUM', NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(25, 'AKADEMIK/KEMAHASISWAAN FARMASI', 'AKAD1', NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(26, 'PSDM', 'PSDM', NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(27, 'Laboran Farmasi', 'LABO4', NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(28, 'DOSEN NERS', 'DOSENN', NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(29, 'DOSEN S1 KEPERAWATAN', 'DOSENS', NULL, 1, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(30, 'S1 Keperawatan', 'KEPS1', 'S1 Keperawatan', 1, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(31, 'Profesi Ners', 'NERS', 'Profesi Ners', 1, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(32, 'D4 Manajemen Informasi Kesehatan', 'MIKD4', 'D4 Manajemen Informasi Kesehatan', 1, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(33, 'BAAK', 'BAAK', 'BAAK', 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(34, 'Feeder', 'FEEDER', 'Feeder', 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(35, 'Laboran DIV MIK', 'LABORA1', 'Laboran DIV MIK', 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(36, 'Laboran S1 Farmasi', 'LABORA2', 'Laboran S1 Farmasi', 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(37, 'PJ Apoteker', 'PJAPOT', 'PJ Apoteker', 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(38, 'Perpustakaan', 'PERPUS', 'Perpustakaan', 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(39, 'Resepsionis, Promo', 'RESEPS1', 'Resepsionis, Promo', 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10');

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `code`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'ktp', 'KTP (Kartu Tanda Penduduk)', 'Identitas kependudukan resmi WNI', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(2, 'kk', 'KK (Kartu Keluarga)', 'Dokumen susunan dan hubungan anggota keluarga', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(3, 'npwp', 'NPWP (Nomor Pokok Wajib Pajak)', 'Kartu identitas perpajakan', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(4, 'bpjs_kesehatan', 'BPJS Kesehatan', 'Kartu kepesertaan jaminan kesehatan nasional', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(5, 'bpjs_ketenagakerjaan', 'BPJS Ketenagakerjaan', 'Kartu kepesertaan jaminan ketenagakerjaan', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(6, 'ijazah', 'Ijazah Pendidikan Formal', 'Ijazah D3, D4, S1, S2, Profesi, atau S3', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(7, 'transkrip', 'Transkrip Nilai Akademik', 'Transkrip nilai jenjang pendidikan tinggi', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(8, 'kontrak_kerja', 'Kontrak Kerja / Perjanjian Kerja', 'Surat perjanjian kerja pegawai kontrak/tetap', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(9, 'sk_jabatan', 'SK Jabatan / SK Yayasan', 'Surat Keputusan pengangkatan jabatan struktural / yayasan', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(10, 'serdos', 'Sertifikat Pendidik (SERDOS)', 'Sertifikat kelulusan sertifikasi dosen nasional', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(11, 'pekerti_aa', 'Sertifikat PEKERTI / Applied Approach (AA)', 'Pelatihan peningkatan keterampilan dasar teknik instruksional', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(12, 'inpassing', 'SK Inpassing / Penyetaraan Pangkat', 'SK penetapan kesetaraan pangkat/golongan dosen LLDIKTI', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(13, 'str_sip', 'STR / SIP Tenaga Kesehatan', 'Surat Tanda Registrasi / Surat Izin Praktik Perawat, Apoteker, Ners', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(14, 'sertifikat_pelatihan', 'Sertifikat Pelatihan / Uji Kompetensi', 'Sertifikat workshop, seminar, sertifikasi kompetensi keahlian', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(15, 'foto', 'Foto Profil Resmi', 'Pas foto formal pegawai', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59'),
(16, 'lainnya', 'Dokumen Lainnya', 'Berkas dan dokumen pendukung lainnya', 1, '2026-09-17 18:51:59', '2026-09-17 18:51:59');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `employee_type` enum('dosen','tendik') NOT NULL DEFAULT 'tendik',
  `nidn` varchar(255) DEFAULT NULL,
  `nuptk` varchar(255) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `employment_status` enum('tetap','kontrak','magang','probation') NOT NULL DEFAULT 'tetap',
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED DEFAULT NULL,
  `functional_position` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `rank_group` varchar(255) DEFAULT NULL,
  `serdos` varchar(255) DEFAULT NULL,
  `pekerti` varchar(255) DEFAULT NULL,
  `applied_approach` varchar(255) DEFAULT NULL,
  `inpassing` varchar(255) DEFAULT NULL,
  `sk_dosen_tetap` varchar(255) DEFAULT NULL,
  `supervisor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `work_location` varchar(255) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `marital_status` enum('belum_menikah','menikah','cerai','duda_janda') DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `nik`, `full_name`, `employee_type`, `nidn`, `nuptk`, `birth_place`, `birth_date`, `gender`, `religion`, `address`, `phone`, `email`, `photo`, `employment_status`, `department_id`, `position_id`, `functional_position`, `specialization`, `rank_group`, `serdos`, `pekerti`, `applied_approach`, `inpassing`, `sk_dosen_tetap`, `supervisor_id`, `work_location`, `join_date`, `contract_end_date`, `status`, `marital_status`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1283/A', 'Wibowo, S.Kep., Ns. M.Biomed', 'dosen', '0707106702', '9339745646130093', 'Malang, 7 Oktober 1967', NULL, 'L', 'Katolik', 'PERUM GRAHA JATIMULYA KAV 21 RT.3 RW.6 JL. SAXOPHONE', NULL, NULL, NULL, 'tetap', 2, 36, 'Lektor (200 Kum)', NULL, 'Pembina Tk. I Golongan IV/b maks', '42934', '15 Juli 2011', '18 Juni 2015', 'Inpassing tmt 01-07-2016, Gol III/a 5-4', 'tmt 1 Januari 2019', NULL, 'Kampus STIKes Panti Waluya Malang', NULL, NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/c', '2026-09-01 01:43:04', '2026-09-01 01:43:09', NULL),
(2, '1098/A', 'Emy Sutiyarsih, S.Kep., Ns., M.Kes', 'dosen', '723106702', '3355745646230083', 'Bangorejo', '1967-10-23', 'P', 'Katolik', 'DE CASABLANCA RESIDENCE BLOK C6 NO.43 RT.5 RW.5 KEDUNGKANDANG', NULL, NULL, NULL, 'tetap', 30, 36, 'Lektor (231 Kum)', 'Keperawatan Ibu dan Anak', 'Pembina Tk. I Golongan IV/b maks', '45085', '18 Maret 2008', '15 Agustus 2011', 'Inpassing tmt 25-07-2019, Gol III/b 0-4', 'tmt 1 Januari 2019', NULL, 'Kampus STIKes Panti Waluya Malang', '1987-08-01', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/c', '2026-09-01 01:43:04', '2026-09-01 01:43:08', NULL),
(3, '1674/A', 'Ns. Monika Luhung, S.Kep., M.Kes', 'dosen', '715116501', '9447743644230083', 'Ujoh Bilang, 15 November 1965', NULL, 'P', 'Katolik', 'JL. SIMPANG IJEN NO. 37 RT.6 RW.10 MALANG', NULL, NULL, NULL, 'tetap', 30, 36, 'Asisten Ahli (150 Kum)', 'Promosi Kesehatan', 'Penata Tk. I Golongan III/d', NULL, '13 Juli 2012', '23 Oktober 2014', 'Inpassing tmt 01-10-2023, Gol III/b 0-3', 'tmt 1 Januari 2019', NULL, 'Kampus STIKes Panti Waluya Malang', '1997-09-16', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-09-01 01:43:04', '2026-09-01 01:43:08', NULL),
(4, '1778/A', 'Dr. Nanik Dwi Astutik, S.Kep.Ns., M.Kes', 'dosen', '0729127903', '5561757658230183', 'Malang, 29 Desember 1979', NULL, 'P', 'Kristen', 'PERUM GREEN LIVING BLOK B/11 A JL. SATSUI TUBUN RT.03 RW.06 GADANG', NULL, NULL, NULL, 'tetap', 30, 36, 'Asisten Ahli (150 Kum)', 'Kesehatan Jiwa Lansia', 'Penata Tk.I Golongan III/d', '44887', '5 Februari 2010', '15 Agustus 2011', 'Inpassing tmt 01-06-2020, Gol III/b 0-5', 'tmt 1 Januari 2019', NULL, 'Kampus STIKes Panti Waluya Malang', '2002-01-02', NULL, 'active', 'menikah', 'Agama: KRISTEN | Golongan: II/d', '2026-09-01 01:43:04', '2026-09-01 01:43:08', NULL),
(5, '1780/A', 'Ns. Ellia Ariesti, S.Kep., M.Kep', 'dosen', '710048002', '1742758659237112', 'Blitar, 10 April 1980', NULL, 'P', 'Katolik', 'JL. KEPUH GG VII A NO.26 RT.5 RW.5 MALANG', NULL, NULL, NULL, 'tetap', 30, 36, 'Lektor (300 Kum)', 'Jiwa', 'Penata Muda Tk. I Golongan III/b', '44846', '5 Februari 2010', '15 Agustus 2011', 'Inpassing tmt 23-01-2020, Gol III/b 0-5', 'tmt 1 Januari 2019', NULL, 'Kampus STIKes Panti Waluya Malang', '2002-01-02', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: II/d', '2026-09-01 01:43:04', '2026-09-01 01:43:08', NULL),
(6, '01/A/AKP.', 'Wisoedhanie Widi Anugrahanti, SKM., M.Kes', 'dosen', '0706117803', '2438756657231113', 'Malang, 6 November 1978', NULL, 'P', 'Islam', 'JL. GATOT SUBROTO I/36 SEDAYU - TUREN', NULL, NULL, NULL, 'tetap', 32, 36, 'Lektor (225 Kum)', 'Biostatistik', 'Penata Golongan III/c', '44046', '15 Juli 2011', '1 Agustus 2012', '01-04-2018, III/a 7-1', 'tmt 1 Januari 2019', NULL, 'Kampus STIKes Panti Waluya Malang', '2003-02-03', NULL, 'active', 'menikah', 'Agama: ISLAM | Golongan: III/c', '2026-09-01 01:43:04', '2026-09-01 01:43:09', NULL),
(7, '05/A/AKP', 'Ns. Oda Debora, S.Kep., M.Kep', 'dosen', '0729048501', '3761763664237012', 'Malang, 29 April 1985', NULL, 'P', 'Katolik', 'JL. IKAN MAS 1 NO. 3 RT.1 RW.7 LOWOKWARU MALANG', NULL, NULL, NULL, 'tetap', 30, 36, 'Lektor (300 Kum)', 'Gadar', 'Pembina Golongan IV/a', '44846', '15 Juli 2011', '43218', 'Inpassing tmt 01-06-2020, Gol III/b 0-5', 'tmt 1 Januari 2019', NULL, 'Kampus STIKes Panti Waluya Malang', '2008-11-01', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-09-01 01:43:04', '2026-09-01 01:43:08', NULL),
(8, '08/A/Akp', 'Eli Lea Widhia Purwandhani , Sst', 'tendik', NULL, NULL, 'Kediri', '1984-02-13', 'P', 'Kristen', 'ASRAMA YONKAV 3 / TANK RANDUAGUNG SINGOSARI MALANG', NULL, NULL, NULL, 'tetap', 33, 37, NULL, NULL, 'Penata Golongan III/c', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2012-05-01', NULL, 'active', 'menikah', 'Agama: KRISTEN', '2026-09-01 01:43:04', '2026-09-01 01:43:10', NULL),
(9, '09/A/AKP', 'Ns. Ifa Pannya Sakti, S.Kep., M.Kes.', 'dosen', '0701108603', '0333764665230303', 'Blitar, 01 Oktober 1986', NULL, 'P', 'Budha', 'DSN. BUNENG RT.1 RW.2 DS. BORO KEC. SELOREJO BLITAR', NULL, NULL, NULL, 'tetap', 30, 36, 'Asisten Ahli (150 kum)', 'Manajemen RS', 'Penata Muda Tk.I Golongan III/b', NULL, '13 Juli 2012', '41757', NULL, 'tmt 1 September 2022', NULL, 'Kampus STIKes Panti Waluya Malang', '2012-05-01', NULL, 'active', 'menikah', 'Agama: BUDHA', '2026-09-01 01:43:04', '2026-09-01 01:43:08', NULL),
(10, '10/A/AKP', 'Ns. Febrina Secsaria Handini, S.Kep., M.Kep', 'dosen', '0712028604', '1544764665237172', 'Malang, 12 Februari 1986', NULL, 'P', 'Kristen', 'JL. JALAK NO.23 RT.03 RW. 08 MALANG', NULL, NULL, NULL, 'tetap', 31, 36, 'Lektor (200 Kum)', 'Manajemen', 'Penata Golongan III/c', NULL, '16 Januari 2016', '10 Agustus 2021', 'Inpassing Tmt 01-06-2024, Gol III/b 0-11', 'tmt 1 Februari 2021', NULL, 'Kampus STIKes Panti Waluya Malang', '2012-05-01', NULL, 'active', 'menikah', 'Agama: KRISTEN', '2026-09-01 01:43:04', '2026-09-01 01:43:09', NULL),
(11, '2015.01.11/AKP', 'Ns. Berlianny Venny Sipollo, S.Kep., MNS', 'dosen', '0703089003', '5135768669230313', 'Maluku, 03 Agustus 1990', NULL, 'P', 'Kristen', 'JL. BENDUNGAN LAHOR 42 RT.011 RW.002 KEL.KARANGKATES KEC. SUMBERPUCUNG', NULL, NULL, NULL, 'tetap', 31, 36, 'Asisten Ahli (150 Kum)', 'Gerontik', 'Penata Muda Tk.I Golongan III/b', NULL, '26 Juli 2022', NULL, 'Inpassing Tmt 01-10-2023, Gol III/b 0-4', 'tmt 1 Juli 2019', NULL, 'Kampus STIKes Panti Waluya Malang', '2014-09-01', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-09-01 01:43:04', '2026-09-01 01:43:09', NULL),
(12, '2017.01.16.Akp', 'Ns. Yustina Emi Setyobudi, S.Kep., M.Kep', 'dosen', '0702058502', '7834763664230382', 'Malang, 2 Mei 1985', NULL, 'P', 'Katolik', 'Dsn. Tlogo Rt.19 Rw.02 Tlogosari - Donomulyo - Malang', NULL, NULL, NULL, 'tetap', 31, 36, 'Asisten Ahli (150 Kum)', 'Komunitas', 'Penata Muda Tk I Golongan III/b', NULL, '16 Januari 2017', NULL, NULL, 'TMT 01 Juli 2023', NULL, 'Kampus STIKes Panti Waluya Malang', '2015-01-02', NULL, 'active', 'menikah', 'Agama: KATOLIK', '2026-09-01 01:43:04', '2026-09-01 01:43:09', NULL),
(13, '2016.01.14/AKP', 'Ns. Maria Prieska Putri P. Ati, S.Kep., M.Kes', 'dosen', '0725039002', '0657768669230282', 'Kab. Semarang, 25 Maret 1990', NULL, 'P', 'Katolik', 'DSN. KAMPUNG RAPET I/III KEC. BANYUBIRU', NULL, NULL, NULL, 'tetap', 30, 36, 'Asisten Ahli (150 Kum)', 'Manajemen RS', 'Penata Muda Tk.I Golongan III/b', NULL, '19 Agustus 2024', NULL, NULL, 'tmt 1 September 2022', NULL, 'Kampus STIKes Panti Waluya Malang', '2015-01-02', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:04', '2026-09-01 01:43:09', NULL),
(14, '2016.01.15.Akp', 'Ns. Narita Diatanti, S.Kep', 'tendik', NULL, NULL, 'Malang', '1989-08-26', 'P', 'Katholik', 'JL. W.R. SUPRATMAN RT.002 RW.004 TANGGUNG - TUREN - MALANG', NULL, NULL, NULL, 'tetap', 34, 38, NULL, NULL, 'Penata Muda TK.I Golongan III/b', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2015-06-01', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:04', '2026-09-01 01:43:10', NULL),
(15, '2017.01.17/AKP', 'Ns. Achmad Syukkur, S.Kep., M.Kep', 'dosen', '0717119006', '8449768669130303', 'Bangkalan, 17 November 1990', NULL, 'L', 'Islam', 'JL. LAKS MARTADINATA 14 RT.14 RW.02 KOTALAMA KEDUNGKANDANG', NULL, NULL, NULL, 'tetap', 31, 36, 'Asisten Ahli (150 Kum)', 'KMB', 'Penata Muda Tk.I Golongan III/b', NULL, '20 Mei 2024', '5-9 Mei 2025', '01-03-2024 Gol III/b 0-8', 'tmt 1 Februari 2021', NULL, 'Kampus STIKes Panti Waluya Malang', '2016-05-02', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:04', '2026-09-01 01:43:09', NULL),
(16, '2018.01.24/STIKes', 'Ns. Yafet Pradikatama Prihanto, M.Kep', 'dosen', '0709088904', '9141767668131023', 'Temanggung, 9 Agustus 1989', NULL, 'L', 'Kristen', 'JL. PARAKAN NGADIREJO KM 04, Dsn. KARANGSENEN RT.01/04 DESA TRAJI KEC. PARAKAN KAB. TEMANGGUNG JAWA TENGAH', NULL, NULL, NULL, 'tetap', 30, 36, 'Lektor (200 Kum)', 'Jiwa', 'Penata Muda Tk.I Golongan III/b', NULL, '31 Mei 2021', '10 Agustus 2021', '01-03-2024 Gol III/b 0-8', 'tmt 1 Juli 2019', NULL, 'Kampus STIKes Panti Waluya Malang', '2017-04-03', NULL, 'active', 'menikah', 'Agama: KRISTEN', '2026-09-01 01:43:05', '2026-09-01 01:43:08', NULL),
(17, '07/A/AKP', 'Ns. Elizabeth Yun-Yun Vinsur, M.Kep', 'dosen', '0714018604', '0446764665230212', 'Malang, 14 Januari 1986', NULL, 'P', 'Katolik', 'JL. SUMPIL II/8 BRT.2 RW.6  BLIMBING MALANG', NULL, NULL, NULL, 'tetap', 30, 36, 'Lektor (200 Kum)', 'Gadar', 'Penata Golongan III/c', '45917', '41731', '12 Juni 2019', 'Inpassing tmt 01-03-2023, Gol III/b 0-4', 'tmt 1 Juli 2019', NULL, 'Kampus STIKes Panti Waluya Malang', NULL, NULL, 'active', 'belum_menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-09-01 01:43:05', '2026-09-01 01:43:08', NULL),
(18, '2022.01.46/STIKes', 'Vincensia Dea Prasetya Putri, Amd.Kes', 'tendik', NULL, NULL, 'Surabaya', '1996-09-28', 'P', 'Katolik', 'JL. BANDULAN BARU 162C', NULL, NULL, NULL, 'tetap', 35, 39, NULL, NULL, 'Pengantur Muda Tk.I Golongan II/b', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-01-02', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(19, '2020.01.42/Stikes', 'Devanus Lahardo, A.Md., S.Farm., M.Farm.', 'dosen', NULL, '7542753654130130', 'Blitar, 10 Desember 1975', NULL, 'L', 'Islam', 'JL. TELUK CENDRAWASIH 95E MALANG', NULL, NULL, NULL, 'tetap', 2, 36, NULL, 'Bahan Alam', NULL, NULL, NULL, NULL, NULL, 'Tmt 01 Nov 2024', NULL, 'Kampus STIKes Panti Waluya Malang', '2019-04-01', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:09', NULL),
(20, '450/B', 'Agus Widodo', 'tendik', NULL, NULL, 'Malang', '1975-08-19', 'L', 'Indonesia / Islam', 'PETUNGSEWU RT.09 RW.03 PETUNGSEWU WAGIR', NULL, NULL, NULL, 'tetap', 7, 45, NULL, NULL, 'Pengatur Golongan II/c maks', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '1995-12-01', NULL, 'active', 'menikah', 'Agama: ISLAM | Golongan: II/b', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(21, '03/C/Akp.', 'Yuli Hariadi Widodo', 'tendik', NULL, NULL, 'Malang', '1983-07-09', 'L', 'Indonesia / Katolik', 'SUKUN MARGA BHAKTI NO. 30 RT.2 RW.10', NULL, NULL, NULL, 'tetap', 8, 13, NULL, NULL, 'Pengatur Golongan II/c', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2009-12-01', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: II/a', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(22, '427/B', 'Indarti', 'tendik', NULL, NULL, 'Pasuruan', '1979-05-31', 'P', 'Indonesia / Islam', 'JL. S. SUPRIYADI GG. II E NO. 8 RT.2 RW.3 MALANG', NULL, NULL, NULL, 'tetap', 9, 14, NULL, NULL, 'Pengatur Golongan II/c maks', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '1995-03-16', NULL, 'active', 'menikah', 'Agama: ISLAM | Golongan: II/b', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(23, '2018.02.21/Akp', 'Natalia Hendri Susanti', 'tendik', NULL, NULL, 'Malang', '1985-12-25', 'P', 'Indonesia / Katolik', 'JL. DERKUKU SELATAN NO. 21 MALANG', NULL, NULL, NULL, 'tetap', 9, 14, NULL, NULL, 'Pengatur Muda Tk. I Golongan II/b', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2013-03-01', NULL, 'active', 'menikah', 'Agama: KATOLIK', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(24, '04/C/AKP.', 'David Ardianto', 'tendik', NULL, NULL, 'Malang', '1982-07-14', 'L', 'Indonesia / Kristen', 'JL. S. SUPRIYADI GG. 7 RT.6 RW.2 NO. 22 SUKUN', NULL, NULL, NULL, 'tetap', 10, 15, NULL, NULL, 'Pengatur Golongan II/c', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2008-02-25', NULL, 'active', 'menikah', 'Agama: KRISTEN', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(25, '1675/A', 'Wienda Setyowati, Se', 'tendik', NULL, NULL, 'Malang', '1979-07-30', 'P', 'Katolik', 'JL. MANYAR NO. 32 MALANG', NULL, NULL, NULL, 'tetap', 11, 19, NULL, NULL, 'Pembina Golongan IV/a', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '1997-09-16', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(26, '1685/A', 'Kristina Rini Susanti', 'tendik', NULL, NULL, 'Madiun', NULL, 'P', 'Katolik', 'JL. KEMANTREN I GG. SIMPANG BRAWIJAYA C-7 RT.12 RW.03 SUKUN MALANG', NULL, NULL, NULL, 'tetap', 38, 42, NULL, NULL, 'Penata Muda Golongan III/a maks', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '1998-05-15', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: II/d', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(27, '2018.02.20/Akp', 'Magdalena Novitasari Dwi Susanti, Amd', 'tendik', NULL, NULL, 'Malang', '1992-11-09', 'P', 'Katolik', 'JL.SEMBOJA 15 RT.02 RW.03 KEL. CEPOKOMULYO KEPANJEN', NULL, NULL, NULL, 'tetap', 12, 43, NULL, NULL, 'Pengatur Golongan II/c', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2017-04-03', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(28, '2019.02.25/Stikes', 'Raswati Prapti Rahayu,S.ST', 'tendik', NULL, NULL, 'Banyuwangi', '1993-06-26', 'P', 'Hindu', 'DSN. PERSEN DS. KEDUNGASRI 15/03 KEC. TEGALDLIMO KAB.BANYUWANGI', NULL, NULL, NULL, 'tetap', 35, 39, NULL, NULL, 'Penata Muda Golongan III/a', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2017-04-03', NULL, 'active', 'belum_menikah', 'Agama: HINDU | Golongan: III/a', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(29, '2020.02.38/Stikes', 'Ferra Meladiana, S.IP', 'tendik', NULL, NULL, 'Malang', '1996-03-09', 'P', 'Islam', 'JL. KERTORAHARJO 26B MALANG', NULL, NULL, NULL, 'tetap', 14, 17, NULL, NULL, 'Penata Muda Tk.I Golongan III/b', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-03-01', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(30, '2020.02.39/Stikes', 'Dyla Ayu Puspitasari, S.IP', 'tendik', NULL, NULL, 'Kediri', '1996-09-19', 'P', 'Islam', 'DUSUN PULOREJO RT.01 RW.20 DESA KRECEK KEC. BADAS KAB. KEDIRI JATIM', NULL, NULL, NULL, 'tetap', 14, 17, NULL, NULL, 'Penata Muda Tk.I Golongan III/b', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-03-01', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(31, NULL, 'Mochamad Ali Sodikin, S.Kep, Ns.Sp.Kep.J., M.Kep.', 'tendik', NULL, NULL, 'PASURUAN', '1977-10-24', 'L', NULL, 'Puri Purwosari  Indah A - 14 Purwosari', NULL, NULL, NULL, 'kontrak', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-04-01', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:05', NULL),
(32, '2021.01.44/STIKes', 'Venny Kurnia Andika, S.Si., M.Biotech', 'dosen', '0716038905', '1648767668230262', 'Pontianak, 16 Maret 1989', NULL, 'P', 'Kristen', 'JL. SUTAN SYAHRIR GG KARYA 1 NO.37 BERINGIN/KAPUAS', NULL, NULL, NULL, 'tetap', 2, 36, 'Asisten Ahli (150 kum)', NULL, 'Penata Muda Tk.I Golongan III/b', NULL, '19-23 Mei 2025', NULL, 'Inpassing tmt 01-05-2025 Gol III/b 1-10', 'tmt 1 September 2021', NULL, 'Kampus STIKes Panti Waluya Malang', '2020-09-01', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:05', '2026-09-01 01:43:09', NULL),
(33, '2022.01.48/STIKes', 'Ns. Oktavia Indriyani, S.Kep', 'tendik', NULL, NULL, 'Magelang', '1996-10-01', 'P', 'Katolik', 'Dusun Wonosari RT 4/ RW 21 Gunung Pring Muntilan', NULL, NULL, NULL, 'tetap', 4, 8, NULL, NULL, 'Penata Muda Golongan III/a', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-10-01', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(34, '2021.01.45/STIKes', 'Nita Dwi Nur Aini, S.ST., M.Kes', 'dosen', '0710069601', '6942774675230242', 'Probolinggo, 10 Juni 1996', NULL, 'P', 'Islam', 'Jalan mastrip gang mangga no 2 RT 01 RW 04 kel. Jrebeng wetan kec. Kedopok kota probolinggo jatim', NULL, NULL, NULL, 'tetap', 32, 36, 'Asisten Ahli (150 Kum)', 'Manajemen Pelayanan Lesehatan', 'Penata Muda Tk.I Golongan III/b', NULL, '20 Mei 2024', '5-9 Mei 2025', '01-03-2024 Gol III/b 0-8', 'tmt 1 September 2021', NULL, 'Kampus STIKes Panti Waluya Malang', '2021-02-01', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:09', NULL),
(35, '2023.01.49/STIKes', 'apt. Sirilus Deodatus Sawu, S.Farm., M.Farm', 'dosen', '0729039602', '1661774675130202', 'Soe, 29 Maret 1996', NULL, 'L', 'Katolik', 'Oekefan, RT/RW 007/003 Kota Soe Nusa Tenggara Timur', NULL, NULL, NULL, 'tetap', 2, 36, NULL, 'Klinis', NULL, NULL, '09-12-2024', '5-9 Mei 2025', NULL, 'tmt 1 Februari 2023', NULL, 'Kampus STIKes Panti Waluya Malang', '2022-08-01', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:05', '2026-09-01 01:43:09', NULL),
(36, '2025.02.61/STIKes', 'Yonathan Tobias Buttok, S.Tr.Kom', 'tendik', NULL, NULL, 'Malang', '1999-01-04', 'L', 'Kristen', 'JI. Tlogo Indah IV No. 65 RT.001 RW.002 Kelurahan Tlogomas Kecamatan Lowokwaru MALANG', NULL, NULL, NULL, 'tetap', 23, 32, NULL, NULL, 'Penata Muda Golongan III/a', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2022-08-01', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(37, '2024.02.54/STIKes', 'Atanasius Omega Dewantara, SE', 'tendik', NULL, NULL, 'Malang', '1999-05-02', 'L', 'Katolik', 'Perum Griya Asri Blok T-2 RT.09 RW.04 Kel.Pandanwangi Kec. Blimbing - MALANG', NULL, NULL, NULL, 'tetap', 11, 19, NULL, NULL, 'Penata Muda Golongan III/a', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2022-09-01', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(38, '2023.01.55/STIKes', 'Yushinta Elsa Valina, S.Farm', 'tendik', NULL, NULL, 'Malang', '1999-08-20', 'P', 'Kristen', 'JI. Tlogo Indah IV No. 65 RT.001 RWSUMBER WUNI GG MANGGA 304, KALIREJO, LAWANG', NULL, NULL, NULL, 'tetap', 36, 40, NULL, NULL, 'Penata Muda Golongan III/a', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2022-10-17', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(39, '2025.01.59/STIKes', 'Nancy Ratu Jovancha, S.Farm', 'tendik', NULL, NULL, 'Malang', '1998-11-25', 'P', 'Kristen', 'Jl. Hasanudin rt 03 rw 08 Junrejo, Batu', NULL, NULL, NULL, 'tetap', 36, 40, NULL, NULL, 'Penata Muda Golongan III/a', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2023-01-02', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(40, '2023.01.51/STIKes', 'Bhre Diansyah Dinda Khalifatulloh, S.Tr.Kes.,M.K.M', 'dosen', '0726029801', '2558776677130102', 'Lumajang, 26 Februari 1998', NULL, 'L', 'Islam', 'Perumnas Jatiroto RT.06/ RW.07 Lumajang', NULL, NULL, NULL, 'tetap', 32, 36, NULL, 'Manajemen Pelayanan Lesehatan', NULL, NULL, '09-12-2024', NULL, NULL, 'TMT 01 Juli 2023', NULL, 'Kampus STIKes Panti Waluya Malang', '2023-01-02', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:09', NULL),
(41, '2023.01.50/STIKes', 'Moh. Maulana,  S.Tr.Kes.,M.K.M', 'dosen', '0721079701', '4053775676130153', 'Jember, 21 Juli 1997', NULL, 'L', 'Islam', NULL, NULL, NULL, NULL, 'tetap', 32, 36, NULL, 'Manajemen Pelayanan Lesehatan', NULL, NULL, '19 Agust 2024', NULL, NULL, 'TMT 01 Juli 2023', NULL, 'Kampus STIKes Panti Waluya Malang', '2023-01-02', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:09', NULL),
(42, '2024.01.57/STIKes', 'Jeffry Atur Firdaus, S.T., M.Kom', 'dosen', NULL, '1361776677130113', 'Pasuruan, 29 Oktober 1998', NULL, 'L', 'Islam', NULL, NULL, NULL, NULL, 'tetap', 32, 36, NULL, 'Ilmu Komputer', NULL, NULL, NULL, NULL, NULL, 'Tmt 02 Sept 2024', NULL, 'Kampus STIKes Panti Waluya Malang', '2024-06-18', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:09', NULL),
(43, '2025.01.63/STIKes', 'Endang Krisnawati, S.Stat., M.Stat', 'dosen', NULL, '2247776677230153', 'Tulungagung, 15 September1998', NULL, 'P', 'Islam', NULL, NULL, NULL, NULL, 'tetap', 32, 36, NULL, 'Statistik', NULL, NULL, NULL, NULL, NULL, 'Tmt 01 Juni 2025', NULL, 'Kampus STIKes Panti Waluya Malang', '2025-01-02', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:09', NULL),
(44, '2025.01.62/STIKes', 'Ika Nuraini, S.Farm., M.Farm', 'dosen', NULL, '0033778679230143', 'Malang, 01 Juli 2000', NULL, 'L', 'Islam', NULL, NULL, NULL, NULL, 'tetap', 2, 36, NULL, 'Industri', NULL, NULL, NULL, NULL, NULL, 'Tmt 01 Oktober 2025', NULL, 'Kampus STIKes Panti Waluya Malang', '2024-07-01', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:09', NULL),
(45, '2025.01.64/STIKes', 'apt. Yulinda Pristi Dwi Hapysari, S.Farm., M.Farm', 'dosen', NULL, '8033774675230330', 'Kediri, 01 Juli 1996', NULL, 'P', 'Islam', NULL, NULL, NULL, NULL, 'tetap', 2, 36, NULL, 'Manajemen', NULL, NULL, NULL, NULL, NULL, 'Tmt 01 Nov 2025', NULL, 'Kampus STIKes Panti Waluya Malang', '2024-10-01', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:09', NULL),
(46, NULL, 'Apt. Hestining Puspaweni, S.Farm., M.Farm', 'tendik', NULL, NULL, 'Palangkaraya', '1995-10-11', 'P', NULL, NULL, NULL, NULL, NULL, 'kontrak', 18, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-09-01', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:05', NULL),
(47, '2025.01.65/STIKes', 'Fransiska Elsia One Irawan, S.Farm', 'tendik', NULL, NULL, 'Malang', '2001-01-28', 'P', 'Katolik', NULL, NULL, NULL, NULL, 'tetap', 36, 40, NULL, NULL, 'Penata Muda Golongan III/a', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2023-11-01', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(48, '2024.01.58/STIKes', 'Yolanda Agustina, S.Farm', 'tendik', NULL, NULL, 'Malang', '2001-07-12', 'P', 'Kristen', NULL, NULL, NULL, NULL, 'tetap', 36, 40, NULL, NULL, 'Penata Muda Golongan III/a', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2023-11-01', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(49, '2025.01.60/STIKes', 'Agnes Carolina Kristin, S.Tr.RMIK', 'tendik', NULL, NULL, 'Malang', '2001-03-01', 'P', NULL, NULL, NULL, NULL, NULL, 'tetap', 19, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-09-01', NULL, 'inactive', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:05', '2026-09-17 07:14:40', '2026-09-17 07:14:40'),
(50, NULL, 'Egnatius Permadi S.Tr.RMIK', 'tendik', NULL, NULL, 'Malang', '2003-02-22', 'L', 'Katolik', NULL, NULL, NULL, NULL, 'kontrak', 35, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2025-10-23', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(51, NULL, 'Vania Livia Kesrina Kendinar Makmur Jaya Waimuri, S.Tr.Par', 'tendik', NULL, NULL, 'Biak', '2001-06-08', 'P', 'Katolik', NULL, NULL, NULL, NULL, 'kontrak', 39, 44, NULL, NULL, 'Kontrak', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2025-07-01', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(52, NULL, 'Bernadette Adriana Farelita Yohandhy, S.Ak', 'tendik', NULL, NULL, 'Padang', '2001-11-05', 'P', 'Katolik', NULL, NULL, NULL, NULL, 'kontrak', 21, 25, NULL, NULL, 'Kontrak', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', NULL, NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(53, NULL, 'Katarina Sastrini Wawut, S.Ak', 'tendik', NULL, NULL, 'Nterlango', '2002-08-18', 'P', 'Katolik', NULL, NULL, NULL, NULL, 'kontrak', 21, 25, NULL, NULL, 'Kontrak', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2025-09-01', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(54, '2026.02.67/STIKes', 'Yohanes Yudha Saputra Bangko, S.Kom', 'tendik', NULL, NULL, 'Malang', '2003-08-19', 'P', 'Katolik', NULL, NULL, NULL, NULL, 'tetap', 23, 32, NULL, NULL, 'Kontrak', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2025-08-01', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(55, NULL, 'Dany Arief Herlambang, S.Tr.Kes', 'tendik', NULL, NULL, 'Mojokerto 11 Januari 2003', NULL, 'L', 'Islam', NULL, NULL, NULL, NULL, 'kontrak', 22, 26, NULL, NULL, 'Kontrak', NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2025-11-03', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:05', '2026-09-01 01:43:10', NULL),
(56, NULL, 'Mochamad Abdul Aziz', 'tendik', NULL, NULL, 'Malang', '1996-10-15', 'L', 'Indonesia / Islam', NULL, NULL, NULL, NULL, 'kontrak', 9, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2025-09-01', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:06', '2026-09-01 01:43:10', NULL),
(57, '1251/A', 'NUR CAHYO BUDIWIBOWO, SKp.', 'tendik', NULL, NULL, 'GENTENG', '1967-09-16', 'L', NULL, 'JL. GUNAWAN II NO. 3 RT.3 RW.3 KALIMERI - TAJINAN', NULL, NULL, NULL, 'tetap', 1, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '1990-05-01', NULL, 'inactive', 'menikah', 'Agama: KATOLIK | Golongan: III/c', '2026-09-01 01:43:06', '2026-09-01 01:54:48', '1992-04-30 17:00:00'),
(58, '1500/A', 'YUNI SRI HARYANTI', 'tendik', NULL, NULL, 'KLATEN', '1965-06-21', 'P', NULL, 'JL. KAPI JANULA III 15H / 11 PERUM SAWOJAJAR II RT.6 RW.14 PAKIS', NULL, NULL, NULL, 'tetap', 1, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '1995-05-01', NULL, 'inactive', 'menikah', 'Agama: KATOLIK | Golongan: III/b', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '1997-04-30 17:00:00'),
(59, '2015.01.14/AKP', 'BETTI DWI KARTIKASARI, S.Farm., M.Si., Apt', 'tendik', NULL, NULL, 'Malang', '1989-07-08', 'P', NULL, 'JL. GATOT SUBROTO NO. 52 RT.02 RW.03 TUREN MALANG', NULL, NULL, NULL, 'tetap', 5, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2015-10-01', NULL, 'inactive', 'menikah', 'Agama: KRISTEN', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2017-09-30 17:00:00'),
(60, NULL, 'ELOK DEA ORENS UBUNG WISNU, S.Farm., Apt.', 'tendik', NULL, NULL, 'MALANG', '1994-10-01', 'P', NULL, 'JL. INTAN 2 BLOK HC 12 PERUM GRIYA PERMATA ALAM RT.04 RW.11 NGIJO KARANGPLOSO MALANG', NULL, NULL, NULL, 'kontrak', 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2018-05-02', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2020-05-01 17:00:00'),
(61, '471/B', 'LENDRA EKO RIHANTO', 'tendik', NULL, NULL, 'MALANG', '1968-12-22', 'L', NULL, 'JL. KARYA BARAT NO. 30 RT.2 RW.2 BLIMBING - MALANG', NULL, NULL, NULL, 'tetap', 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '1997-09-01', NULL, 'inactive', 'menikah', 'Agama: ISLAM | Golongan: III/a  Maks', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '1999-08-31 17:00:00'),
(62, '04/B/AKP', 'KENJIRO GOGOH HANANTO, S.Kom', 'tendik', NULL, NULL, 'MALANG', '1992-02-28', 'L', NULL, 'JL. KEBEN II PERMAI D2 MALANG', NULL, NULL, NULL, 'tetap', 23, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2014-11-01', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2016-10-31 17:00:00'),
(63, NULL, 'C.WIDHYA PUTRI PERMATASARI, SAB', 'tendik', NULL, NULL, 'MALANG', '1991-07-01', 'P', NULL, 'JL. DANAU SENTANI II BLOK E3B/30', NULL, NULL, NULL, 'kontrak', 11, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2014-05-02', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2016-05-01 17:00:00'),
(64, NULL, 'AGNES, S.Akun', 'tendik', NULL, NULL, 'NANGA PINOH', '1993-09-07', 'P', NULL, 'JL. PENDIDIKAN GANG.FAMILI RT 001 RW 002 DESA PAAL, KAB.MELAWI, KALIMANTAN BARAT', NULL, NULL, NULL, 'kontrak', 11, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2015-11-01', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2017-10-31 17:00:00'),
(65, NULL, 'CHRISTA HARDIYANTI, SE', 'tendik', NULL, NULL, 'BANGIL', '1991-03-30', 'P', NULL, 'JL. SAWOJAJAR 5B/32 MALANG', NULL, NULL, NULL, 'kontrak', 11, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2015-12-01', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2017-11-30 17:00:00'),
(66, NULL, 'LINDA SUGIHARTI, SE', 'tendik', NULL, NULL, 'MALANG', '1992-04-17', 'P', NULL, 'JALAN HAMID RUSDI GG.3 NO. 228i MALANG', NULL, NULL, NULL, 'kontrak', 24, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2016-11-01', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2018-10-31 17:00:00'),
(67, NULL, 'THEODORA DYAH LISTYORINI, S.Pd', 'tendik', NULL, NULL, 'PROBOLINGGO', '1990-06-12', 'P', NULL, 'PERUM ASABRI H 206 RT.08 RW.12 KANIGARAN PROBOLINGGO', NULL, NULL, NULL, 'kontrak', 25, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2017-05-02', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2019-05-01 17:00:00'),
(68, '2018.02.19/AKP', 'AN NISA SHABIRAH, S.Ptk.', 'tendik', NULL, NULL, 'SURABAYA', '1995-05-28', 'P', NULL, 'PONDOK SIDOKARE INDAH KK 22 RT.39 RW.11  SIDOARJO', NULL, NULL, NULL, 'tetap', 14, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2017-03-01', NULL, 'inactive', 'belum_menikah', 'Agama: ISLAM | Golongan: III/a', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2019-02-28 17:00:00'),
(69, '2018.02.22AKP', 'DICKY CHRISTIAN DJUMIRAN, S.Kom', 'tendik', NULL, NULL, 'MALANG', '1990-12-08', 'L', NULL, 'JALAN UNTUNG SUROPATI SELATAN I NO. 6 MALANG', NULL, NULL, NULL, 'tetap', 23, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2017-05-02', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2019-05-01 17:00:00'),
(70, NULL, 'SERVIAN LAZUARDI,SE', 'tendik', NULL, NULL, 'MALANG', '1992-10-31', 'L', NULL, 'PERUM LPK NO. 13 MALANG', NULL, NULL, NULL, 'kontrak', 11, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2018-04-01', NULL, 'inactive', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2020-03-31 17:00:00'),
(71, NULL, 'GIDEON IMAN KRISTIANDRI,SE', 'tendik', NULL, NULL, 'JAKARTA', '1993-09-10', 'L', NULL, 'JL. SIMPANG IJEN NO. 25 MALANG', NULL, NULL, NULL, 'kontrak', 11, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2018-09-10', NULL, 'inactive', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2020-09-09 17:00:00'),
(72, NULL, 'Nova Inggaring Tjahyo Putri, S.Psi', 'tendik', NULL, NULL, 'KEDIRI', '1995-11-08', 'P', NULL, 'JL. GARUDA NO. 75 RT.066 RW.019 PARE KEDIRI', NULL, NULL, NULL, 'kontrak', 26, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-04-07', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2021-04-06 17:00:00'),
(73, NULL, 'MARGARETA ANASTASYA SHELVY C, Amd', 'tendik', NULL, NULL, 'SURABAYA', '1992-05-13', 'P', NULL, 'TEGALSARI RT.08 RW.04 KP. MALANG UTARA 7/7 D TEGALSARI', NULL, NULL, NULL, 'kontrak', 11, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-04-07', NULL, 'inactive', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2021-04-06 17:00:00'),
(74, NULL, 'Ns. IKA PUNDIA KRISTIN NINGRUM BERTUS S.Kep', 'tendik', NULL, NULL, 'NGAWI', '1990-06-15', 'P', NULL, 'JL. RAYA SOLO-SURABAYA KM.7 DS. KEBON RT.01 RW.03 KEC PARON KAB. NGAWI', NULL, NULL, NULL, 'kontrak', 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2015-03-02', NULL, 'inactive', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2017-03-01 17:00:00'),
(75, NULL, 'LERY PRASETYO, S.S, M.A', 'tendik', NULL, NULL, 'BLITAR', '1989-03-17', 'L', NULL, 'RT.01 RW.02 DUSUN TEGALREJO DESA GEMBONGAN KEC. PONGGOK BLITAR', NULL, NULL, NULL, 'kontrak', 5, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2015-10-01', NULL, 'inactive', 'belum_menikah', 'Agama: BUDHA', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2017-09-30 17:00:00'),
(76, NULL, 'NS. LIDIA RULIASTINIWA B, S.KEP', 'tendik', NULL, NULL, 'SEMARANG', '1992-08-03', 'P', NULL, 'JL. TANJUNG SARI IC/08 PEDURUNGAN TENGAH  SEMARANG', NULL, NULL, NULL, 'kontrak', 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2015-11-02', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2017-11-01 17:00:00'),
(77, NULL, 'VINCENTIA INDAH A.P, AMD.KEP', 'tendik', NULL, NULL, 'MALANG', '1994-07-09', 'P', NULL, 'JL. SUMBER WUNI 154 RT.1 RW.3 KEL. KALIREJO LAWANG', NULL, NULL, NULL, 'kontrak', 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2015-11-03', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2017-11-02 17:00:00'),
(78, NULL, 'Richard Alexander Faramond Lores S.Kom', 'tendik', NULL, NULL, 'YOGYAKARTA', '1997-01-19', 'L', NULL, 'JL. KH AGUS SALIM GG 4/3 RT 03 RW.11 PURWOKERTO', NULL, NULL, NULL, 'kontrak', 23, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-01-02', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2028-01-01 17:00:00'),
(79, NULL, 'Benedictus Yoga Permana, S.Kom', 'tendik', NULL, NULL, 'SLEMAN', '1995-09-01', 'L', NULL, 'PERUM GRIYA SATRIA MANDALATAMA BLOK IIA NO.27 RT.8 RW.5  KARANGLEWAS', NULL, NULL, NULL, 'kontrak', 23, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-01-02', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2028-01-01 17:00:00'),
(80, NULL, 'Maria Dani Ringksi, S.Pd', 'tendik', NULL, NULL, 'COVALIMA', '1997-02-21', 'P', NULL, 'Kemloko I RT.01 RW.01 Kel. Kenalan Kec. Borobudur Magelang Jateng', NULL, NULL, NULL, 'kontrak', 11, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-07-01', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2028-06-30 17:00:00'),
(81, NULL, 'Yusafat Eko Transisko, SE', 'tendik', NULL, NULL, 'BLITAR', '1992-09-13', 'L', NULL, 'DUSUN BANYUURIP RT 012 / RW 003 KELURAHAN MOJOREJO WATES', NULL, NULL, NULL, 'kontrak', 11, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-10-01', NULL, 'inactive', 'menikah', 'Agama: KATHOLIK', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2021-09-30 17:00:00'),
(82, NULL, 'GANES LUTFI TENTIPRATIWI., S.Farm.,Apt', 'tendik', NULL, NULL, 'KENDAL', '1992-02-02', 'P', NULL, 'DK. REJOSARI RT.7 RW.3 MOROREJO, KALIWUNGU, KENDAL', NULL, NULL, NULL, 'kontrak', 6, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-08-01', NULL, 'inactive', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2022-07-31 17:00:00'),
(83, NULL, 'Rendi Adiansa, S.Tr.Kes', 'tendik', NULL, NULL, 'LUMAJANG', '1997-01-12', 'L', NULL, 'JL. BRAWIJAYA 2 RT 11/RW 3 DESA TEMPEH LOR, KECAMATAN TEMPEH KAB. LUMAJANG, JAWA TIMUR', NULL, NULL, NULL, 'kontrak', 5, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-08-31', NULL, 'inactive', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2022-08-30 17:00:00'),
(84, NULL, 'Feliadewi Ruth ,S.Farm', 'tendik', NULL, NULL, 'SURABAYA', '1998-10-10', 'P', NULL, 'JL. S. SUPRIADI IV/2292 RT.3/RW.6 KEC. SUKUN KEL.SUKUN MALANG', NULL, NULL, NULL, 'kontrak', 27, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-09-01', NULL, 'inactive', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2022-08-31 17:00:00'),
(85, NULL, 'SERTIFIKAT Dimas Aulis Savitri, S.ST', 'tendik', NULL, NULL, 'BANGKALAN', '1996-01-16', 'P', NULL, 'Jl. Tanjung putra yudha III , no 35 , Sukun', NULL, NULL, NULL, 'kontrak', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2021-03-01', NULL, 'inactive', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '2023-02-28 17:00:00'),
(86, '1351/A', 'Maria Magdalena Setyaningsih, Ns. Sp. Kep. Mat', 'tendik', NULL, NULL, 'MALANG', '1970-02-12', 'P', NULL, 'JL. KENDALSARI BARAT IB NO.6 RT.3 RW.9  LOWOKWARU', NULL, NULL, NULL, 'tetap', 28, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '1992-01-07', NULL, 'inactive', 'menikah', 'Agama: KATOLIK | Golongan: III/c', '2026-09-01 01:43:06', '2026-09-01 01:56:00', '1994-01-06 17:00:00'),
(87, NULL, 'Ns. Kristianto Dwi Nugroho, S.Kep', 'tendik', NULL, NULL, 'KAB. SEMARANG', '1992-05-26', 'L', NULL, 'DUSUN DUKUHAN RT.14 RW. 03 DS. SUGIHAN KEC. TENGARAN', NULL, NULL, NULL, 'kontrak', 29, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2018-10-01', NULL, 'inactive', 'menikah', 'Agama: KRISTEN', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2020-09-30 17:00:00'),
(88, '2019.01.26/STIKes', 'Ida Ayu Preharsini Kusuma,S.Si., M.Biotech', 'tendik', NULL, NULL, NULL, NULL, 'P', NULL, 'Jl. THAMRIN NO.65, PEMEDILAN, PEMECUTAN, DENPASAR BARAT, DENPASAR', NULL, NULL, NULL, 'tetap', 18, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-04-01', NULL, 'inactive', 'menikah', 'Agama: HINDU', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2021-03-31 17:00:00'),
(89, NULL, 'Richard One Maxelly, S.ST', 'tendik', NULL, NULL, 'PROBOLINGGO', '1990-12-14', 'L', NULL, 'JL. MT. HARYONO GG XII NO. 8D, JATI, PROBOLINGGO', NULL, NULL, NULL, 'kontrak', 6, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-05-01', NULL, 'inactive', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2021-04-30 17:00:00'),
(90, NULL, 'Ganes Lutfi Tentipratiwi., S.Farm.,Apt', 'tendik', NULL, NULL, 'KENDAL', '1992-02-02', 'P', NULL, 'DK. REJOSARI RT.7 RW.3 MOROREJO, KALIWUNGU, KENDAL', NULL, NULL, NULL, 'kontrak', 6, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-07-01', NULL, 'inactive', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2021-06-30 17:00:00'),
(91, NULL, 'Ellyvina Setya Dhini, S.Si., M.Farm., Apt', 'tendik', NULL, NULL, 'MALANG', '1967-05-13', 'P', NULL, 'BUMI MONDOROKO RAYA M II NO. 2 SINGOSARI MALANG', NULL, NULL, NULL, 'kontrak', 18, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-07-01', NULL, 'inactive', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2021-06-30 17:00:00'),
(92, '2019.01.29/STIKes', 'Ns. Ucip Sucipto, M.Kep., Sp.K.MB', 'tendik', NULL, NULL, 'BREBES', '1986-08-30', 'L', NULL, 'Jl. Hasanudin No.179 RT 02 RW 04 Kel.Gajah Redjo Kec.Gedangan', NULL, NULL, NULL, 'tetap', 28, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-07-01', NULL, 'inactive', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2021-06-30 17:00:00'),
(93, '2019.01.30/STIKes', 'Ns. Dyah Untari, M.Kep., Sp.K.MB', 'tendik', NULL, NULL, 'JAKARTA', '1979-12-28', 'P', NULL, 'Jl.H. Muchtar Blok A-9 RT.07 RW.03 Kel. Duri Kosambi Kec. Cengkareng', NULL, NULL, NULL, 'tetap', 28, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-07-01', NULL, 'inactive', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2021-06-30 17:00:00'),
(94, '2017.02.18/AKP', 'Margaretha Ana Pertiwi, SE', 'tendik', NULL, NULL, 'MALANG', '1992-03-03', 'P', NULL, 'KRAJAN WETAN RT.01 RW.06 PURWOREJO - DONOMULYO', NULL, NULL, NULL, 'tetap', 11, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2016-05-02', NULL, 'inactive', 'menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2018-05-01 17:00:00'),
(95, '2018.02.23/AKP', 'Rensy Tejowati Prabowo, SE', 'tendik', NULL, NULL, 'MALANG', '1993-02-28', 'P', NULL, 'PERUM TUMPANG PERMAI BLOK O NO. 8 RT.14 RW.04 KEL JERU KEC. TUMPANG', NULL, NULL, NULL, 'tetap', 11, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2017-04-03', NULL, 'inactive', 'menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2019-04-02 17:00:00'),
(96, NULL, 'Fransiskus Eldo Kurniawan, S.E', 'tendik', NULL, NULL, 'BLITAR', '1996-12-02', 'L', NULL, 'JL. IR. SOEKARNO NO 188 003/011, BENDOGERIT, SANAWETAN, BLITAR', NULL, NULL, NULL, 'kontrak', 11, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-09-01', NULL, 'inactive', 'belum_menikah', 'Agama: KATOLIK', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2028-08-31 17:00:00'),
(97, NULL, 'Ns. Nadia Oktiffiany, M.Kep', 'tendik', NULL, NULL, 'MALANG', '1993-10-30', 'P', NULL, 'JL. KENDALSARI BARAT IB NO.6 RT.3 RW.9  LOWOKWARU', NULL, NULL, NULL, 'kontrak', 29, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-09-01', NULL, 'inactive', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2028-08-31 17:00:00'),
(98, NULL, 'Rosalia Sarry Assari, S.Pd.', 'tendik', NULL, NULL, 'Sei Lawak', '1996-11-18', 'P', NULL, 'JALAN BENDUNGAN WONOGIRI NO.25', NULL, NULL, NULL, 'kontrak', 11, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-01-02', NULL, 'inactive', 'belum_menikah', 'Agama: KATHOLIK', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2022-01-01 17:00:00'),
(99, NULL, 'Akwila Yudhia Gustanto, S.Kom', 'tendik', NULL, NULL, 'Pamekasan', '1992-08-30', 'L', NULL, 'erum Genteng Kali Indah II/ No 7, JL Veteran Muda, Pamekasan Madura', NULL, NULL, NULL, 'kontrak', 15, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-02-01', NULL, 'inactive', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2022-01-31 17:00:00'),
(100, NULL, 'Mamiek Wilastri, A.Md.Farm', 'tendik', NULL, NULL, 'Pasuruan', '1979-02-15', 'P', NULL, 'JALAN SIMPANG KH YUSUF BLOK A-8, TASIKMADU, LOWOKWARU MALANG', NULL, NULL, NULL, 'kontrak', 16, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-03-01', NULL, 'inactive', 'menikah', 'Agama: ISLAM', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2022-02-28 17:00:00'),
(101, NULL, 'Rendi Adiansa, S.Tr.Kes', 'tendik', NULL, NULL, 'LUMAJANG', '1997-01-12', 'L', NULL, 'L. BRAWIJAYA 2 RT 11/RW 3 DESA TEMPEH LOR, KECAMATAN TEMPEH KAB. LUMAJANG, JAWA TIMUR', NULL, NULL, NULL, 'kontrak', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-08-19', NULL, 'inactive', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2022-08-18 17:00:00'),
(102, NULL, 'Feliadewi Ruth ,S.Farm', 'tendik', NULL, NULL, 'SURABAYA', '1998-10-10', 'P', NULL, 'JL. S. SUPRIADI IV/2292 RT.3/RW.6 KEC. SUKUN KEL.SUKUN MALANG', NULL, NULL, NULL, 'kontrak', 16, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-09-01', NULL, 'inactive', 'belum_menikah', 'Agama: KRISTEN', '2026-09-01 01:43:07', '2026-09-01 01:56:00', '2022-08-31 17:00:00'),
(103, NULL, 'SERTIFIKAT Dimas Aulis Savitri, S.ST', 'tendik', NULL, NULL, 'BANGKALAN', '1996-01-16', 'P', NULL, 'Jl. Tanjung putra yudha III , no 35 , Sukun', NULL, NULL, NULL, 'kontrak', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kampus STIKes Panti Waluya Malang', '2021-03-01', NULL, 'inactive', 'belum_menikah', 'Agama: ISLAM', '2026-09-01 01:43:07', '2026-09-01 01:56:01', '2023-02-28 17:00:00'),
(104, '16/ KHS', 'Anastasia Sri Sulartri, MAN', 'dosen', '726016302', '9458741642230032', 'Yogyakarta, 26 Januari 1963', NULL, 'P', 'Katolik', NULL, NULL, NULL, NULL, 'tetap', 30, 36, 'Lektor (200 Kum)', 'Manajemen', 'Penata Muda Tk. I Golongan III/b', '42595', '30 Maret 2012', '23 Oktober 2014', '1-03-2011, Gol III/b 3-9', 'tmt 1 Januari 2019', NULL, NULL, NULL, NULL, 'active', NULL, NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08', NULL),
(105, 'NIDK', 'Mochamad Ali Sodikin, Ns., Sp. Kep Jiwa', 'dosen', '8818233420', '3356755656130093', 'Pasuruan, 24 Oktober 1977', NULL, 'L', 'Islam', NULL, NULL, NULL, NULL, 'tetap', 31, 36, NULL, 'Sp. Jiwa', 'Penata Muda Tk.I Golongan III/b', NULL, NULL, NULL, NULL, '6 Januari 2023-6 Januari 2026', NULL, NULL, '2020-04-01', NULL, 'active', NULL, NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:09', NULL),
(106, '2019.01.31/STIKes', 'Sugiyanto, S.Si, M.Farm., Apt', 'dosen', '0727056804', '0859746648200052', 'Surabaya, 27 Mei 1968', NULL, 'P', 'Islam', NULL, NULL, NULL, NULL, 'tetap', 2, 36, 'Asisten Ahli (150 Kum)', 'Klinis', 'Penata Muda Tk.I Golongan III/b', '45917', '43433', NULL, 'Inpassing tmt 01-03-2023, Gol III/b 0-3', 'tmt 19 Juli 2019', NULL, NULL, '2019-07-01', NULL, 'active', NULL, NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09', NULL),
(107, '2019.01.33/STIKes', 'Luluk Anisyah, S.Si, M.Farm., Apt', 'dosen', '0729107703', '5361755656300023', 'Surabaya, 29 Oktober 1977', NULL, 'P', 'Islam', NULL, NULL, NULL, NULL, 'tetap', 2, 36, 'Asisten Ahli (150 Kum)', 'Klinis', 'Penata Muda Tk.I Golongan III/b', '45917', '20 Agustus 2021', NULL, 'Inpassing tmt 01-03-2023, Gol III/b 0-3', 'tmt 19 Juli 2019', NULL, NULL, '2019-07-01', NULL, 'active', NULL, NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09', NULL),
(108, '2026.01.69/STIKes', 'Feffi Azzainatus Syaffira S.Farm., M.Farm', 'dosen', NULL, NULL, 'Lamongan, 15 Mei 2000', NULL, 'P', 'Islam', NULL, NULL, NULL, NULL, 'tetap', 2, 36, NULL, 'Kosmetik dan bahan Alam farmasi industri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-01', NULL, 'active', NULL, NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09', NULL),
(109, '2026.01.68/STIKes', 'apt Annisa Lazuardy, S.Si., M.Farm', 'dosen', NULL, NULL, 'Probolinggo 22 Agustus 1969', NULL, 'P', 'Islam', NULL, NULL, NULL, NULL, 'tetap', 2, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Tmt 01 Juli 2026', NULL, NULL, '2026-07-01', NULL, 'active', NULL, NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09', NULL),
(110, NULL, 'apt. Christina Novratilova Hardi, S.Farm', 'tendik', NULL, NULL, 'Mojokerto', '2001-11-02', 'P', 'Kristen', NULL, NULL, NULL, NULL, 'kontrak', 37, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-01', NULL, 'active', NULL, NULL, '2026-09-01 01:43:10', '2026-09-17 07:15:02', NULL),
(111, NULL, 'apt. Bismoko Darmo Wicaksono, S.Farm', 'tendik', NULL, NULL, 'Malang', '2000-10-26', 'L', 'Kristen', NULL, NULL, NULL, NULL, 'kontrak', 6, 11, NULL, NULL, 'Penata Muda Golongan III/a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-17', NULL, 'active', NULL, NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10', NULL);
INSERT INTO `employees` (`id`, `nik`, `full_name`, `employee_type`, `nidn`, `nuptk`, `birth_place`, `birth_date`, `gender`, `religion`, `address`, `phone`, `email`, `photo`, `employment_status`, `department_id`, `position_id`, `functional_position`, `specialization`, `rank_group`, `serdos`, `pekerti`, `applied_approach`, `inpassing`, `sk_dosen_tetap`, `supervisor_id`, `work_location`, `join_date`, `contract_end_date`, `status`, `marital_status`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(112, NULL, 'Helena Chandra Sagita S.Psi', 'tendik', NULL, NULL, 'Ujung Pandang', '1996-06-29', 'P', 'Katholik', NULL, NULL, NULL, NULL, 'kontrak', 26, 31, NULL, NULL, 'Kontrak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-01', NULL, 'active', NULL, NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_contacts`
--

CREATE TABLE `employee_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `relation` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_documents`
--

INSERT INTO `employee_documents` (`id`, `employee_id`, `type`, `name`, `file_path`, `file_name`, `file_size`, `file_type`, `issued_date`, `expiry_date`, `notes`, `created_at`, `updated_at`) VALUES
(9, 2, 'pekerti_aa', 'Appalaid Approach', 'employees/documents/2/j93C15GCjbn3nNGkGk1Tx84hMEELd3d7PhJGChwg.pdf', 'Appalaid Approach.pdf', '1.19 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(10, 2, 'ijazah', 'Ijazah D3', 'employees/documents/2/D5jguirkG9k1pOQCBUKrOupcLspSMXDgtRtmZPwm.pdf', 'Ijazah D3_B Emy.pdf', '1.84 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(11, 2, 'ijazah', 'Ijazah Ners', 'employees/documents/2/D7UsmubTVjI61SsgfeSKazblw05zdVxA8alztvs3.pdf', 'Ijazah Ners-Emy.pdf', '91.35 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(12, 2, 'ijazah', 'Ijazah S1', 'employees/documents/2/jBddtRPrOeF94bhLX727O9RzdG9HgDwMmQQ8kOuV.pdf', 'Ijazah S1-Emy.pdf', '93.23 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(13, 2, 'ijazah', 'Ijazah S2', 'employees/documents/2/1RY5PlpfL9m6nu471VdFVX5adX1JtRe9SsQOjLAB.pdf', 'Ijazah S2-Emy.pdf', '104.60 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(14, 2, 'ktp', 'KTP', 'employees/documents/2/efHDc4eV3Pt41jeB96ONG4s8eS0HdFwaPqJZ7Q8F.pdf', 'KTP_Emy.pdf', '149.39 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(15, 2, 'lainnya', 'Lektor', 'employees/documents/2/TDe3bxNTVpPbMFmknXiLvcFO3lv3DusC1BzQsMQ8.pdf', 'Lektor_Emy S.pdf', '394.05 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(16, 2, 'npwp', 'NPWP', 'employees/documents/2/XMqEk3vEzn34Qyqtu4affsDpAlLVczNfydVNe37L.pdf', 'NPWP_Emy.pdf', '149.39 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(17, 2, 'pekerti_aa', 'Pekerti', 'employees/documents/2/QyzeuQj4f5WVZNrTqjTiFKJIQZAju3nvst7YgCxm.pdf', 'Pekerti_Emy Sutiyarsih 2008.pdf', '890.34 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(18, 2, 'serdos', 'Serdos', 'employees/documents/2/9jmBqvQVTimLJyBu6CAOaAC3MTfNsNaj5w895geA.pdf', 'Serdos_Emy.pdf', '1.09 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(19, 2, 'str_sip', 'STR', 'employees/documents/2/AGlnsLFocQb6wmCPwRbPnK8hIlkep4zHHqPblljG.pdf', 'STR_Emy_Seumur Hidup.pdf', '260.93 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(20, 2, 'transkrip', 'Transkip D3', 'employees/documents/2/hgUbwPpLJ8E7foRaymLKW9p6k3ZAzSZMBBrMNiSc.pdf', 'Transkip D3_B Emy.pdf', '968.77 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(21, 2, 'transkrip', 'Transkrip Ners', 'employees/documents/2/nkASpkahXm7eh6Gfqsep8PbYhzuybiBCpL0hYpKY.pdf', 'Transkrip Ners-Emy.pdf', '100.30 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(22, 2, 'transkrip', 'Transkrip S.Kep', 'employees/documents/2/K8Xr2H68K5OeGizW6lWZJCu8hKoT0HXQSi5wWSKj.pdf', 'Transkrip S.Kep_Emy.pdf', '942.78 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(23, 2, 'transkrip', 'Transkrip S2', 'employees/documents/2/nyvvnk3nJoyLb6EmX3zTJSvrPipReDciRpv95DwD.pdf', 'Transkrip S2_emy.pdf', '508.39 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:22:01', '2026-09-17 19:22:01'),
(24, 9, 'pekerti_aa', 'Applied Approach', 'employees/documents/9/40OcKlUFxsh7iq4egW5iastgOOfxMsQW2isP33kg.pdf', 'Applied Approach.pdf', '676.29 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(25, 9, 'lainnya', 'Asisten Ahli', 'employees/documents/9/mJSZtocxps9ClTFkQybFRp9cGBGrpbosCBrurxsF.pdf', 'Asisten Ahli_01 Juli 2025_Ifa Pannya.pdf', '129.30 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(26, 9, 'ijazah', 'Ijazah M.Kes', 'employees/documents/9/f9tOMNo06kLEzdF0oZfPPJ0w9xf3XwYx5AvZtk5Z.pdf', 'Ijazah M.Kes_Ifa Pannya.pdf', '207.35 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(27, 9, 'ijazah', 'Ijazah S. Kep dan Ijasah Ners', 'employees/documents/9/376cZBjFiRNgr542mULaFjLGzQHn3rMaJ9WTBzDh.pdf', 'Ijazah S. Kep dan Ijasah Ners_Ifa Pannya.pdf', '271.93 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(28, 9, 'ktp', 'KTP', 'employees/documents/9/zFr5qlevHJZ8s6kPUTmICuGJ72hoRMK1Y7Ljp0OW.pdf', 'KTP Ifa Pannya.pdf', '598.77 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(29, 9, 'pekerti_aa', 'Pekerti', 'employees/documents/9/vEPrPBPijeYj4YPaZQihTGi1ffOapNmzWW3RBgFJ.pdf', 'Pekerti_Ifa_2013.pdf', '664.61 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(30, 9, 'lainnya', 'Pendamping Ijazah 1', 'employees/documents/9/delYhHtsvcG2CB9OSIXaGVckQXRA47KC660iKgov.pdf', 'Pendamping Ijazah 1.pdf', '327.13 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(31, 9, 'lainnya', 'Pendamping Ijazah 2', 'employees/documents/9/k3Yx612lJYmJm5gEY8rNX64Bpf1F8BzlEqhVTVWE.pdf', 'Pendamping Ijazah 2.pdf', '222.78 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(32, 9, 'str_sip', 'STR', 'employees/documents/9/RP5jTu2AuVlqCy1t24ufC7ZJVWiVTz4Ua548SJPu.pdf', 'STR_Ifa_Oktober 2025.pdf', '274.93 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(33, 9, 'transkrip', 'Transkrip Ners', 'employees/documents/9/q8hmB2lsSwEvuEJNkn9gTAEwCJDTPDkJUx0HxWg9.pdf', 'Transkrip Ners Ifa Pannya.pdf', '113.73 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(34, 9, 'transkrip', 'Transkrip S.Kep', 'employees/documents/9/IfygiXt8izzxirytFMK5mbGrVqXpmdp6JNvlz4tE.pdf', 'Transkrip S.Kep Ifa Pannya.pdf', '171.09 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(35, 9, 'transkrip', 'Transkrip S2', 'employees/documents/9/7wMSREaciLgWxhxppBh7lpexQQIPbNnxo0dfv7G0.pdf', 'Transkrip S2_Ifa pannya.pdf', '525.38 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:25:09', '2026-09-17 19:25:09'),
(36, 5, 'pekerti_aa', 'AA', 'employees/documents/5/g8YRE5xQ7bwSbGdfPCOHm280QEf4ym9q9HMU8cfo.pdf', 'AA_Ellia A.pdf', '165.15 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(37, 5, 'ijazah', 'Ijazah D3', 'employees/documents/5/F2boAimTJyZesSnMYZPYMif8fld182j7Wfn0Dc6l.pdf', 'Ijazah D3_Ellia.pdf', '109.41 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(38, 5, 'ijazah', 'Ijazah Ners', 'employees/documents/5/9mjDbc0dn2QCzrwzmPRrkBVSOmEEaOD1UKZ6sGa3.pdf', 'Ijazah Ners-Ellia.pdf', '92.24 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(39, 5, 'ijazah', 'Ijazah S1', 'employees/documents/5/KoPsK7up7HH0sez6BIJ5xAHaEl4ik2u5pNM6lnJw.pdf', 'Ijazah S1-Ellia.pdf', '88.50 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(40, 5, 'ijazah', 'Ijazah S2', 'employees/documents/5/jbQHSdb7gejlEPYDGcWj2ZESJFxMlQvvjnOAu7p8.pdf', 'Ijazah S2-Ellia.pdf', '404.96 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(41, 5, 'ktp', 'KTP', 'employees/documents/5/INIzC1rsujHfa12RwYcjWYtBosSXgjHJ2FOPPvEL.pdf', 'KTP_Ellia.pdf', '19.84 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(42, 5, 'lainnya', 'Lektor PAK', 'employees/documents/5/YjNadcgrJIXuXJervjuAt7eKIH2AsKgH47T2pl9w.pdf', 'Lektor_PAK_Ellia A.pdf', '569.61 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(43, 5, 'lainnya', 'Pekerti', 'employees/documents/5/WZWb0CB4NZVPhk2woaOeymD7QulZWx8UEJyT6DHO.pdf', 'Pekerti_Ellia A.pdf', '65.60 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(44, 5, 'serdos', 'Serdos', 'employees/documents/5/gk7K3CQUJyJXkmtdfZtUnH3AwVcUTOYQVCRmbR39.pdf', 'Serdos_0710048002_ellia ariesti.pdf', '1.18 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(45, 5, 'lainnya', 'SK JaFa', 'employees/documents/5/VQMsbWJBRBWcqyl9BeGEmNDVnoxu9aKBdPHzemNZ.pdf', 'SK JaFa Ellia Ariesti.pdf', '746.71 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(46, 5, 'lainnya', 'STR Ellia', 'employees/documents/5/xFEXyQpsRGnLO0qsIDiCg6tzzaYIphYgdLC1MyXs.pdf', 'STR_Ellia_Seumur Hidup.pdf', '259.45 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(47, 5, 'ijazah', 'Transkip D3', 'employees/documents/5/fX6aRFmjvIlytPWqMpiE2I2bgP31IFN3sPoblVgb.pdf', 'Transkip D3-Ellia.pdf', '181.48 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(48, 5, 'transkrip', 'Transkrip Ners', 'employees/documents/5/zMhVPIMAtSRnIWfOtvoPf4MebR8fXj8eVcGtjRKo.pdf', 'Transkrip Ners-Ellia.pdf', '97.17 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(49, 5, 'transkrip', 'Transkrip S1', 'employees/documents/5/lHjrgdeJXSXcD9spSKQMJDSs22zDmGTkHumQmyNM.pdf', 'Transkrip S1-Ellia.pdf', '116.25 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(50, 5, 'transkrip', 'Transkrip S2', 'employees/documents/5/Ds447KZnY7l9G996WFQ5avzwDZth66XPU4USoxWv.pdf', 'Transkrip S2-Ellia.pdf', '340.02 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:26:22', '2026-09-17 19:26:22'),
(51, 3, 'dokumen', 'AA', 'employees/documents/3/hACFpu8WcRlILYqOlu3o2efjYBW8CgYgqX8pzmEB.pdf', 'AA_Monika.pdf', '3.37 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:30:00', '2026-09-17 19:30:00'),
(52, 3, 'dokumen', 'Ijazah Ners', 'employees/documents/3/svEIBvHxVLP8sNFFKa9qocNDG6Z0uz029ZodBKvI.pdf', 'Ijazah Ners_Monika.pdf', '105.38 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:30:00', '2026-09-17 19:30:00'),
(53, 3, 'dokumen', 'Ijazah S1', 'employees/documents/3/6BQrTe164ezhFef06lnTFZTmabnCBwNfMVg6viUO.pdf', 'Ijazah S1-Monik.pdf', '87.31 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:30:00', '2026-09-17 19:30:00'),
(54, 3, 'dokumen', 'Ijazah S2', 'employees/documents/3/XW0HLo2gfL5muvkuLNffIzA3q6GgWC8DYFteoEC0.pdf', 'Ijazah S2-Monik.pdf', '298.81 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:30:00', '2026-09-17 19:30:00'),
(55, 3, 'dokumen', 'Pekerti', 'employees/documents/3/6A7FXV9jXEaQdY8elRpypuXmyHXXsGbZN0fA98ff.pdf', 'Pekerti_Monika.pdf', '3.19 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:30:00', '2026-09-17 19:30:00'),
(56, 3, 'dokumen', 'SK AA', 'employees/documents/3/uG5us5H6VOYKYUr1YxsN2ji2aPAIODkLnT13aq5x.pdf', 'SK AA Monika Luhung.pdf', '310.63 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:30:00', '2026-09-17 19:30:00'),
(57, 3, 'dokumen', 'STR', 'employees/documents/3/UEhbmsQb92qCyN8ESBOuT0gWny9Yv3YN3VwfRUg6.pdf', 'STR_Monika_11_2025.pdf', '558.09 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:30:00', '2026-09-17 19:30:00'),
(58, 3, 'dokumen', 'Transkip S2', 'employees/documents/3/36RRj6AlCZGOqKOFRMCLuqEMH08kh2XcjitYK58d.pdf', 'Transkip S2_Monika.pdf', '121.05 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:30:00', '2026-09-17 19:30:00'),
(59, 3, 'dokumen', 'Transkrip Ners', 'employees/documents/3/PJ1Lt0bJgiO3XnA5Jjm4d2qgcoOkROa3Gxq59a7F.pdf', 'Transkrip Ners-Monik.pdf', '123.15 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:30:00', '2026-09-17 19:30:00'),
(60, 3, 'dokumen', 'Transkrip S1', 'employees/documents/3/rfCgKK1KKg7la1ZIrVomIp3XKhcScLbc9lsjapQr.pdf', 'Transkrip S1-Monik.pdf', '131.98 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:30:00', '2026-09-17 19:30:00'),
(61, 104, 'dokumen', 'Applaid Approrch', 'employees/documents/104/XeiEt2X4sOzDptI0ucD4UVvWPQe1HTXMHjHsuxNM.pdf', 'Applaid Approrch_Sr Felisitas_2014.pdf', '1.06 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(62, 104, 'dokumen', 'Ijazah D3', 'employees/documents/104/aXvEjWioeY6xFZH0uUEj50WkUF5aQSqMlUh4laHm.pdf', 'Ijazah D3 Sr. Felisitas.pdf', '1.43 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(63, 104, 'dokumen', 'Ijazah S1', 'employees/documents/104/wXUzg3J9NCSKYEr0uXSYrnDMiL9YVStYvy2JRjVn.pdf', 'Ijazah S1 Sr. Felis.pdf', '292.34 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(64, 104, 'dokumen', 'Ijazah S2', 'employees/documents/104/jI4YRDe8W5baB3uqa6Fe0Cd2TC9v5lsYjPKy8y64.pdf', 'Ijazah S2 Sr Felis.pdf', '745.26 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(65, 104, 'dokumen', 'Jafa', 'employees/documents/104/cmDrPzo8zP2nGKbMagXgGHvkYMhoT73XNojlmRO1.pdf', 'Jafa_Sr. Felisitas 2011.pdf', '250.86 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(66, 104, 'dokumen', 'KTP', 'employees/documents/104/dOa79C4hEfjo8aBkpgrSsaD56BxsYSWXRerycy9C.pdf', 'KTP_New.pdf', '225.30 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(67, 104, 'dokumen', 'pekerti', 'employees/documents/104/3Q8ABCAy47iXYU1MUw4fxaGuHUen0A5cEv1L38fW.pdf', 'pekerti suster.pdf', '277.54 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(68, 104, 'dokumen', 'Serdos', 'employees/documents/104/PrUDOHtbTPTKI5d3hQ7iL0iIcsj0uFOOxYJQ5pgX.pdf', 'Serdos_Sr. Felisitas 2016.pdf', '1.39 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(69, 104, 'dokumen', 'SK lektor', 'employees/documents/104/Q9gA1PtBvnFkGvrpqYqtWr800jw7jfvLTZViEUy3.pdf', 'SK lektor Sr Felisitas Misc.pdf', '746.06 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(70, 104, 'dokumen', 'STR', 'employees/documents/104/wPobC3yPD8EBe668vJtINZ4fKRoT6vZUVNC6hgqD.pdf', 'STR_Sr Felisitas_2025.pdf', '746.10 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(71, 104, 'dokumen', 'Transkrip S1', 'employees/documents/104/ioNwNAQaQWpc3aEt98gLRgfeBtDjFIhx31aZ2WSY.pdf', 'Transkrip S1_Sr.Felis.pdf', '606.49 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(72, 104, 'dokumen', 'Transkrip S2', 'employees/documents/104/nYrUCC7JQISEuRl8mxLPdkNIadefoq5BI18f8p6k.pdf', 'Transkrip S2_Sr. Felisitas.pdf', '979.02 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 19:58:59', '2026-09-17 19:58:59'),
(73, 40, 'dokumen', 'IJAZAH S1', 'employees/documents/40/MJjUCbtEjwLnN9FjsoaJSrE3SJbqZFBcbtpa8uOp.pdf', 'IJAZAH S1.pdf', '127.84 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:00:30', '2026-09-17 20:00:30'),
(74, 40, 'dokumen', 'IJAZAH S2', 'employees/documents/40/lpf9rQa0zyHx3Tec8h3I4tGhBkk3uheiQCNpLgdm.pdf', 'IJAZAH S2.pdf', '131.80 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:00:30', '2026-09-17 20:00:30'),
(75, 40, 'dokumen', 'KTP', 'employees/documents/40/cNv6mKmxdRA4F70ZtQ32wCpmmppNVopykDjaVq0J.pdf', 'KTP_compressed.pdf', '63.91 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:00:30', '2026-09-17 20:00:30'),
(76, 40, 'dokumen', 'Pekerti', 'employees/documents/40/7PqK2UnJu1kYqVwqzZqCOlOK09wjLPdOQIa3wrYG.pdf', 'Pekerti_Bhre_2024.pdf', '783.57 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:00:30', '2026-09-17 20:00:30'),
(77, 40, 'dokumen', 'STR', 'employees/documents/40/sIK6RlFT1FOVntVnL2ndj2AxiQ7Wn5Fo6L9Z45wW.pdf', 'STR_Bhre_2_2026.pdf', '125.62 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:00:30', '2026-09-17 20:00:30'),
(78, 40, 'dokumen', 'STR Seumur hidup', 'employees/documents/40/97U2Cy9uS29WLANTopWzGUGVMgMffXK72wa7mObH.pdf', 'STR_Seumur hidup.pdf', '293.42 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:00:30', '2026-09-17 20:00:30'),
(79, 40, 'dokumen', 'TRANSKRIP S1', 'employees/documents/40/qg9ptMURHwv4KVkixAyxqjNz7SQdReWinQstzgJJ.pdf', 'TRANSKRIP S1.pdf', '174.85 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:00:30', '2026-09-17 20:00:30'),
(80, 40, 'dokumen', 'TRANSKRIP S2', 'employees/documents/40/tn18jxisrUrw71GumJvW154L2AwKA4ulw1bIgeFt.pdf', 'TRANSKRIP S2.pdf', '116.48 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:00:30', '2026-09-17 20:00:30'),
(81, 43, 'dokumen', 'Ijazah S1 dan S2', 'employees/documents/43/yz5557R5BWuhcy7Y3qBOMjMMJjFRNJ3K7rvypk9o.pdf', 'Ijazah S1 dan S2.pdf', '289.43 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:05:12', '2026-09-17 20:05:12'),
(82, 43, 'dokumen', 'KTP', 'employees/documents/43/YuCaOqJewsZhYGle1RRDg1HSbdPeuAsKxg6ucda2.pdf', 'KTP.pdf', '121.01 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:05:12', '2026-09-17 20:05:12'),
(83, 43, 'dokumen', 'Transkrip Nilai S1 dan S2', 'employees/documents/43/YzagFidoMk3ai6qwcMWnIJyuPXx2XiTpwqkSBkqU.pdf', 'Transkrip Nilai S1 dan S2.pdf', '296.46 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:05:12', '2026-09-17 20:05:12'),
(84, 42, 'dokumen', 'Ijazah S1', 'employees/documents/42/nufEqiOSVx4JKDrmOuaPjxE9h8qh98wjiLbDtqi0.pdf', 'Ijazah S1_Jeffry.pdf', '196.02 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:06:28', '2026-09-17 20:06:28'),
(85, 42, 'dokumen', 'Ijazah S2', 'employees/documents/42/hJNQPyMwyRsZHLdMjkbeEswWgp4f3seZOI6gQAPk.pdf', 'Ijazah S2_Jeffry.pdf', '149.99 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:06:28', '2026-09-17 20:06:28'),
(86, 42, 'dokumen', 'KTP', 'employees/documents/42/5SWWQm4YXnFXz29eF03UUrDFKvTmrKEIFXJ9nADn.pdf', 'KTPcompress (1).pdf', '428.14 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:06:28', '2026-09-17 20:06:28'),
(87, 42, 'dokumen', 'Transkrip S1', 'employees/documents/42/HF4KwHoZnScjybQ5VvVqvoZkJedHsKOQGtxoYWcZ.pdf', 'Transkrip S1_Jeffry.pdf', '218.16 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:06:28', '2026-09-17 20:06:28'),
(88, 42, 'dokumen', 'Transkrip S2', 'employees/documents/42/snQ85SHIJaXguCkQEYRIBV4EQMQDILZCmJNI3Gcz.pdf', 'Transkrip S2_Jeffry.pdf', '232.32 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:06:29', '2026-09-17 20:06:29'),
(89, 41, 'dokumen', 'Ijazah S1', 'employees/documents/41/meesVEKDC327J8MOcmA0sYl0fWYXCcuDuDrcZrro.pdf', 'Ijazah S1.pdf', '218.92 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:09:04', '2026-09-17 20:09:04'),
(90, 41, 'dokumen', 'Ijazah S2', 'employees/documents/41/T6ZX50Huw9Wagujwvdkslo8sjBdjgcgdofOv0vJj.pdf', 'Ijazah S2_Maulana.pdf', '160.74 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:09:04', '2026-09-17 20:09:04'),
(91, 41, 'dokumen', 'Pekerti', 'employees/documents/41/h37qXJ6QueHbjp4hduXXHRmDdvtgQUc8EH5zA9XE.pdf', 'Pekerti_Moh. Maulana_2024.pdf', '405.55 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:09:04', '2026-09-17 20:09:04'),
(92, 41, 'dokumen', 'STR Seumur hidup', 'employees/documents/41/fOf0jD3P5rMKwE56MLUzgDP1KcmJogBXJ1XQuV4D.pdf', 'STR_Seumur hidup.pdf', '283.62 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:09:04', '2026-09-17 20:09:04'),
(93, 41, 'dokumen', 'Transkrip S1', 'employees/documents/41/Lta9p7J41yPBjKE62yspMtgJhoWWcmU1eDxh1n7z.pdf', 'Transkrip S1.pdf', '334.31 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:09:04', '2026-09-17 20:09:04'),
(94, 41, 'dokumen', 'Transkrip S2', 'employees/documents/41/KUcrBxkRRStTt2bglYMi2zifPJK01PDtqcCzkBPD.pdf', 'Transkrip S2_maulana.pdf', '150.04 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:09:04', '2026-09-17 20:09:04'),
(95, 34, 'dokumen', 'STR', 'employees/documents/34/D9aHlDb3M8TjkM49DZl648qZQVHikYf932Rn3rfZ.pdf', 'e-STR Nita.pdf', '295.87 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:10:47', '2026-09-17 20:10:47'),
(96, 34, 'dokumen', 'Ijazah DIV', 'employees/documents/34/3HlsJDViGKUo5e4pyWzJdQub3JNqOHcA4i7bwfHa.pdf', 'Ijazah DIV_Nita_.pdf', '417.56 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:10:47', '2026-09-17 20:10:47'),
(97, 34, 'dokumen', 'Ijazah S2', 'employees/documents/34/xubGLl8DMxKgx06NO9r9O2kbmmEA8jA48EJt9Eey.pdf', 'Ijazah S2_Nita.pdf', '976.96 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:10:47', '2026-09-17 20:10:47'),
(98, 34, 'dokumen', 'KTP STR Foto', 'employees/documents/34/uubIodWEH0hmrewSAtwf05TBDq1A67uYZ1slez6x.pdf', 'KTP_STR_Foto_compressed.pdf', '265.49 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:10:47', '2026-09-17 20:10:47'),
(99, 34, 'dokumen', 'SK AA', 'employees/documents/34/nLSZChgfM5efABlDcvhnhxIKPwz7cv4xGFsOcr2r.pdf', 'SK AA Nita Dwi.pdf', '297.61 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:10:47', '2026-09-17 20:10:47'),
(100, 34, 'dokumen', 'Transkip S2', 'employees/documents/34/PO3mpMiJ9iEFnvQqS6PkypCsapdM5AhNXpr365qy.pdf', 'Transkip S2_Nita.pdf', '616.37 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:10:47', '2026-09-17 20:10:47'),
(101, 34, 'dokumen', 'Transkrip DIV', 'employees/documents/34/b1DAEYW0NaJciO75ZzqaF40Eaadf00by31Ix2lsz.pdf', 'Transkrip DIV_Nita_.pdf', '534.37 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:10:47', '2026-09-17 20:10:47'),
(102, 6, 'dokumen', 'AA', 'employees/documents/6/8bRSUB9WtA8jMUjUuhIW2jjSonqnIiqBGbmAuFoR.pdf', 'AA_Wisoedhanie Widi 2012.pdf', '1.89 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:11:35', '2026-09-17 20:11:35'),
(103, 6, 'dokumen', 'Ijazah D3', 'employees/documents/6/HyWwYdYcEVws0lMLHI5GFkPeKGNSTuda0P3cTeVN.pdf', 'Ijazah D3-Widi.pdf', '476.25 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:11:35', '2026-09-17 20:11:35'),
(104, 6, 'dokumen', 'Ijazah S1 S2', 'employees/documents/6/1zhc8daYME3EUIrIsb1ALEdJlW4SCYdYFEtDP9lo.pdf', 'Ijazah S1-S2-Widi.pdf', '355.75 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:11:35', '2026-09-17 20:11:35'),
(105, 6, 'dokumen', 'Jafa', 'employees/documents/6/OxJuYK6guWanAQ1UJO846OUq1Xo1o0xtveKIezK0.pdf', 'Jafa_Wisoedhani 2011.pdf', '249.69 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:11:35', '2026-09-17 20:11:35'),
(106, 6, 'dokumen', 'KTP', 'employees/documents/6/NNizqzTs9AWUepmQ3MGuEHdk2tKuAiDuN3INE7Df.pdf', 'KTP_Widi.pdf', '231.91 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:11:35', '2026-09-17 20:11:35'),
(107, 6, 'dokumen', 'Lektor', 'employees/documents/6/t82GDe4Dzk92eyoVUd9RGv4UtpnoSOyRY0GE0dRd.pdf', 'Lektor_2023_Widi.pdf', '1.28 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:11:35', '2026-09-17 20:11:35'),
(108, 6, 'dokumen', 'Pekerti', 'employees/documents/6/jiPKCOVJcG7eqayEzIMDjrMDqKN3NefhKy6a1kxG.pdf', 'Pekerti_wisoedhani 2011.pdf', '1.22 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:11:35', '2026-09-17 20:11:35'),
(109, 6, 'dokumen', 'SK SERDOS', 'employees/documents/6/LaogU9rJEpV9A3j2fXO5Y5cnXHmRxRj1M9UVwJRr.pdf', 'SK SERDOS WIDI_2020.pdf', '522.07 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:11:35', '2026-09-17 20:11:35'),
(110, 6, 'dokumen', 'Transkrip D3', 'employees/documents/6/T6SONskfFitU7GyK4N529thvLmWbkIYWvsURd35Q.pdf', 'Transkrip D3-Widi.pdf', '497.06 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:11:35', '2026-09-17 20:11:35'),
(111, 6, 'dokumen', 'Transkrip S1 S2', 'employees/documents/6/yCjVXHZaHcBFlivux4Wuec4bHwbZCSe0Qjgb73PT.pdf', 'Transkrip S1-S2-Widi.pdf', '403.84 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:11:35', '2026-09-17 20:11:35'),
(112, 31, 'dokumen', 'Ijazah AKPER', 'employees/documents/31/HGseVgCWD25fGt3UCqFfjtlL2dBU9xCfarZ5dYaR.pdf', 'Ijazah AKPER_Ali.pdf', '1.54 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(113, 31, 'dokumen', 'Ijazah Ners', 'employees/documents/31/rGYVSPmpEQIk2xjlFaSMtA66vUNCfZs8LFybU3px.pdf', 'Ijazah Ners_Ali.pdf', '863.05 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(114, 31, 'dokumen', 'Ijazah S. Kep', 'employees/documents/31/1XiYerMRAi7gGSHGu68bxpPzLLS7GpNAuZuicTVU.pdf', 'Ijazah S. Kep_Ali.pdf', '824.68 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(115, 31, 'dokumen', 'Ijazah S2', 'employees/documents/31/qjMXQctj9meLajASAcvbCtfEBUkhVwhFWrQzWmCN.pdf', 'Ijazah S2_Ali S.pdf', '917.52 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(116, 31, 'dokumen', 'Ijazah Sp Kep Jiwa', 'employees/documents/31/nIl08WQQp1ZgZGoaV66WmCEADZAbZqDIaS1y3M07.pdf', 'Ijazah Sp Kep Jiwa - Ali Sodikin.pdf', '345.66 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(117, 31, 'dokumen', 'Ijazah SPK SJ', 'employees/documents/31/80u9dmqQmb2KXel9WOlQTKTPWC8v4iEugdOnhKxD.pdf', 'Ijazah SPK SJ_Ali.pdf', '266.39 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(118, 31, 'dokumen', 'Ijazah SPK', 'employees/documents/31/FAQnpKDDCRf5XbqCnMlRktgYKL5ctsQMb0GaeS4U.pdf', 'Ijazah SPK_Ali.pdf', '321.46 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(119, 31, 'dokumen', 'KTP', 'employees/documents/31/n1pciOGgkToWnlpR4KazaLlPiINBszc9HotUWudm.pdf', 'KTP- Ali Sodikin.pdf', '180.23 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(120, 31, 'dokumen', 'STR Sp', 'employees/documents/31/AGgBjv7EuBWGL1IClWyEhJNjDXjNBbR89hWhToa4.pdf', 'STR Sp ALI.pdf', '0.00 KB', 'application/x-empty', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(121, 31, 'dokumen', 'Transkip S2', 'employees/documents/31/bVmCMDKapY6llOI4yyRnF7qQLyjJ1BEFWKT0hOHA.pdf', 'Transkip S2- Ali Sokidin.pdf', '628.26 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(122, 31, 'dokumen', 'Transkrip Akper', 'employees/documents/31/4doXPBDqoLpgh3rjfhoxRWtNjmKo0nkeMwv2wam9.pdf', 'Transkrip Akper_Ali.pdf', '255.57 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(123, 31, 'dokumen', 'Transkrip Ners', 'employees/documents/31/cTDMHu0KaZQ7wX3rC5FXwKI4To40qkIcjjxNT5uR.pdf', 'Transkrip Ners_Ali.pdf', '245.11 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(124, 31, 'dokumen', 'Transkrip S. Kep', 'employees/documents/31/Mfv6OEUMFmra0LVr5TWEwUcvcOXtqgJ8vOgaKsa6.pdf', 'Transkrip S. Kep_Ali.pdf', '275.72 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(125, 31, 'dokumen', 'Transkrip Sp. Kep. J', 'employees/documents/31/sVd5mCG7LIXVyZY1odeZr7Z5AdTQtLSyeUcMh4zM.pdf', 'Transkrip Sp. Kep. J.pdf', '233.23 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:18:13', '2026-09-17 20:18:13'),
(126, 15, 'dokumen', 'Pekerti', 'employees/documents/15/XERIlaBlL2c8sU3GgkXO80QyEcJkFmf3aRKUlmYl.pdf', '2024_Pekerti.pdf', '330.15 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:22:34', '2026-09-17 20:22:34'),
(127, 15, 'dokumen', 'AA', 'employees/documents/15/ovlB2XyJLRxUqflTaKbjKiW9WsqhV4PfqWthwW2Q.pdf', 'AA Ach Syukkur.pdf', '312.90 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:22:34', '2026-09-17 20:22:34'),
(128, 15, 'dokumen', 'Ijazah D3', 'employees/documents/15/wpvfgDFVfHFDrzGAygmd8Z2HSKwEUyQAUvL3zGE1.pdf', 'Ijazah D3_Syukur.pdf', '175.69 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:22:34', '2026-09-17 20:22:34'),
(129, 15, 'dokumen', 'Ijazah Ners', 'employees/documents/15/Q78tbapZI4c3qeqPPYGrq1a065hoX5G1rg80sSKK.pdf', 'Ijazah Ners_Syukur.pdf', '212.18 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:22:34', '2026-09-17 20:22:34'),
(130, 15, 'dokumen', 'Ijazah S1', 'employees/documents/15/RHf3ohZHzElvhb23bVArNQmkJmxYpRNrDTwabzgi.pdf', 'Ijazah S1.pdf', '714.47 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:22:34', '2026-09-17 20:22:34'),
(131, 15, 'dokumen', 'Ijazah S2', 'employees/documents/15/H9NYO1WZQEvbA7c34E16DNzs3oDgeWyAjT6AARwV.pdf', 'Ijazah S2_Syukur.pdf', '115.66 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:22:34', '2026-09-17 20:22:34'),
(132, 15, 'dokumen', 'KTP', 'employees/documents/15/AMJ7n8zqbBG13spq83XPMLxxnzGly4q0Az57rIiZ.jpeg', 'KTP Syukur.jpeg', '87.39 KB', 'image/jpeg', NULL, NULL, NULL, '2026-09-17 20:22:34', '2026-09-17 20:22:34'),
(133, 15, 'dokumen', 'STR', 'employees/documents/15/Q32As4E4yUtvWGQ1qe5K8t0F9I0qOkCgavSzR8GJ.pdf', 'STR_Syukur_2028.pdf', '242.00 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:22:34', '2026-09-17 20:22:34'),
(134, 15, 'dokumen', 'Transkrip D3', 'employees/documents/15/ZaeDmLH937ZFwKt4F1YeNIZM1DHzdeZpPwu15dMt.pdf', 'Transkrip D3_compressed.pdf', '231.48 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:22:35', '2026-09-17 20:22:35'),
(135, 15, 'dokumen', 'Transkrip Nilai Ners', 'employees/documents/15/jb7ekVNQLNrtSXo2CUfiTG68MUOhmvlp0Z6NjAPs.pdf', 'Transkrip Nilai Ners_compressed.pdf', '232.21 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:22:35', '2026-09-17 20:22:35'),
(136, 15, 'dokumen', 'Transkrip Nilai S1', 'employees/documents/15/ZPRkLzSvJaX74MnSU0m43GFyho0qPt1JYEZBZv84.pdf', 'Transkrip Nilai S1.pdf', '869.73 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:22:35', '2026-09-17 20:22:35'),
(137, 15, 'dokumen', 'Transkrip Nilai S2', 'employees/documents/15/1FDt0K0LeT0jySJ4IGBGOY7manSsn525nUo1oO8f.pdf', 'Transkrip Nilai S2_compressed.pdf', '115.40 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:22:35', '2026-09-17 20:22:35'),
(138, 11, 'dokumen', 'AA', 'employees/documents/11/kptkQSi2hzd78EicJ4hI17Zroe5CotNcxODvQ1Jm.pdf', 'AA_2023-06-01_Berliany.pdf', '590.31 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:23:25', '2026-09-17 20:23:25'),
(139, 11, 'dokumen', 'ijazah ners', 'employees/documents/11/VnXW9QOAnB146x5zv9KzSJS9w3MqbN4swUx0hvLg.pdf', 'ijazah ners_Berliany.pdf', '108.11 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:23:25', '2026-09-17 20:23:25'),
(140, 11, 'dokumen', 'Ijazah S1', 'employees/documents/11/l7SY43tz97m4FCuil54PJGWPeJnFhOigWpvGHMda.pdf', 'Ijazah S1_Berliany.pdf', '199.61 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:23:25', '2026-09-17 20:23:25'),
(141, 11, 'dokumen', 'Ijazah S2', 'employees/documents/11/RzyiMynrcAJCqhBOD7miCWokmszgGi0cZJXOCGmC.pdf', 'Ijazah S2 B. Berliany.pdf', '602.24 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:23:25', '2026-09-17 20:23:25'),
(142, 11, 'dokumen', 'KTP', 'employees/documents/11/WTfxXcAIXg5n6MIq5atoTsqPa629cDDYTptv1Vpp.pdf', 'KTP.pdf', '94.54 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:23:25', '2026-09-17 20:23:25'),
(143, 11, 'dokumen', 'Pekerti', 'employees/documents/11/aCm7c58YB50hnArP6FnDGsmk7nl9owMEaQ4nk0cO.pdf', 'Pekerti_Berliany_2022.pdf', '280.19 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:23:25', '2026-09-17 20:23:25'),
(144, 11, 'dokumen', 'Penyetaraan', 'employees/documents/11/EIul0rLBIiQMiylkVBxssmXZAvzFpDJrYHI54spU.pdf', 'Penyetaraan_Berly.pdf', '620.00 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:23:25', '2026-09-17 20:23:25'),
(145, 11, 'dokumen', 'Transkrip Ners', 'employees/documents/11/GoanevRqn5IzHRDQIdL2OUj8GVmL80gEV9htv4Qq.pdf', 'Transkrip Ners_Berliany.pdf', '234.60 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:23:25', '2026-09-17 20:23:25'),
(146, 11, 'dokumen', 'Transkrip S1', 'employees/documents/11/DA5hSNVAphfX3RFMREIzakoDkWi8QdDBUgbKS96b.pdf', 'Transkrip S1_Berliany.pdf', '367.64 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:23:25', '2026-09-17 20:23:25'),
(147, 11, 'dokumen', 'Transkrip S2', 'employees/documents/11/erER2CH1TXhH8g7r8aagc0It8l0oU4NxQdEcUMpp.pdf', 'Transkrip S2_Berliany.pdf', '443.30 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:23:25', '2026-09-17 20:23:25'),
(148, 10, 'dokumen', 'AA', 'employees/documents/10/tvKiw6A1ucr7ZyOgm0mkLBKM4GtS1Usi6tVquGBS.pdf', 'AA_Febrina.pdf', '565.71 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:35:22', '2026-09-17 20:35:22'),
(149, 10, 'dokumen', 'Ijasah Ners', 'employees/documents/10/cZAMA9B15iwRxMhCkuW3mimI45CoBnN15DJL42PD.pdf', 'Ijasah Ners.pdf', '92.52 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:35:22', '2026-09-17 20:35:22'),
(150, 10, 'dokumen', 'Ijasah S1', 'employees/documents/10/YnUkgUT0VWLznPQD3ZzZD6NbxGEASuCv3u1MxHa2.pdf', 'Ijasah S1.pdf', '90.59 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:35:22', '2026-09-17 20:35:22'),
(151, 10, 'dokumen', 'Ijasah S2', 'employees/documents/10/EK9eI2pLpn5FXCmFyK0ICXD9VOB3ev8VklXXDx2W.pdf', 'Ijasah S2.pdf', '89.97 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:35:22', '2026-09-17 20:35:22'),
(152, 10, 'dokumen', 'KTP', 'employees/documents/10/ZVAkzCFYD398jFaKdixpeF4DiqDkdmY7BN1RO8MN.jpeg', 'KTP Febrina.jpeg', '91.67 KB', 'image/jpeg', NULL, NULL, NULL, '2026-09-17 20:35:22', '2026-09-17 20:35:22'),
(153, 10, 'dokumen', 'Pekerti', 'employees/documents/10/DlNnM3Q990L1Znz00GBprLKlQhWG63SwdFatvMYc.pdf', 'Pekerti_Febrina.pdf', '629.15 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:35:22', '2026-09-17 20:35:22'),
(154, 10, 'dokumen', 'SK AA', 'employees/documents/10/OgwBueBZDKCJe0ePWs8vYxIyCv4GYFGPcMFiR7qO.pdf', 'SK AA_2023_Febrina.pdf', '302.60 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:35:22', '2026-09-17 20:35:22'),
(155, 10, 'dokumen', 'STR Seumur Hidup', 'employees/documents/10/HSyaU8eXTzaQwEXDP5QYumfx2uqj7IANzpdbcCov.pdf', 'STR Febri Seumur Hidup.pdf', '265.50 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:35:22', '2026-09-17 20:35:22'),
(156, 10, 'dokumen', 'Transkrip Ners', 'employees/documents/10/IYcnxkJcWGs2qzcIrQkJv0ZXBYcifI2jK5UBqPwZ.pdf', 'Transkrip Ners Febri.pdf', '1.09 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:35:22', '2026-09-17 20:35:22'),
(157, 10, 'dokumen', 'Transkrip S1', 'employees/documents/10/IcSjrmm88OY8SXG5jU3D64eHo1ksj8xrzSbBq0V9.pdf', 'Transkrip S1.pdf', '1.28 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:35:22', '2026-09-17 20:35:22'),
(158, 10, 'dokumen', 'Transkrip S2', 'employees/documents/10/kqUmaPSTnZH03URjcIPbZi2IAqfeOW7vGrZB1T3Z.pdf', 'Transkrip S2.pdf', '88.84 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:35:22', '2026-09-17 20:35:22'),
(159, 12, 'dokumen', 'Ijazah D3', 'employees/documents/12/vrM29uNaeiFFXAcKT8ORCbMx6oVBncTRfdAYZcqI.pdf', 'Ijazah D3_Yustina.pdf', '273.93 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:04', '2026-09-17 20:36:04'),
(160, 12, 'dokumen', 'Ijazah Ners', 'employees/documents/12/HOr8XshlDXAhGvmq2w9D5dc9IK8pfePWroQEEM8r.pdf', 'Ijazah Ners_Yustina.pdf', '4.09 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:04', '2026-09-17 20:36:04'),
(161, 12, 'dokumen', 'Ijazah SKep', 'employees/documents/12/Ld0JOc3TCFXtnGXHqgkqDJ9Szbfan3pfw1eIz2Ov.pdf', 'Ijazah SKep Yus.pdf', '335.20 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:04', '2026-09-17 20:36:04'),
(162, 12, 'dokumen', 'Ijazah Transkrip S2', 'employees/documents/12/odCS0o81PTqVtqjCIydR7j9v6rNC5Xv6QHBtRGeE.pdf', 'Ijazah_Transkrip S2_Yustina.pdf', '490.50 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:04', '2026-09-17 20:36:04'),
(163, 12, 'dokumen', 'Pekerti', 'employees/documents/12/Tlun6p2ExdYu6ybPg4flIONoXk21ah0unqfoLCIo.pdf', 'Pekerti_Yustina Emi 2016.pdf', '629.69 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:04', '2026-09-17 20:36:04'),
(164, 12, 'dokumen', 'SK Asisten Ahli', 'employees/documents/12/S66fu0BuengKgXKSa9yPKbCia4AEN297EaBgCCeE.pdf', 'SK Asisten Ahli Yustina Emi.pdf', '129.37 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:04', '2026-09-17 20:36:04'),
(165, 12, 'dokumen', 'STR Seumur Hidup', 'employees/documents/12/8jMmV3KxE2WJp7LDjVkRBsVy8Y9YtbyNuDcHtOzI.pdf', 'STR_Yustina_Seumur Hidup.pdf', '297.00 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:04', '2026-09-17 20:36:04'),
(166, 12, 'dokumen', 'Transkrip D3', 'employees/documents/12/vv86OPBSdZ3ghCic26v2vJs9n8aXpDjZsiGq7TSk.pdf', 'Transkrip D3_Yustina.pdf', '1.01 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:04', '2026-09-17 20:36:04'),
(167, 12, 'dokumen', 'Transkrip Ners', 'employees/documents/12/GtRrO51tH3DNjT52j27NgjalxWL43Uz196am64kX.pdf', 'Transkrip Ners_Yustina.pdf', '196.59 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:04', '2026-09-17 20:36:04'),
(168, 12, 'dokumen', 'Transkrip SKep', 'employees/documents/12/Tzh2XRWwE0h29F4h3TKaJb3Org3mZfSd2qekEiWD.pdf', 'Transkrip SKep_YUstina.pdf', '232.11 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:04', '2026-09-17 20:36:04'),
(169, 35, 'dokumen', 'Apoteker Ijazah Transkrip Nilai', 'employees/documents/35/mRXRqbfluH08Q96uB4mlTvqqC3GWHEPd1faYZUBB.pdf', 'Apoteker Ijazah Transkrip Nilai.pdf', '139.02 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:43', '2026-09-17 20:36:43'),
(170, 35, 'dokumen', 'Ijazah dan Transkrip Apoteker', 'employees/documents/35/10LtZbPOFaj3lU4s9uOgHbPatos47DQJ9jtzVpWe.pdf', 'Ijazah dan Transkrip Apoteker.pdf', '542.30 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:43', '2026-09-17 20:36:43'),
(171, 35, 'dokumen', 'Ijazah dan Transkrip S1', 'employees/documents/35/TTyG5S7yl1AK1VWHE9sL6Thqx4teA9AO3pwkLLbK.pdf', 'Ijazah dan Transkrip S1.pdf', '649.82 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:43', '2026-09-17 20:36:43'),
(172, 35, 'dokumen', 'Ijazah dan Transkrip S2', 'employees/documents/35/XRCLri36E1hz8M80lyJbp49e8TOq93PoGOH3Qv5S.pdf', 'Ijazah dan Transkrip S2.pdf', '675.26 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:43', '2026-09-17 20:36:43'),
(173, 35, 'dokumen', 'KTP & Suket Domisili', 'employees/documents/35/rSBbPjA3EZgJkMsBTHQYFjfJjlaid4BAo7CMn08t.pdf', 'KTP & Suket Domisili Eric.pdf', '218.69 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:43', '2026-09-17 20:36:43'),
(174, 35, 'dokumen', 'KTP', 'employees/documents/35/KqVXzkhccq5RlCxj4kHabdsDwl0jodQGzA3dTng4.pdf', 'KTP_Sirilus Deodatus Sawu.pdf', '151.13 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:43', '2026-09-17 20:36:43'),
(175, 35, 'dokumen', 'STR Seumur hidup', 'employees/documents/35/c1l1a4n7qCzOqdSCqfBeER7f34lmwGojRxshxP2h.pdf', 'STR_Erik_Seumur hidup.pdf', '247.15 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:36:43', '2026-09-17 20:36:43'),
(176, 45, 'dokumen', 'Ijazah Apoteker', 'employees/documents/45/dPxBfiUcMXDjUWtcPYKcXx00utlFFPvGbcOPSAkn.pdf', 'Ijazah Apoteker_Yulinda.pdf', '45.22 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:37:31', '2026-09-17 20:37:31'),
(177, 45, 'dokumen', 'Ijazah S1', 'employees/documents/45/7qsMvPCO7WKl6dSpkFikw1fYlqXODaU6NGG522ng.pdf', 'Ijazah S1_Yulinda.pdf', '99.79 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:37:31', '2026-09-17 20:37:31'),
(178, 45, 'dokumen', 'Ijazah S2', 'employees/documents/45/gdGO0uWVyQeDJM4WdorpV3CqMmlp3hozn2OEN3bS.pdf', 'Ijazah S2_Yulinda.pdf', '77.30 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:37:31', '2026-09-17 20:37:31'),
(179, 45, 'dokumen', 'KTP', 'employees/documents/45/IimS66S09h5XeI32jh0AxobduQGsu0SW5zhoTOVh.pdf', 'KTP_Yulinda.pdf', '89.44 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:37:31', '2026-09-17 20:37:31'),
(180, 45, 'dokumen', 'Transkrip Apoteker', 'employees/documents/45/TQ6pijcpz6AoKRfIqVx5OvZz369kVVSsr4TJDM8V.pdf', 'Transkrip Apoteker_Yulinda.pdf', '230.89 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:37:31', '2026-09-17 20:37:31'),
(181, 45, 'dokumen', 'Transkrip S1', 'employees/documents/45/1HhxJgN3dPBwsP04oVNQEXSAIhNS4bBaunRAwMzG.pdf', 'Transkrip S1_Yulinda.pdf', '244.42 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:37:31', '2026-09-17 20:37:31'),
(182, 45, 'dokumen', 'Transkrip S2', 'employees/documents/45/i6Pq7ekNxfnMf8y6BZGcNZoUWAmexZgJ0wrT3SXG.pdf', 'Transkrip S2_Yulinda.pdf', '167.90 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:37:31', '2026-09-17 20:37:31'),
(183, 19, 'dokumen', 'Ijasah dan Transkrip S1', 'employees/documents/19/EdtxhslBvqjx0QdBoNR4kLYGuVjfSESqFErQ0fi5.pdf', 'Ijasah dan Transkrip S1 Farmasi Dev.pdf', '950.71 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:39:22', '2026-09-17 20:39:22'),
(184, 19, 'dokumen', 'ijasah M.Farm', 'employees/documents/19/nJ60ASL8KTJKBg02fKlktKEPUr8e0Mu8nsU5q0HL.pdf', 'ijasah M.Farm.pdf', '244.16 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:39:22', '2026-09-17 20:39:22'),
(185, 19, 'dokumen', 'Ijazah SMF, D3, Magister manajemen', 'employees/documents/19/e9FAjEVtuVutXj3mY2XYaky9tDuXLfLgPEAeZXKi.pdf', 'Ijazah SMF, D3, Magister manajemen.pdf', '4.19 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:39:22', '2026-09-17 20:39:22'),
(186, 19, 'dokumen', 'KTP', 'employees/documents/19/vZl3cBqeqcCbbrj6VKZVv40vuXazy9fDkB82GNxK.pdf', 'KTP a.n Devanus.pdf', '239.40 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:39:22', '2026-09-17 20:39:22'),
(187, 19, 'dokumen', 'Transkrip M.Farm', 'employees/documents/19/eggsueIw3VNSo4f6W9TOZSX3E2T5ygEEgnK56WQi.pdf', 'Transkrip M.Farm.pdf', '375.90 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:39:22', '2026-09-17 20:39:22'),
(188, 44, 'dokumen', 'KTP', 'employees/documents/44/KleHfMzBhFHnHIQ9GnVjj9NbfE0G8KHttpftul9p.pdf', 'KTP_Ika Nuraini.pdf', '157.85 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:40:00', '2026-09-17 20:40:00'),
(189, 44, 'dokumen', 'Transcript S1', 'employees/documents/44/S0qYSqKOItVMLR5Pzlq1m6sEukLkwwtdhyI6q6cu.pdf', 'Transcript S1_Ika Nuraini.pdf', '243.10 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:40:00', '2026-09-17 20:40:00'),
(190, 44, 'dokumen', 'Transkrip S1', 'employees/documents/44/adSvMwEMhOtLJfYCy6l7hqCKbREVFc9p6Q0YpbvA.pdf', 'Transkrip S1_Ika Nuraini.pdf', '232.81 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:40:00', '2026-09-17 20:40:00'),
(191, 44, 'dokumen', 'Transkrip S2', 'employees/documents/44/Q5gNcTIwzoYwJlGbS93XasbhxY7UYIWUKUImG1Qn.pdf', 'Transkrip S2_Ika Nuraini.pdf', '215.53 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:40:00', '2026-09-17 20:40:00'),
(192, 44, 'dokumen', 'Ijazah S1', 'employees/documents/44/HGqeLhE8jFoQkX9ylOj9il3Vr9xVvvYjJPcLjol1.pdf', 'Ijazah S1_Ika Nuraini.pdf', '200.11 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:40:00', '2026-09-17 20:40:00'),
(193, 44, 'dokumen', 'Ijazah S2', 'employees/documents/44/cmWCSThuntX0ZMLPNOxsxxdH2QgMYPEWb5RPStYv.pdf', 'Ijazah S2_Ika Nuraini.pdf', '171.85 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:40:00', '2026-09-17 20:40:00'),
(194, 107, 'dokumen', 'KTP', 'employees/documents/107/O1GJl9tvibNRKOC78EephsBObpy1X9g3SyOOSdpn.pdf', 'KTP Luluk.pdf', '141.10 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:41:14', '2026-09-17 20:41:14'),
(195, 107, 'dokumen', 'Serdos', 'employees/documents/107/w16ur9br5UFEQaRHezaSJGVYcd3irYqEKRbxjNsC.pdf', 'Serdos_0729107703_Luluk Anisyah.pdf', '1.13 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:41:14', '2026-09-17 20:41:14'),
(196, 107, 'dokumen', 'Transkip S1', 'employees/documents/107/DV7C9MIKbOLptf0FUtQHC0C79FPhbIpe9GHoXtv1.pdf', 'Transkip S1_Luluk Anisyah.pdf', '2.92 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:41:14', '2026-09-17 20:41:14'),
(197, 107, 'dokumen', 'Transkrip Apoteker', 'employees/documents/107/WuhjgTote9HVcLSzj5b3QYwLZuFw24qBUiA1cJmQ.pdf', 'Transkrip Apoteker Luluk.pdf', '441.17 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:41:14', '2026-09-17 20:41:14'),
(198, 107, 'dokumen', 'Transkrip S2', 'employees/documents/107/pFq5NEdzxtMhoBfoZCifNgJ3fJoUfS1hQIuX5QmL.pdf', 'Transkrip S2_Luluk Anisyah.pdf', '719.47 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:41:14', '2026-09-17 20:41:14'),
(199, 107, 'dokumen', 'Asisten Ahli', 'employees/documents/107/KpaFb4sjeNI7SjB1iElF9z9sNErIm96bL3tJ9AYj.pdf', 'Asisten Ahli.pdf', '507.30 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:41:14', '2026-09-17 20:41:14'),
(200, 107, 'dokumen', 'Ijasah Apoteker', 'employees/documents/107/JShSB4GubqhSm3AQhzmciRG1lOScZVEGrdwmx4hZ.pdf', 'Ijasah Apoteker Luluk.pdf', '457.21 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:41:14', '2026-09-17 20:41:14'),
(201, 107, 'dokumen', 'Ijasah S2', 'employees/documents/107/AKb8fmPumDt3nWdeuzVOZiORtfIPHDL3QU7DIzae.pdf', 'Ijasah S2_Luluk Anisyah.pdf', '210.42 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:41:14', '2026-09-17 20:41:14'),
(202, 107, 'dokumen', 'Ijazah S1', 'employees/documents/107/OhHY2a0syQ95dJEwW4pBXfLJDmdxZ7hE92DZFZ6a.pdf', 'Ijazah S1_luluk.pdf', '449.08 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:41:14', '2026-09-17 20:41:14'),
(203, 106, 'dokumen', 'Transkrip Apoteker', 'employees/documents/106/HFhxrDQUxo6tXOSzDpfMiZ38UbPBhP84qIUtfbx0.pdf', 'Transkrip Apoteker Sugiyanto.pdf', '291.21 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:42:32', '2026-09-17 20:42:32'),
(204, 106, 'dokumen', 'Transkrip S1', 'employees/documents/106/odb3bKh0xbxy1jOcv2D2oNr1OnaN4LQNKVaCCCNV.pdf', 'Transkrip S1_Sugiyanto.pdf', '258.20 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:42:32', '2026-09-17 20:42:32'),
(205, 106, 'dokumen', 'Transkrip S2', 'employees/documents/106/J0LQ8NFa1PboAE7UPEGiHYe8crzl9fevLjOnwjxG.pdf', 'Transkrip S2_Sugiyanto.pdf', '718.12 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:42:32', '2026-09-17 20:42:32'),
(206, 106, 'dokumen', 'Asisten Ahli', 'employees/documents/106/iXq1Y1N6AOOR7WPqi0up0bMJ3HkHCbMlxzVjrobZ.pdf', 'Asisten Ahli_Sugiyanto.pdf', '508.08 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:42:32', '2026-09-17 20:42:32'),
(207, 106, 'dokumen', 'Ijasah Apoteker', 'employees/documents/106/9QImE24GRAqkFDgc9l3NUUVe0ELKxBVt5TTE6MdA.pdf', 'Ijasah Apoteker Sugiyanto.pdf', '522.23 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:42:32', '2026-09-17 20:42:32'),
(208, 106, 'dokumen', 'Ijasah S1', 'employees/documents/106/OdHvlQxzgb4yg9q7mS1HQI60YZu95cVkfrDnn5p2.pdf', 'Ijasah S1 sugiyanto.pdf', '12.79 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:42:32', '2026-09-17 20:42:32'),
(209, 106, 'dokumen', 'Ijazah S2', 'employees/documents/106/uK2BcFFGhhtE9xlLopHrau13DmQNOPjD9vqGNttL.pdf', 'Ijazah S2 Sugiyanto.pdf', '735.01 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:42:32', '2026-09-17 20:42:32'),
(210, 106, 'dokumen', 'KTP', 'employees/documents/106/Ub5kdyyJNxBAXCjg2n7yt8OGOk9KI64XT7kyKszY.pdf', 'KTP Sugiyanto.pdf', '142.25 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:42:32', '2026-09-17 20:42:32'),
(211, 106, 'dokumen', 'Pekerti', 'employees/documents/106/vnPmZqqQH4Tfdg9HdOEgXhg2XLblNerMoILanE7b.pdf', 'Pekerti Sugiyanto.pdf', '688.12 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:42:32', '2026-09-17 20:42:32'),
(212, 106, 'dokumen', 'Serdos', 'employees/documents/106/oOzXrklCHBBdHrqqr8EOZtyg43n7h8nMlLn5sCDh.pdf', 'Serdos_Sugiyanto.pdf', '1.13 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:42:32', '2026-09-17 20:42:32'),
(213, 106, 'dokumen', 'STRA', 'employees/documents/106/sHzfYtGiYwT4fm2zEbUFJ60fBYzIYi9Coumxt1qv.pdf', 'STRA_2016-2021.pdf', '534.19 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:42:32', '2026-09-17 20:42:32'),
(214, 32, 'dokumen', 'Ijazah dan transkrip S1, S2, Serdik', 'employees/documents/32/VjXUtmT750SgXXPteWo3etV13uTWQUNFOaOB1HBk.pdf', 'Ijazah dan transkrip S1, S2, Serdik.pdf', '1.03 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:18', '2026-09-17 20:43:18'),
(215, 32, 'dokumen', 'KTP', 'employees/documents/32/aW3fTiWstrkwAlzWitn3drHozHsc6fGelH6rljOK.pdf', 'KTP.pdf', '167.72 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:18', '2026-09-17 20:43:18'),
(216, 32, 'dokumen', 'Asisten Ahli', 'employees/documents/32/sgrARXcF5MJdQGIsasVHxKBrxlL9zRVhlLIQrDiV.pdf', 'Asisten Ahli_Venny Kurnia W..pdf', '141.72 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:18', '2026-09-17 20:43:18'),
(217, 1, 'dokumen', 'Pekerti Wibowo 2011', 'employees/documents/1/yLqZC06P1cYowguwsuATwCadkoFW6939G8WaXeT7.pdf', 'Pekerti_Wibowo 2011.pdf', '1.38 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50'),
(218, 1, 'dokumen', 'Serdos wibowo 2017', 'employees/documents/1/vfVBmvSH8GVFeOa3HvOKb36hwC8WcrN7COXsRXTf.pdf', 'Serdos_wibowo 2017.pdf', '1.45 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50'),
(219, 1, 'dokumen', 'STR 2020 2025 WIBOWO', 'employees/documents/1/tYPnyWHBXqb8x43O3xXXwbWMFRgKaThtDaE9bX8L.pdf', 'STR_2020-2025-WIBOWO.pdf', '815.09 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50'),
(220, 1, 'dokumen', 'Transkrip Ners Wib', 'employees/documents/1/IwWFowNlcTe7sfqkcfJXu4t8yUMXg3GK2atgXgh6.pdf', 'Transkrip Ners-Wib.pdf', '132.74 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50'),
(221, 1, 'dokumen', 'Transkrip S2 Wib', 'employees/documents/1/yqTY3trlJ9STeKCsekQb4uu19pgofchXkS4aMGhl.pdf', 'Transkrip S2-Wib.pdf', '96.27 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50'),
(222, 1, 'dokumen', 'Transkrip Wibowo', 'employees/documents/1/TOQlgBukxkdon6uTUaNu7swBuAsC1ydmllF8tqUw.pdf', 'Transkrip Wibowo.pdf', '132.74 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50'),
(223, 1, 'dokumen', 'AA Wibowo 2015 Combine', 'employees/documents/1/3C1Qe7qcaoliwBbfBfVcDJuaAtofUq9z36XOqZTA.pdf', 'AA_Wibowo 2015_Combine.pdf', '1.75 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50'),
(224, 1, 'dokumen', 'Asisten Ahli Wibowo', 'employees/documents/1/156OhP8B4iB9xhFqT1kKnhU8NKCoCVPSifK8eYlV.pdf', 'Asisten Ahli_Wibowo.pdf', '247.48 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50'),
(225, 1, 'dokumen', 'Ijazah Ners Wib', 'employees/documents/1/GIHrRJvWRnplV67wmboayMR1CEtIqWFlna7ElT1W.pdf', 'Ijazah Ners-Wib.pdf', '83.17 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50'),
(226, 1, 'dokumen', 'Ijazah S1 Wib', 'employees/documents/1/N5plit2NoCDaRDTA4eUXkYLRkxsz6EZe2lgSTea7.pdf', 'Ijazah S1-Wib.pdf', '108.71 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50'),
(227, 1, 'dokumen', 'Ijazah S2 Wib', 'employees/documents/1/gUIPlzbBRLjXKQsARqmVJjgAFV1aujTMCHaTOQOU.pdf', 'Ijazah S2-Wib.pdf', '112.09 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50');
INSERT INTO `employee_documents` (`id`, `employee_id`, `type`, `name`, `file_path`, `file_name`, `file_size`, `file_type`, `issued_date`, `expiry_date`, `notes`, `created_at`, `updated_at`) VALUES
(228, 1, 'dokumen', 'Lektor Wibowo', 'employees/documents/1/vv6mxtjop5V7DPhPyF91jKLRhwBkxUIZJqBWBSpg.pdf', 'Lektor Wibowo.pdf', '290.99 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:43:50', '2026-09-17 20:43:50'),
(229, 13, 'dokumen', 'Ijazah S1,Ners', 'employees/documents/13/GSFMY9Bt5KDY7Q9hVyYkqhMYX8wFLrNmBIC4mKGa.pdf', 'Ijazah S1,Ners_ Prieska.pdf', '1.55 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:44:48', '2026-09-17 20:44:48'),
(230, 13, 'dokumen', 'Ijazah S2', 'employees/documents/13/dQBSUfLktIO6bFJO8Tkr6ft44f1mxgKGumjuFsHQ.pdf', 'Ijazah S2 Prieska.pdf', '213.66 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:44:48', '2026-09-17 20:44:48'),
(231, 13, 'dokumen', 'KTP', 'employees/documents/13/l0gSoBbeQi4kyCGWWB70pgaa8JIO0DV03IQemA65.jpg', 'KTP Prieska.jpg', '80.78 KB', 'image/jpeg', NULL, NULL, NULL, '2026-09-17 20:44:48', '2026-09-17 20:44:48'),
(232, 13, 'dokumen', 'STR Maria Prieska Seumur Hidup', 'employees/documents/13/9E7AFLfqBeoCD9hPWO6DKHXnPvqWUi0HWo6iwJZm.pdf', 'STR_Maria Prieska_Seumur Hidup.pdf', '297.02 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:44:48', '2026-09-17 20:44:48'),
(233, 13, 'dokumen', 'Transkip S1,Ners', 'employees/documents/13/nHgQMiSQspUXMQEJXlIo5bLGiRvu0jCdXUBKZxrE.pdf', 'Transkip S1,Ners_Prieska.pdf', '2.27 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:44:48', '2026-09-17 20:44:48'),
(234, 13, 'dokumen', 'Transkrip S2', 'employees/documents/13/eoQ2LJmKazIw1jwv6KQ1IE4jWa6Xt2AuXpoWw3lK.pdf', 'Transkrip S2 Prieska.pdf', '338.28 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:44:48', '2026-09-17 20:44:48'),
(235, 13, 'dokumen', 'Asisten Ahli', 'employees/documents/13/2Ss36sK0AuHsGnUCMziFyMoA2N0JYjIkiR1DmCuk.pdf', 'Asisten Ahli Maria Prieska.pdf', '129.37 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:44:48', '2026-09-17 20:44:48'),
(236, 4, 'dokumen', 'STR Nanik 2020', 'employees/documents/4/4B8dHGF1opQXqkTE9AKlxraMS8ZziA5fVYXC43r8.pdf', 'STR_Nanik 2020.pdf', '97.03 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(237, 4, 'dokumen', 'Trankrip D3 blkng', 'employees/documents/4/tmVrwQOXbSGGVfDPsB61eZ8DHvyujczEWuOSnthJ.pdf', 'Trankrip D3 blkng.pdf', '858.51 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(238, 4, 'dokumen', 'Transkrip D3 dpn', 'employees/documents/4/bn6UfUYbQVT4fAZZ1WWgBMdVJznJ8n92oXmHUHcl.pdf', 'Transkrip D3 dpn.pdf', '865.00 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(239, 4, 'dokumen', 'Transkrip Ners Nanik', 'employees/documents/4/Ck80pC8aLEVe6IRQuCWq4Tv7442AVT8QaWj5zC9y.pdf', 'Transkrip Ners-Nanik.pdf', '86.85 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(240, 4, 'dokumen', 'Transkrip S1 Nanik', 'employees/documents/4/mb55w21Q2PYTYjuPqpURP8yqiFNO0trP6AFbAHEK.pdf', 'Transkrip S1-Nanik.pdf', '339.73 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(241, 4, 'dokumen', 'Transkrip S2 Nanik', 'employees/documents/4/Vp03rqycWdH19uakNevDZV2gSIlknpBSoIoWcwZg.pdf', 'Transkrip S2-Nanik.pdf', '282.36 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(242, 4, 'dokumen', 'Transkrp S3 (Nanik Dwi Astutik)', 'employees/documents/4/DxWqQJOoBzCbxr7ycvOAmz9vIbnwA45nzO9hNCls.pdf', 'Transkrp S3 (Nanik Dwi Astutik).pdf', '3.15 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(243, 4, 'dokumen', 'AA Nanik 2011', 'employees/documents/4/RZQnf9ftdT0c6xkQVKSmuMM00kZnkBlJl1zZ5z6B.pdf', 'AA_Nanik 2011.pdf', '301.39 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(244, 4, 'dokumen', 'Asisten Ahli nanik', 'employees/documents/4/9BB0GYozJ9e5kJn2m3DR269IMzpLfRZCRRkm6wCt.pdf', 'Asisten Ahli_nanik.pdf', '671.98 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(245, 4, 'dokumen', 'Ijazah D3 Nanik1', 'employees/documents/4/onJbdWwvfWWKKIRlxEVzuiU4je2ysGfjIogM6JpS.pdf', 'Ijazah D3_Nanik1.pdf', '1.12 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(246, 4, 'dokumen', 'Ijazah Ners Nanik', 'employees/documents/4/Z1n0EFVDNvbBJTTlSgaq3hwA4z5dEbtx9DWgZDqV.pdf', 'Ijazah Ners-Nanik.pdf', '93.45 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(247, 4, 'dokumen', 'Ijazah S1 Nanik', 'employees/documents/4/j2qZxCbFmi9GU3mMAjdrQTa2sRtzxFtZsFXiRg7K.pdf', 'Ijazah S1-Nanik.pdf', '84.07 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(248, 4, 'dokumen', 'Ijazah S2 Nanik', 'employees/documents/4/lNgRdv7TMJcd4aOgOlm6IZQqLrzNj9lgY5eKyJZQ.pdf', 'Ijazah S2-Nanik.pdf', '258.07 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(249, 4, 'dokumen', 'Ijazah S3 Nanik', 'employees/documents/4/vQSmPzewhKFz81KXzDeQ8qsxCZgd9CJo6wA9zznh.pdf', 'Ijazah S3_Nanik.pdf', '785.70 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(250, 4, 'dokumen', 'Inpasing Nanik Dwi A', 'employees/documents/4/ntnQdUno3Sz3NpnMPoAX0qnlttif7PFu04tg2ZuY.pdf', 'Inpasing_Nanik Dwi A.pdf', '218.25 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(251, 4, 'dokumen', 'KTP Nanik', 'employees/documents/4/Cfd6C7k11CzVWv87gbisYpJ5HDK1CYKvWi3PURlR.jpeg', 'KTP_Nanik.jpeg', '92.06 KB', 'image/jpeg', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(252, 4, 'dokumen', 'Pekerti Nanik 2010', 'employees/documents/4/p1NlCYGvAV9IuqhXiY3kxOG1Wl5hRiWLBdovU7Qr.pdf', 'Pekerti_Nanik 2010.pdf', '162.74 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:47', '2026-09-17 20:45:47'),
(253, 4, 'dokumen', 'Serdos 0729127903 nanik dwi', 'employees/documents/4/TEqClxfoBwoQGRICJ05gqJQCbyzv7vwndPlAaXUZ.pdf', 'Serdos_0729127903_nanik dwi.pdf', '1.18 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:45:48', '2026-09-17 20:45:48'),
(254, 17, 'dokumen', 'Pekerti Liza', 'employees/documents/17/HqcT2OCes8JtnPqtWBh9mwcIm31E8mIqkIcY8Waz.pdf', 'Pekerti_Liza.pdf', '1.09 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:22', '2026-09-17 20:46:22'),
(255, 17, 'dokumen', 'Serdos Elizabeth Yun Yun', 'employees/documents/17/udNtMsHCf71Af16gvTSBIxALRRdXbC3ghGPyurgc.pdf', 'Serdos_Elizabeth Yun-Yun.pdf', '1.11 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:22', '2026-09-17 20:46:22'),
(256, 17, 'dokumen', 'Transkrip Ners Elizabeth', 'employees/documents/17/W5U5b6ykFdhGFuBPtCPbQDEnruAGO8cS2MURMrUm.pdf', 'Transkrip Ners_Elizabeth.pdf', '167.01 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:22', '2026-09-17 20:46:22'),
(257, 17, 'dokumen', 'Transkrip S1 Elizabeth', 'employees/documents/17/3WDdu8ND0wEBhzId2DSckgUNSS6msqXKNv0UhTHP.pdf', 'Transkrip S1_Elizabeth.pdf', '264.49 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:22', '2026-09-17 20:46:22'),
(258, 17, 'dokumen', 'Transkrip S2  Elizabeth', 'employees/documents/17/EMybyDEeAG3T0ZKQCbsc8iagYQuguT3lbDQj3kG1.pdf', 'Transkrip S2 _Elizabeth.pdf', '400.22 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:22', '2026-09-17 20:46:22'),
(259, 17, 'dokumen', 'AA liza 2019', 'employees/documents/17/wEvvvrB29Fe1mq0dlvYSAHFrhYAjTGsKvSalO25Z.pdf', 'AA liza 2019.pdf', '1.66 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:22', '2026-09-17 20:46:22'),
(260, 17, 'dokumen', 'Asisten Ahli', 'employees/documents/17/z1x70vWCz9px63lAgVUSTCIqVrb9DpBDammpEooN.pdf', 'Asisten Ahli.pdf', '481.46 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:22', '2026-09-17 20:46:22'),
(261, 17, 'dokumen', 'Ijazah Ners Elizabeth Yun', 'employees/documents/17/nksuPYt8ApK1vzwGuZPFGdh8c85ehaSU7I8MnAqy.pdf', 'Ijazah Ners_Elizabeth Yun.pdf', '235.21 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:22', '2026-09-17 20:46:22'),
(262, 17, 'dokumen', 'Ijazah S.Kep & Ners compressed', 'employees/documents/17/NmUNFz7Kd5gvTQMVtAXMtOudm22vhu1SdvErYSTG.pdf', 'Ijazah S.Kep & Ners_compressed.pdf', '949.11 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:22', '2026-09-17 20:46:22'),
(263, 17, 'dokumen', 'Ijazah S2 Elizabeth Yun', 'employees/documents/17/V0xyGIlV6at0Lvu6D78Fac6zIttnlcL16yTVCJGk.pdf', 'Ijazah S2_Elizabeth Yun.pdf', '322.21 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:22', '2026-09-17 20:46:22'),
(264, 17, 'dokumen', 'KTP Liza', 'employees/documents/17/XhOzxwHVNs2brzjZnsDnqgCuu4Q6V32yr88C4TK5.pdf', 'KTP Liza.pdf', '195.84 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:22', '2026-09-17 20:46:22'),
(265, 7, 'dokumen', 'STR Oda Seumur Hidup', 'employees/documents/7/2FNaWPLrZ7vsjjpNKaejDBQcGFqftmN0osbGQrKb.pdf', 'STR Oda_Seumur Hidup.pdf', '292.57 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:45', '2026-09-17 20:46:45'),
(266, 7, 'dokumen', 'Transkrip Ners Rora', 'employees/documents/7/10pREJxXwdfiXpBmU6AsOUghCLZtYOO2w6K0iHvF.pdf', 'Transkrip Ners_Rora.pdf', '360.82 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:45', '2026-09-17 20:46:45'),
(267, 7, 'dokumen', 'Transkrip S1 Bu Oda', 'employees/documents/7/3foWFLrcoivBchZuue7C1lLkL927OForCf7zLZ9Q.pdf', 'Transkrip S1 Bu Oda.pdf', '300.72 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:45', '2026-09-17 20:46:45'),
(268, 7, 'dokumen', 'Transkrip S2 Oda', 'employees/documents/7/VxuUBITHubTyguKyvzWDYmUpBmry1KkbaO6K05gh.pdf', 'Transkrip S2_Oda.pdf', '78.58 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:45', '2026-09-17 20:46:45'),
(269, 7, 'dokumen', 'AA Oda', 'employees/documents/7/ppfKP0eUT19dxJxv4cVVqRDNnC4RL9QVHKttt6XB.pdf', 'AA_Oda.pdf', '486.27 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:45', '2026-09-17 20:46:45'),
(270, 7, 'dokumen', 'Ijazah Ners Rora', 'employees/documents/7/V9dq3mvexSbMCeGYuj6bYOTSuqzqKtuhEY6dGfNF.jfif', 'Ijazah Ners Rora.jfif', '249.70 KB', 'image/jpeg', NULL, NULL, NULL, '2026-09-17 20:46:45', '2026-09-17 20:46:45'),
(271, 7, 'dokumen', 'Ijazah S.Ke Rora', 'employees/documents/7/i20aLbw4RBy1K5uIa3tQ3rhHrldo2IYDYbqRtLGY.jfif', 'Ijazah S.Ke Rora.jfif', '268.27 KB', 'image/jpeg', NULL, NULL, NULL, '2026-09-17 20:46:45', '2026-09-17 20:46:45'),
(272, 7, 'dokumen', 'Ijazah S2 Oda D', 'employees/documents/7/sxuZbdibTxqIjp0PjJ1ZwcVMt8YMA59gHfsQDnH7.pdf', 'Ijazah S2_Oda D.pdf', '1.15 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:45', '2026-09-17 20:46:45'),
(273, 7, 'dokumen', 'KTP Rora', 'employees/documents/7/GmWXEn5NmtKtvRqN2DcPYEZDEUenzwDi8ncoIW0h.jpeg', 'KTP Rora.jpeg', '125.10 KB', 'image/jpeg', NULL, NULL, NULL, '2026-09-17 20:46:46', '2026-09-17 20:46:46'),
(274, 7, 'dokumen', 'Lektor Rora', 'employees/documents/7/gt5jpFlzvqNZN2PHaLL16oZTe1TMGDBtuF6Rav4d.pdf', 'Lektor_Rora.Pdf', '88.40 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:46', '2026-09-17 20:46:46'),
(275, 7, 'dokumen', 'Serdos 0729048501 oda debora', 'employees/documents/7/kkm6Ouwa1dL0QYjdTS0PEYcFz9Fo9Q3JILLbVX3S.pdf', 'Serdos_0729048501_oda debora.pdf', '1.17 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:46:46', '2026-09-17 20:46:46'),
(276, 16, 'dokumen', 'Ijazah S2 Yafet dikompresi', 'employees/documents/16/oK6oCDOpyu6tDYYk6VHcmSHTOoolGiT5eKoMfvWE.pdf', 'Ijazah S2 Yafet-dikompresi.pdf', '394.09 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(277, 16, 'dokumen', 'PEKERTI', 'employees/documents/16/ZRqeFo8rN5iOCAAJd7DKDnoqFYEbjZK2vcoqikew.pdf', 'PEKERTI.pdf', '455.56 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(278, 16, 'dokumen', 'Transkrip D3 Pak Yafet', 'employees/documents/16/kWppCoKF7wHtnQiNL5fpzMhaGLKNmOyXOBQux05I.pdf', 'Transkrip D3 Pak Yafet.pdf', '321.75 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(279, 16, 'dokumen', 'Transkrip Ners dikompresi', 'employees/documents/16/ASWam1G19Pm6vvn6Nj5PzJVn9UnoZAO11znWTtsU.pdf', 'Transkrip Ners-dikompresi.pdf', '368.88 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(280, 16, 'dokumen', 'Transkrip S1 Yafet dikompresi', 'employees/documents/16/1pTGbB2tIjfVs8EXln6s5Se3ReY8lkvaGHrOQhKw.pdf', 'Transkrip S1 Yafet-dikompresi.pdf', '473.40 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(281, 16, 'dokumen', 'Transkrip S2 Yafet dikompresi', 'employees/documents/16/83dT5GHjZYEIsqSZpAemzT2dGNjfSYc9cKQIYkVc.pdf', 'Transkrip S2 Yafet-dikompresi.pdf', '426.18 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(282, 16, 'dokumen', 'verifikasi ijazah S2 yafet', 'employees/documents/16/kcoskZE15KZ6w20VZ4QgqhDLkQMDhk82lpfSHKUR.pdf', 'verifikasi ijazah S2 yafet.pdf', '123.28 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(283, 16, 'dokumen', 'Appalid Approach', 'employees/documents/16/KHPV59kZJswDATcaskpzQ3Wet4Cu1ZUi3ACMJFic.pdf', 'Appalid Approach.pdf', '985.92 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(284, 16, 'dokumen', 'Asisten Ahli', 'employees/documents/16/qMvNQeFgmcK0Sx8iUHNoy7YjNMLrpxyeXrEpapL3.pdf', 'Asisten Ahli.pdf', '315.26 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(285, 16, 'dokumen', 'Ijazah DIII Yafet dikompresi', 'employees/documents/16/nG479RD68cF8QYdmjUQfILaouwlaDdjnBxmB47nK.pdf', 'Ijazah DIII Yafet-dikompresi.pdf', '246.06 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(286, 16, 'dokumen', 'Ijazah Ners Yafet min', 'employees/documents/16/93FuDSuzcx2qL45ReusLb1Gl7jDmCnBrdBKIRxMF.pdf', 'Ijazah Ners Yafet-min.pdf', '286.54 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(287, 16, 'dokumen', 'Ijazah S1 Yafet min', 'employees/documents/16/UYWxV3Ls1dgTwOW1oGtPUYOx8PYjviVsPlrqXFkK.pdf', 'Ijazah S1 Yafet-min.pdf', '319.44 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:47:28', '2026-09-17 20:47:28'),
(288, 27, 'dokumen', 'Ijasah+Transk', 'employees/documents/27/lawLkToOqUHGZxWpMTnr2qu37WXrPzibbO7mLdzv.pdf', '1. M. Novitasari Dwi S., Amd Ijasah+Transk.pdf', '203.16 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:48:10', '2026-09-17 20:48:10'),
(289, 25, 'dokumen', 'Ijazah & Transkrip', 'employees/documents/25/qjNWgjXeZhSLzbOloYCav6xKEEQL2BdKXzQuF1hh.pdf', '2. Wienda Setyowati,SE.pdf', '1.04 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:48:59', '2026-09-17 20:48:59'),
(290, 37, 'dokumen', 'Ijazah & Transkrip', 'employees/documents/37/dMr3VNWNTKmrIwdluxDPtrfzBL2WnrJ4ZF3htJrk.pdf', '3. Atanasius Omega D..pdf', '160.15 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:49:30', '2026-09-17 20:49:30'),
(291, 51, 'dokumen', 'Ijazah+Transkrip DIV+KTP', 'employees/documents/51/7tRHULKOIJHa8ArpbZQatcZC4YggjurVcZ6vgLpN.pdf', '4. Vania Livia_Ijazah+Transkrip DIV+KTP.pdf', '331.59 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:49:59', '2026-09-17 20:49:59'),
(292, 52, 'dokumen', 'Ijazah & Transkrip', 'employees/documents/52/uq9fWmS5RHdPD9zGYttARSgrXAgafFEUeh07i2kj.pdf', '5. Bernadette Adriana Farelita.pdf', '1.01 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:50:36', '2026-09-17 20:50:36'),
(293, 26, 'dokumen', 'Ijazah SMA', 'employees/documents/26/oD0umPSEEeuGOXtdd4t2VPfucrli8UNRVaDD0Hv8.pdf', '6. Rini Susanti.pdf', '4.50 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:51:18', '2026-09-17 20:51:18'),
(294, 54, 'dokumen', 'Yohanes Yudha   KTP', 'employees/documents/54/EgRh217Ef9pVSoeoXuaSqYYDGUT6qqqBL5BjVPUa.pdf', 'Yohanes Yudha - KTP.pdf', '488.88 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:51:43', '2026-09-17 20:51:43'),
(295, 54, 'dokumen', 'Yohanes Yudha   Transkrip Nilai', 'employees/documents/54/oNzvGRuKxEeSesisv8ShQQmuHGRPFg5cjb1GrWzX.pdf', 'Yohanes Yudha - Transkrip Nilai.pdf', '779.44 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:51:43', '2026-09-17 20:51:43'),
(296, 54, 'dokumen', 'Yohanes Yudha   Ijazah', 'employees/documents/54/QnbdQ8rqPNVbS6k4sqybvoiVQfOIW1cFZJyN5mvH.pdf', 'Yohanes Yudha - Ijazah.pdf', '591.87 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:51:43', '2026-09-17 20:51:43'),
(297, 36, 'dokumen', 'Yonathan Tobias Buttok Transkrip,Ijazah', 'employees/documents/36/gXTptoTjBFLpGqMD3RYpmpZ9SYEERrRSmVGlrRgm.pdf', 'Yonathan Tobias Buttok_Transkrip,Ijazah.pdf', '2.22 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:52:00', '2026-09-17 20:52:00'),
(298, 28, 'dokumen', 'STR Raswati seumur hidup', 'employees/documents/28/76NnoffiYPraOGhUIWwtVUSSjDryPqQ1sEGVGwqc.pdf', 'STR_Raswati_seumur hidup.pdf', '293.80 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:52:19', '2026-09-17 20:52:19'),
(299, 28, 'dokumen', 'Ijazah+Transk Raswati P', 'employees/documents/28/A8nwTC6U6PaRDzxLDasQNsg44kmNSG8RlpaKVU4w.pdf', 'Ijazah+Transk_Raswati P.pdf', '738.01 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:52:19', '2026-09-17 20:52:19'),
(300, 18, 'dokumen', 'STR Dhea seumur hidup', 'employees/documents/18/0QGFSOJeORjkQQ2KX028fDcDktHg07vmjyJSx96J.pdf', 'STR Dhea_seumur hidup.pdf', '294.72 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:52:45', '2026-09-17 20:52:45'),
(301, 18, 'dokumen', 'Ijazah+Transk Dea', 'employees/documents/18/dNVkGAY8wx3xfJc5LJwYiAlVJB5lf1xsk3YrYxnr.pdf', 'Ijazah+Transk_Dea.pdf', '3.37 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:52:45', '2026-09-17 20:52:45'),
(302, 47, 'dokumen', 'Franscisca Elsia Transkrip S1 Farmasi', 'employees/documents/47/0deuIj2ZenFFBue0D2IqgQF6TMnb6jYiMuqjhUdX.pdf', 'Franscisca Elsia_Transkrip S1 Farmasi.pdf', '768.34 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:53:01', '2026-09-17 20:53:01'),
(303, 47, 'dokumen', 'Francisca Elsia Ijazah S1 Farmasi', 'employees/documents/47/qWS0iQMiYtNUJqg8ZEOVOtjBn2Dh6Cy42Z6SWGxm.pdf', 'Francisca Elsia_Ijazah S1 Farmasi.pdf', '338.19 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:53:01', '2026-09-17 20:53:01'),
(304, 39, 'dokumen', 'Nancy Transkrip S1 Farmasi', 'employees/documents/39/AHYhJPDt3LofCmkqnYskZ7EZVA0u1ga1eRhbgCtx.pdf', 'Nancy_Transkrip S1 Farmasi.pdf', '475.32 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:53:26', '2026-09-17 20:53:26'),
(305, 39, 'dokumen', 'Nancy Ijazah S1 Farmasi', 'employees/documents/39/Fw6eZbOCJg8kPyxnupeux0fBuHhiBOJbdwimEXZa.pdf', 'Nancy_Ijazah S1 Farmasi.pdf', '202.43 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:53:26', '2026-09-17 20:53:26'),
(306, 48, 'dokumen', 'Yolanda Transkrip S1 Farmasi', 'employees/documents/48/LGEZnuTHAdc4Dy6l1Aq36PnaEnrz8W2K4eDvxqib.pdf', 'Yolanda_Transkrip S1 Farmasi.pdf', '771.28 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:53:42', '2026-09-17 20:53:42'),
(307, 48, 'dokumen', 'Yolanda Ijazah S1 Farmasi', 'employees/documents/48/UedHRDSwtfb51VtmwcTw1C9Bl85EbKx42h9U99NU.pdf', 'Yolanda_Ijazah S1 Farmasi.pdf', '647.35 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:53:42', '2026-09-17 20:53:42'),
(308, 38, 'dokumen', 'Sertifikat Kompetensi  Elsa', 'employees/documents/38/E3UKQAotrEsRySDaI2H2f7CwHtYm4WRMqXhHkNIr.pdf', 'Sertifikat Kompetensi- Elsa.pdf', '747.98 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:00', '2026-09-17 20:54:00'),
(309, 38, 'dokumen', 'Elsa Ijazah.', 'employees/documents/38/IMLr8lro5h1G6tPSmnxCpa9bvcvlPsKJgRZrTzbT.pdf', 'Elsa_Ijazah..pdf', '197.41 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:00', '2026-09-17 20:54:00'),
(310, 38, 'dokumen', 'Elsa KTP', 'employees/documents/38/J6jWKn1N3pAWs1sAcrcHkbOTUiwUKSEwFcIcLKSQ.pdf', 'Elsa_KTP.pdf', '390.59 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:00', '2026-09-17 20:54:00'),
(311, 38, 'dokumen', 'Elsa Transkrip.', 'employees/documents/38/AHiDyzGUhWu5MYIVbJIQwXst4snBxJdOu4BmvVSZ.pdf', 'Elsa_Transkrip..pdf', '472.40 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:00', '2026-09-17 20:54:00'),
(312, 8, 'dokumen', 'Ijazah DIV Eli Lea', 'employees/documents/8/rRWPF5flAvqiRUAuOOjwUp8VRDLSxJCJ7gsLbZUq.pdf', 'Ijazah DIV_Eli Lea.pdf', '1,003.92 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:26', '2026-09-17 20:54:26'),
(313, 8, 'dokumen', 'Pekerti Eli Lea 2009', 'employees/documents/8/X3MWmLIdXsrvfTeqpCX2BiuFJwuARGFssyYKDQFP.pdf', 'Pekerti_Eli Lea 2009.pdf', '1.61 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:26', '2026-09-17 20:54:26'),
(314, 8, 'dokumen', 'STR LEA 2025 SEUMUR HIDUP', 'employees/documents/8/vNfIp1KzrDNftV4DgfIn6HBhKJxoHITbmeQT2LiL.pdf', 'STR LEA 2025 SEUMUR HIDUP.pdf', '275.15 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:26', '2026-09-17 20:54:26'),
(315, 8, 'dokumen', 'Transkrip D3 Bu Lea', 'employees/documents/8/mVkYt7KqxUTWloXU4uE8jYeQxmJZ11QkqF2Lv0cp.pdf', 'Transkrip D3_Bu Lea.pdf', '1.15 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:26', '2026-09-17 20:54:26'),
(316, 8, 'dokumen', 'Transkrip DIV Bu Lea', 'employees/documents/8/6q0FWeN08Phi9a0y9bba0I7PIGqWDLjAFQonbh7T.pdf', 'Transkrip DIV_Bu Lea.pdf', '2.26 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:26', '2026-09-17 20:54:26'),
(317, 8, 'dokumen', 'AA  Eli Lea Widhia P 2015', 'employees/documents/8/WyKTsPId4GYJSxLe8oi8M75wUQnGWy1CXb71Bj6b.pdf', 'AA_ Eli Lea Widhia P 2015.pdf', '1.82 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:26', '2026-09-17 20:54:26'),
(318, 8, 'dokumen', 'Ijazah D3 Bu Lea', 'employees/documents/8/b3X5buCywltn1LkepnOrAJBFlnnp6b9NqWdqJwTP.pdf', 'Ijazah D3_Bu Lea.pdf', '2.80 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:26', '2026-09-17 20:54:26'),
(319, 14, 'dokumen', 'Ijazah S1 Narita', 'employees/documents/14/xAX5zdjfzd70HWHzuN31n3DXlbv5VhDKINNKebG1.pdf', 'Ijazah S1_Narita.pdf', '335.16 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:58', '2026-09-17 20:54:58'),
(320, 14, 'dokumen', 'STR Narita Seumur Hidup', 'employees/documents/14/NyG7I7vB5IN2TuEHiCkbceabU2XzsiRVuGSzzZez.pdf', 'STR_Narita_Seumur Hidup.pdf', '293.33 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:58', '2026-09-17 20:54:58'),
(321, 14, 'dokumen', 'Transkrip D3 Narita Hal1', 'employees/documents/14/lBxe7fXu4GuebMBAJdCBrQ21wG2A4lQqPujJyEm0.pdf', 'Transkrip D3_Narita_Hal1.pdf', '141.36 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:58', '2026-09-17 20:54:58'),
(322, 14, 'dokumen', 'Transkrip D3 Narita Hal2', 'employees/documents/14/k5HjqqjRk8fH2Ls4K4jydd2Bdt7PupD4oncOw36k.pdf', 'Transkrip D3_Narita_Hal2.pdf', '137.06 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:58', '2026-09-17 20:54:58'),
(323, 14, 'dokumen', 'Transkrip Nilai Ners', 'employees/documents/14/tBPKESTpq051qBgCVG3s849nnJgRLouAdZ2JrVjL.pdf', 'Transkrip Nilai Ners.pdf', '819.15 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:58', '2026-09-17 20:54:58'),
(324, 14, 'dokumen', 'Ijazah dan Transkrip S1 Narita Diatanti', 'employees/documents/14/xiq6Y95rTUNkswi1WneuNRWxTJoHfzZVrkb8qFPW.pdf', 'Ijazah dan Transkrip S1_Narita Diatanti.pdf', '1.12 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:58', '2026-09-17 20:54:58'),
(325, 14, 'dokumen', 'Ijazah Ners Narita', 'employees/documents/14/IG3au4RdNNh8YUVzWg56T9vF5tYVAxqIjzKz2QzR.pdf', 'Ijazah Ners_Narita.pdf', '252.63 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:54:58', '2026-09-17 20:54:58'),
(326, 33, 'dokumen', 'Transkrip Ners Indri', 'employees/documents/33/XkcpOdn1WPIANRv2JF7Jpl8osCYSfihh1Vx5fMsL.pdf', 'Transkrip Ners_Indri.pdf', '689.58 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:55:23', '2026-09-17 20:55:23'),
(327, 33, 'dokumen', 'Transkrip Nilai S1 Oktavia Indriyani', 'employees/documents/33/dwYFyicWElvybWSGRlYcxcqt4JtMO4RpjimUPpz5.pdf', 'Transkrip Nilai S1-Oktavia Indriyani.pdf', '1.23 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:55:23', '2026-09-17 20:55:23'),
(328, 33, 'dokumen', 'Ijazah Ners OKTAVIA INDRIYANI', 'employees/documents/33/wCIqJDhDjezaA8DvHRgdTGBHlyjG9pDiO3AUODcU.pdf', 'Ijazah Ners_OKTAVIA INDRIYANI.pdf', '1.03 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:55:23', '2026-09-17 20:55:23'),
(329, 33, 'dokumen', 'Ijazah S1 Indri', 'employees/documents/33/AKssNUQo8SYbYqQJslkiQXAoyAkorS8dO2JitalO.pdf', 'Ijazah S1_Indri.pdf', '580.52 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:55:23', '2026-09-17 20:55:23'),
(330, 33, 'dokumen', 'STR Indri 10 2026', 'employees/documents/33/dY4CfcgkkwNG9RkoxCmow38QWJgM0fIiIuqlfxsk.pdf', 'STR_Indri_10_2026.pdf', '219.52 KB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:55:23', '2026-09-17 20:55:23'),
(331, 29, 'dokumen', 'Ferra Meladiana, S.IP Ijasah+Transkrip', 'employees/documents/29/l9rssXUikm1rtWGZUC295ozSqYpGeCKe5BlA5OtQ.pdf', 'Ferra Meladiana, S.IP Ijasah+Transkrip.pdf', '1.38 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:55:43', '2026-09-17 20:55:43'),
(333, 30, 'dokumen', 'Dyla Ayu Puspitasari, S.IP Ijasah+Transkrip compressed', 'employees/documents/30/hDn4uUKUCIMreD8rfdKKsEWWypJYUXxB8R44534I.pdf', 'Dyla Ayu Puspitasari, S.IP Ijasah+Transkrip_compressed.pdf', '2.58 MB', 'application/pdf', NULL, NULL, NULL, '2026-09-17 20:56:02', '2026-09-17 20:56:02');

-- --------------------------------------------------------

--
-- Table structure for table `employee_educations`
--

CREATE TABLE `employee_educations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `level` enum('SD','SMP','SMA/SMK','D1','D2','D3','D4','S1','S2','S3','lainnya') NOT NULL,
  `institution` varchar(255) NOT NULL,
  `major` varchar(255) DEFAULT NULL,
  `graduation_year` year(4) DEFAULT NULL,
  `gpa` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_educations`
--

INSERT INTO `employee_educations` (`id`, `employee_id`, `level`, `institution`, `major`, `graduation_year`, `gpa`, `created_at`, `updated_at`) VALUES
(62, 31, 'D3', 'D3 KEPERAWATAN LULUS TAHUN 2002', NULL, '2002', NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(63, 31, 'S1', 'S1 KEPERAWATAN LULUS TAHUN 2009', NULL, '2009', NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(64, 31, 'S1', 'NERS LULUS TAHUN 2010', NULL, '2010', NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(65, 31, 'S2', 'MAGISTER KEPERAWATAN LULUS TAHUN 2015', NULL, '2015', NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(91, 46, 'S1', 'S1 Farmasi Tahun 2018 Univ Muhammadiyah Malang', NULL, '2018', NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(92, 46, 'S1', 'Apoteker Thn. 2020 Univ Muhammadiyah Malang', NULL, '2020', NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(93, 46, 'S2', 'S2 Farmasi Tahun 2024 Univ Airlangga', NULL, '2024', NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(96, 49, 'S1', 'DIV MIK Tahun 2023 Stikes Panti Waluya', NULL, '2023', NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(103, 57, 'D3', 'AKPER LULUS TAHUN 1989', NULL, '1989', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(104, 57, 'S1', 'S1 KEPERAWATAN LULUS TAHUN 2000', NULL, '2000', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(105, 58, 'D3', 'AKPER LULUS TAHUN 1990', NULL, '1990', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(106, 58, 'S1', 'S1 KEPERAWATAN TAHUN 2007', NULL, '2007', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(107, 58, 'S1', 'NERS LULUS TAHUN 2008', NULL, '2008', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(108, 59, 'S2', 'S2 FARMASI LULUS THN 2014', NULL, '2014', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(109, 60, 'S1', 'S1 FARMASI LULUS TAHUN 2017', NULL, '2017', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(110, 60, 'S1', 'FARMASI LULUS TAHUN 2018', NULL, '2018', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(111, 61, 'D3', 'SMA LULUS TAHUN 1988', NULL, '1988', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(112, 62, 'S1', 'S1 TEKNOLOGI INFORMATIKA THN. 2010', NULL, '2010', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(113, 63, 'S1', 'S1 ADMINISTRASI BISNIS THN 2013', NULL, '2013', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(114, 64, 'S1', 'S1 AKUNTANSI TAHUN 2015', NULL, '2015', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(115, 65, 'S1', 'S1 EKONOMI MANAJEMEN 2015', NULL, '2015', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(116, 66, 'S1', 'S1 EKONOMI AKUNTANSI 2015', NULL, '2015', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(117, 67, 'S1', 'S1 PENDIDIKAN TATA NIAGA LULUS TAHUN 2014', NULL, '2014', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(118, 68, 'S1', 'S1 PERPUSTAKAAN LULUS TAHUN 2017', NULL, '2017', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(119, 69, 'S1', 'S1 ILMU KOMPUTER LULUS TAHUN 2014', NULL, '2014', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(120, 70, 'S1', 'S1 AKUNTANSI LULUS TAHUN 2017', NULL, '2017', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(121, 71, 'S1', 'S1 MANAJEMEN LULUS TAHUN 2015', NULL, '2015', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(122, 72, 'S1', 'S1 ILMU PSIKOLOGI TAHUN 2017', NULL, '2017', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(123, 73, 'D3', 'D3 KESEKRETARIATAN LULUS TH. 2014', NULL, '2014', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(124, 74, 'S1', 'S1 KEPERAWATAN LULUS THN. 2012', NULL, '2012', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(125, 74, 'S1', 'NERS LULUS TAHUN 2014', NULL, '2014', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(126, 75, 'S2', 'S2 LINGUISTIK LULUS THN. 2015', NULL, '2015', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(127, 76, 'S1', 'S1 KEPERAWATAN LULUS THN. 2014', NULL, '2014', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(128, 76, 'S1', 'NERS LULUS TAHUN 2015', NULL, '2015', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(129, 77, 'D3', 'DIII KEPERAWATAN LULUS THN. 2015', NULL, '2015', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(130, 78, 'S1', 'S1 ILMU KOMPUTER LULUS TAHUN 2018', NULL, '2018', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(131, 79, 'S1', 'S1 ILMU KOMPUTER LULUS TAHUN 2018', NULL, '2018', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(132, 80, 'S1', 'S1 PEND. BAHASA INGGRIS TH.2019', NULL, '2019', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(133, 81, 'S1', 'S1 SARJANA EKONOMI', NULL, NULL, NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(134, 82, 'S1', 'S1 FARMASI LULUS TAHUN 2018', NULL, '2018', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(135, 82, 'S1', 'PROFESI APOTEKER LULUS TAHUN 2019', NULL, '2019', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(136, 83, 'S1', 'D4- REKAM MEDIS LULUS TAHUN 2019', NULL, '2019', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(137, 84, 'S1', 'S1 FARMASI LULUS TAHUN 2020', NULL, '2020', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(138, 85, 'S1', 'D4 REKAM MEDIS  TAHUN 2018', NULL, '2018', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(139, 86, 'D3', 'AKPER LULUS THN. 1991', NULL, '1991', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(140, 86, 'S1', 'S1 KEPERAWATAN LULUS TAHUN 2000', NULL, '2000', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(141, 86, 'S1', 'MAGISTER KEPERAWATAN LULUS TAHUN 2012', NULL, '2012', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(142, 86, 'S2', 'SPESIALIS KEPERAWATAN MATERNITAS THN 2013', NULL, '2013', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(143, 87, 'S1', 'S1 KEPERAWATAN LULUS THN.  2015', NULL, '2015', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(144, 87, 'S1', 'NERS LULUS TAHUN 2016', NULL, '2016', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(145, 87, 'S2', 'S2 KEPERAWATAN LULUSTAHUN 2019', NULL, '2019', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(146, 88, 'S1', 'S1 SAINS (KIMIA) LULUS TAHUN 2014', NULL, '2014', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(147, 88, 'S2', 'S2 BIOTEKNOLOGI THN. 2017', NULL, '2017', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(148, 89, 'S1', 'D4 REKAM MEDIS  TAHUN 2013', NULL, '2013', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(149, 90, 'S1', 'S1 FARMASI LULUS TAHUN 2018', NULL, '2018', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(150, 90, 'S1', 'PROFESI APOTEKER LULUS TAHUN 2019', NULL, '2019', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(151, 91, 'S1', 'S1 FARMASI LULUS TAHUN', NULL, NULL, NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(152, 91, 'S1', 'PROFESI APOTEKER LULUS TAHUN 1995', NULL, '1995', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(153, 91, 'S2', 'S2 FARMASI KLINIS THN.2019', NULL, '2019', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(154, 92, 'S1', 'S1 KEPERAWATAN LULUS TAHUN  2009', NULL, '2009', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(155, 92, 'S1', 'NERS LULUS TAHUN  2010', NULL, '2010', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(156, 92, 'S2', 'Spesialis KMB Lulus Tahun 2018', NULL, '2018', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(157, 93, 'D3', 'D3 KEPERAWATAN TAHUN 2001', NULL, '2001', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(158, 93, 'S1', 'S1 KEPERAWATAN LULUS TAHUN  2005', NULL, '2005', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(159, 93, 'S1', 'NERS LULUS THN  2006', NULL, '2006', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(160, 93, 'S2', 'Spesialis KMB Lulus Tahun 2018', NULL, '2018', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(161, 94, 'S1', 'S1 EKONOMI AKUNTANSI 2014', NULL, '2014', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(162, 95, 'S1', 'S1 AKUNTANSI LULUS TAHUN 2015', NULL, '2015', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(163, 96, 'S1', 'S1 EKONOMI', NULL, NULL, NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(164, 97, 'S1', 'S1 Keperawatan Lulus Thn 2015', NULL, '2015', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(165, 97, 'S1', 'Ners Tahun 2016', NULL, '2016', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(166, 97, 'S2', 'S2 Keperawatan Tahun 2019', NULL, '2019', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(167, 98, 'S1', 'S1 PENDIDIKAN BAHASA INGGRIS LULUS TAHUN 2019', NULL, '2019', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(168, 99, 'S1', 'S1 IT LULUS TAHUN 2015', NULL, '2015', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(169, 100, 'D3', 'D3 Farmasi Lulus Tahun 2008', NULL, '2008', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(170, 101, 'S1', 'D4 REKAM MEDIS  TAHUN 2019', NULL, '2019', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(171, 102, 'S1', 'S1 FARMASI LULUS TAHUN 2020', NULL, '2020', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(172, 103, 'S1', 'D4 REKAM MEDIS  TAHUN 2018', NULL, '2018', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(173, 2, 'D3', 'Akper Lulus Thn. 1992', 'Keperawatan Ibu dan Anak', '1992', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(174, 2, 'S1', 'Universitas Brawijaya S1 Keperawatan Tahun 2007', 'Keperawatan Ibu dan Anak', '2007', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(175, 2, 'lainnya', 'Ners Lulus Tahun 2008', 'Keperawatan Ibu dan Anak', '2008', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(176, 2, 'S2', 'Universitas Airlangga Magister Kesehatan Thn. 2012', 'Keperawatan Ibu dan Anak', '2012', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(177, 3, 'D3', 'Akper Lulus Tahun 2005', 'Promosi Kesehatan', '2005', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(178, 3, 'S1', 'Unibraw S1 Keperawatan Lulus Thn. 2011', 'Promosi Kesehatan', '2011', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(179, 3, 'lainnya', 'Unibraw Ners Lulus Tahun 2012', 'Promosi Kesehatan', '2012', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(180, 3, 'S2', 'Unair Magister Kesehatan Thn. 2018', 'Promosi Kesehatan', '2018', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(181, 5, 'D3', 'Akper Lulus Tahun 2001', 'Jiwa', '2001', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(182, 5, 'S1', 'Unibraw S1 Keperawatan Lulus Thn. 2009', 'Jiwa', '2009', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(183, 5, 'lainnya', 'Unibraw Ners Lulus Tahun 2010', 'Jiwa', '2010', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(184, 5, 'S2', 'Unibraw Magister Keperawatan Thn. 2017', 'Jiwa', '2017', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(185, 104, 'D3', 'Akper Lulus Thn. 1988', 'Manajemen', '1988', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(186, 104, 'S1', 'St. Paul University Philipina S1 Bsn Tahun 2001', 'Manajemen', '2001', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(187, 104, 'S2', 'University of Santo Tomas Philipina S2 Kprwtn Man Tahun 2003', 'Manajemen', '2003', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(188, 9, 'S1', 'S1 Keperawatan Unibraw Malang Tahun 2011', 'Manajemen RS', '2011', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(189, 9, 'lainnya', 'Ners Tahun 2012', 'Manajemen RS', '2012', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(190, 9, 'S2', 'Universitas Airlangga Magister Kesehatan Tahun 2022', 'Manajemen RS', '2022', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(191, 4, 'D3', 'Akper Lulus Tahun 2001', 'Kesehatan Jiwa Lansia', '2001', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(192, 4, 'S1', 'Universitas Brawijaya S1 Keperawatan Lulus Thn. 2009', 'Kesehatan Jiwa Lansia', '2009', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(193, 4, 'lainnya', 'Universitas Brawijaya Ners Lulus Tahun 2010', 'Kesehatan Jiwa Lansia', '2010', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(194, 4, 'S2', 'Universitas Airlangga Magister Kesehatan Thn. 2017', 'Kesehatan Jiwa Lansia', '2017', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(195, 7, 'S1', 'Universitas Brawijaya S1 Keperawatan Thn. 2007', 'Gadar', '2007', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(196, 7, 'lainnya', 'Universitas Brawijaya Ners Lulus Tahun 2008', 'Gadar', '2008', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(197, 7, 'S2', 'Universitas Brawijaya Magister Keperawatan Thn. 2016', 'Gadar', '2016', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(198, 16, 'S2', 'STIKES Immanuel Bandung S1 Keprwtn Tahun 2012', 'Jiwa', '2012', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(199, 16, 'S2', 'STIKES Immanuel Bandung Ners Lulus Tahun 2013', 'Jiwa', '2013', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(200, 16, 'S2', 'Universitas Brawijaya S2 Keperawatan Tahun 2018', 'Jiwa', '2018', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(201, 17, 'S1', 'Universitas Brawijaya S1 Keperawatan Lulus Thn.  2008', 'Gadar', '2008', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(202, 17, 'lainnya', 'Universitas Brawijaya Ners Lulus Tahun 2009', 'Gadar', '2009', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(203, 17, 'S2', 'Universitas Brawijaya Magister Keperawatan Thn. 2018', 'Gadar', '2018', NULL, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(208, 13, 'S1', 'S1 Keperawatan Universitas Diponegoro Tahun 2013', 'Manajemen RS', '2013', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(209, 13, 'lainnya', 'Ners Tahun 2014', 'Manajemen RS', '2014', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(210, 13, 'S2', 'UniversitasAirlangga Magister Kesehatan Tahun 2022', 'Manajemen RS', '2022', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(211, 11, 'S1', 'Universitas Brawijaya S1 Keperawatan Lulus Thn. 2013', 'Gerontik', '2013', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(212, 11, 'lainnya', 'Universitas Brawijaya Ners Lulus Tahun 2014', 'Gerontik', '2014', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(213, 11, 'S1', 'Universitas Burapha, Thailand MNS LULUS TH 2018', 'Gerontik', '2018', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(214, 10, 'S1', 'Universitas Brawijaya S1 Keperawatan Lulus Thn. 2011', 'Manajemen', '2011', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(215, 10, 'lainnya', 'Universitas Brawijaya Ners Lulus Tahun 2012', 'Manajemen', '2012', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(216, 10, 'S1', 'Universitas Airlangga Lulus Thn. 2020', 'Manajemen', '2020', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(217, 15, 'S1', 'Universitas Brawijaya S1 Keperawatan Lulus Thn. 2015', 'KMB', '2015', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(218, 15, 'lainnya', 'Universitas Brawijaya Ners Lulus Tahun 2016', 'KMB', '2016', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(219, 15, 'S1', 'Sekolah Tinggi Sint Carolus Jakarta Lulus Thn. 2020', 'KMB', '2020', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(224, 105, 'D3', 'D3 Lulus Tahun 2002', 'Sp. Jiwa', '2002', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(225, 105, 'S1', 'Universitas Brawijaya S1 Keperawatan Tahun 2009', 'Sp. Jiwa', '2009', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(226, 105, 'lainnya', 'Universitas Brawijaya Profesi Ners Lulus thn 2010', 'Sp. Jiwa', '2010', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(227, 105, 'S2', 'Universitas Brawijaya S2 Keperawatan Lulus tahun 2015', 'Sp. Jiwa', '2015', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(228, 105, 'S1', 'Spesialis Keperawatan Jiwa 2019', 'Sp. Jiwa', '2019', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(229, 12, 'D3', 'D3 Lulus Tahun 2002', 'Komunitas', '2002', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(230, 12, 'S1', 'Universitas Brawijaya S1 Keperawatan Tahun 2011', 'Komunitas', '2011', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(231, 12, 'lainnya', 'Universitas Brawijaya Profesi Ners Lulus thn 2012', 'Komunitas', '2012', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(232, 12, 'S2', 'Universitas Brawijaya S2 Keperawatan Lulus tahun 2022', 'Komunitas', '2022', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(233, 1, 'D3', 'Akper Lulus Thn. 1989', '-', '1989', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(234, 1, 'S1', 'Unibraw S1 Keperawatan Lulus Tahun 2001', '-', '2001', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(235, 1, 'lainnya', 'Unibraw Ners Lulus Tahun 2002', '-', '2002', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(236, 1, 'S2', 'Unibraw Magister Biomedik Thn. 2014', '-', '2014', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(237, 106, 'S1', 'Universitas Surabaya S1 Farmasi Lulus Tahun 1996', 'Klinis', '1996', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(238, 106, 'lainnya', 'Universitas Surabaya Profesi Apt Lulus Thn 2001', 'Klinis', '2001', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(239, 106, 'S2', 'Universitas Surabaya S2 Farmasi Klinis Thn.2017', 'Klinis', '2017', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(240, 107, 'S1', 'Universitas Surabaya S1 Farmasi Lulus Tahun 2000', 'Klinis', '2000', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(241, 107, 'lainnya', 'Profesi Apt Lulus Thn 2001', 'Klinis', '2001', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(242, 107, 'S2', 'Universitas Surabaya S2 Farmasi Thn.2017', 'Klinis', '2017', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(243, 32, 'S1', 'Universitas Udayana S1 Sains (Kimia) Lulus Tahun 2011', '-', '2011', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(244, 32, 'S2', 'Universitas Gadjah Mada S2 Bioteknologi Thn. 2018', '-', '2018', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(245, 35, 'S1', 'Universitas Surabaya S1 Farmasi Lulus Tahun 2018', 'Klinis', '2018', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(246, 35, 'lainnya', 'Profesi Apoteker Lulus Thn 2019', 'Klinis', '2019', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(247, 35, 'S2', 'Universitas Surabaya S2 Farmasi Klinis Thn. 2022', 'Klinis', '2022', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(248, 44, 'S1', 'S1 Farmasi Univ Machung Thn. 2022', 'Industri', '2022', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(249, 44, 'S2', 'S2 Farmasi Univ Setia Budi Thn.2024', 'Industri', '2024', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(250, 19, 'D3', 'D3 Farmasi Lulus Tahun 1996', 'Bahan Alam', '1996', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(251, 19, 'S1', 'S1 Farmasi Tahun 2020', 'Bahan Alam', '2020', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(252, 19, 'S2', 'S2 Farmasi Univ Airlangga Tahun 2024', 'Bahan Alam', '2024', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(253, 45, 'S1', 'S1 Farmasi Tahun 2019 Univ Muhammadiyah Malang', 'Manajemen', '2019', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(254, 45, 'S1', 'Apoteker Thn. 2021 Institut Sains dan Tek Nas Jakarta', 'Manajemen', '2021', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(255, 45, 'S2', 'S2 Farmasi Tahun 2024 Univ Setia Budi Surakarta', 'Manajemen', '2024', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(256, 45, 'S1', 'S1 Farmasi Tahun 2018 Univ Muhammadiyah Malang', 'Manajemen', '2018', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(257, 45, 'S1', 'Apoteker Thn. 2020 Univ Muhammadiyah Malang', 'Manajemen', '2020', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(258, 45, 'S2', 'S2 Farmasi Tahun 2024 Univ Airlangga', 'Manajemen', '2024', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(259, 108, 'S1', 'S1 Farmasi UnMuh  Malang Thn. 2023', 'Kosmetik dan bahan Alam farmasi industri', '2023', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(260, 108, 'S2', 'S2 Farmasi Univ Ahmad Dahlan Thn.2026', 'Kosmetik dan bahan Alam farmasi industri', '2026', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(261, 109, 'S1', 'S1 Farmasi Ubaya Tahun 1995', '-', '1995', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(262, 109, 'S1', 'Apoteker Ubaya Tahun 1996', '-', '1996', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(263, 109, 'S2', 'S2 Farmasi Ubaya Tahun 2023', '-', '2023', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(264, 6, 'S1', 'UNAIR S1 Kesehatan Masyarakat 2002', 'Biostatistik', '2002', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(265, 6, 'S2', 'Unair Magister Kesehatan Thn.2017', 'Biostatistik', '2017', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(266, 34, 'D4', 'DIV MIK Politeknik Negri Jember Tahun 2018', 'Manajemen Pelayanan Lesehatan', '2018', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(267, 34, 'S2', 'S2 Ilmu Kesehatan Masy Thn. 2021', 'Manajemen Pelayanan Lesehatan', '2021', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(268, 41, 'D4', 'DIV Rekam Medik Politeknik Negri Jember Thn. 2020', 'Manajemen Pelayanan Lesehatan', '2020', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(269, 41, 'S2', 'S2 Kesehatan Masyarakat Thn. 2022 Univ Sebelas Maret Surakarta', 'Manajemen Pelayanan Lesehatan', '2022', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(270, 40, 'D4', 'DIV Rekam Medik Politeknik Negri Jember Thn. 2020', 'Manajemen Pelayanan Lesehatan', '2020', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(271, 40, 'S2', 'S2 Kesehatan Masyarakat Thn. 2022 Univ Sebelas Maret Surakarta', 'Manajemen Pelayanan Lesehatan', '2022', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(272, 42, 'S1', 'S1 Teknik Komputer Unibraw Thn. 2020', 'Ilmu Komputer', '2020', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(273, 42, 'S2', 'S2 Ilmu Komputer Unibraw Tahun 2022', 'Ilmu Komputer', '2022', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(274, 43, 'S1', 'S1 Statistik Unibraw Tahun 2021', 'Statistik', '2021', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(275, 43, 'S2', 'S2 Statistik Unibraw Tahun 2022', 'Statistik', '2022', NULL, '2026-09-01 01:43:09', '2026-09-01 01:43:09'),
(276, 8, 'D4', 'D Iv Kebidanan Lulus Thn. 2008', '-', '2008', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(277, 14, 'D3', 'Diii Keperawatan Lulus Thn 2010', '-', '2010', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(278, 14, 'S1', 'S1 Keperawatan Lulus Thn.  2019', '-', '2019', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(279, 14, 'lainnya', 'Ners Lulus Tahun 2020', '-', '2020', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(280, 28, 'D4', 'D Iv Rekam Medik Lulus Tahun 2015', '-', '2015', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(281, 18, 'D3', 'D3 Rmik Lulus Tahun 2018', '-', '2018', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(282, 33, 'S1', ' S1 Keperawatan Tahun 2019', '-', '2019', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(283, 33, 'lainnya', 'Profesi Ners Lulus Thn 2020', '-', '2020', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(284, 38, 'S1', 'S1 Farmasi Tahun 2022 Machung', '-', '2022', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(285, 39, 'S1', 'S1 Farmasi Tahun 2022 Machung', '-', '2022', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(286, 47, 'S1', 'S1 Farmasi Tahun 2023 Stikes Panti Waluya', '-', '2023', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(287, 48, 'S1', 'S1 Farmasi Tahun 2023 Stikes Panti Waluya', '-', '2023', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(288, 50, 'D4', 'DIV MIK Tahun 2025 Stikes Panti Waluya', '-', '2025', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(289, 110, 'S1', 'S1 Farmasi Tahun 2023 Apoteker Thn. 2025 Universitas Ma Chung', '-', '2023', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(290, 111, 'S1', 'S1 Stikes Panti Waluya Thn 2023 Apt Univ Ma Chung Thn. 2026', '-', '2023', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(291, 25, 'SMA/SMK', 'Smk Lulus Tahun 1997', '-', '1997', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(292, 25, 'S1', 'S1 Akuntansi Lulus Tahun 2011 Univ', '-', '2011', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(293, 26, 'SMA/SMK', 'Sma Lulus Tahun 1997', '-', '1997', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(294, 27, 'D3', 'DIII Kesekretariatan Lulus Th. 2013 Univ Widya Karya', '-', '2013', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(295, 29, 'S1', 'S1 Ilmu Perpustakaan Tahun 2018 UM', '-', '2018', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(296, 30, 'S1', 'S1 Ilmu Perpustakaan Tahun 2018 UM', '-', '2018', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(297, 37, 'S1', 'S1 Manajemen Lulus Tahun 2021 UM', '-', '2021', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(298, 36, 'D4', 'DIV Teknik Informatika Lulus Tahun 2021 Polinema', '-', '2021', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(299, 51, 'D4', 'DIV Destinasi Wisata Unmer Tahun 2022', '-', '2022', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(300, 52, 'S1', 'S1 Akuntansi Univ Widya Karya Lulus Tahun 2024', '-', '2024', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(301, 54, 'S1', 'S1 Teknik Informatika ITN Malang Tahun 2025', '-', '2025', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(302, 53, 'S1', 'S1 Akuntansi Univ Widya Karya Tahun 2025', '-', '2025', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(303, 55, 'D4', 'DIV Keselamatan dan Kesehatan Kerja Poltekkes Kemenkes Malang Thn 2025', '-', '2025', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(304, 112, 'S1', 'S1 Psikologi Universitas Merdeka Malang tahun 2018', '-', '2018', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(305, 20, 'S1', 'Smp Lulus Tahun 1992', '-', '1992', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(306, 21, 'S1', 'Smu Lulus Tahun 2003', '-', '2003', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(307, 22, 'S1', 'Smp Lulus Tahun 1994', '-', '1994', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(308, 23, 'SMA/SMK', 'Sma Lulus Thn. 2010', '-', '2010', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(309, 24, 'S1', 'Stm Lulus Thn. 2001', '-', '2001', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(310, 56, 'SMA/SMK', 'SMK Multimedia Tahun 2016', '-', '2016', NULL, '2026-09-01 01:43:10', '2026-09-01 01:43:10');

-- --------------------------------------------------------

--
-- Table structure for table `employee_families`
--

CREATE TABLE `employee_families` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `relation` enum('pasangan','anak','orang_tua','saudara','lainnya') NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `is_dependent` tinyint(1) NOT NULL DEFAULT 0,
  `phone` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_families`
--

INSERT INTO `employee_families` (`id`, `employee_id`, `relation`, `full_name`, `birth_date`, `occupation`, `is_dependent`, `phone`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 'pasangan', 'Cetty Lellyani', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(2, 2, 'pasangan', 'ANTONIUS TRIYUDA EKA. P', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(3, 3, 'pasangan', 'HUPITOYO', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(4, 4, 'pasangan', 'EDY OKTA LEVENCIA', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(5, 5, 'pasangan', 'NANANG SUDIRO FITRIANTO', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(6, 6, 'pasangan', 'HERMAN SETYAWAN', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(7, 7, 'pasangan', 'ANDREAS PATRIA WIBISANA', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(8, 9, 'pasangan', 'DARWANTO', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(9, 10, 'pasangan', 'ANDREAS', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(10, 15, 'pasangan', 'DESY AYU VIRANA', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(11, 16, 'pasangan', 'GABRIELA WAHYU ANDHIKASARI', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(12, 20, 'pasangan', 'NURJANATUL ALIYAH', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(13, 21, 'pasangan', 'MONICA DWI SIH PANGLIPUR', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(14, 22, 'pasangan', 'SUPRIJONO', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(15, 24, 'pasangan', 'MARIA LILIS MEI KRISTANTI', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(16, 25, 'pasangan', 'HENGKY AGUNG KURNIAWAN', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(17, 26, 'pasangan', 'RIKKY SETIAWAN', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(18, 57, 'pasangan', 'WAYAN JUNI UDJIANTI', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(19, 58, 'pasangan', 'MARIUS HEDY TRI SISWANTO', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(20, 59, 'pasangan', 'Patrik Anggun Hery Wijaya', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(21, 61, 'pasangan', 'KANTHI', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(22, 81, 'pasangan', 'CYNTHIA YUNITA DWIJAYANTI', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(23, 86, 'pasangan', 'JOHAN GUNAWAN', NULL, NULL, 1, NULL, NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07');

-- --------------------------------------------------------

--
-- Table structure for table `employee_trainings`
--

CREATE TABLE `employee_trainings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('pelatihan','sertifikasi','lisensi','workshop','seminar','lainnya') NOT NULL,
  `name` varchar(255) NOT NULL,
  `organizer` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `certificate_number` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_01_01_000001_create_departments_table', 1),
(5, '2024_01_01_000002_create_positions_table', 1),
(6, '2024_01_01_000003_add_role_to_users_table', 1),
(7, '2024_01_01_000004_create_employees_table', 1),
(8, '2024_01_01_000005_create_employee_families_table', 1),
(9, '2024_01_01_000006_create_employee_contacts_table', 1),
(10, '2024_01_01_000007_create_employee_educations_table', 1),
(11, '2024_01_01_000008_create_employee_trainings_table', 1),
(12, '2024_01_01_000009_create_employee_documents_table', 1),
(13, '2024_01_01_000010_create_resignation_details_table', 1),
(14, '2026_08_18_000001_create_settings_table', 1),
(15, '2026_09_01_000001_add_academic_fields_to_employees_table', 1),
(16, '2026_09_18_000001_create_document_types_table', 2),
(17, '2026_09_18_000002_allow_custom_type_in_employee_documents_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`, `code`, `department_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'PENATA/PELAKSANA', 'PENATA', 1, NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(2, 'PENATA MUDA/PELAKSANA', 'PENA1', 1, NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(3, 'PENGATUR TK.I/PELAKSANA', 'PENGAT', 1, NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(4, 'PENATA /PELAKSANA', 'PENA2', 1, NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(5, 'Staf DOSEN', 'STAFDO', 1, NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(6, 'Staf S1 Farmasi', 'STAFS1', 2, NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(7, 'Staf TENAGA PENGAJAR', 'STAFTE', 3, NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(8, 'Staf TENAGA KEPENDIDIKAN', 'STAF1', 4, NULL, 1, '2026-09-01 01:43:04', '2026-09-01 01:43:04'),
(9, 'Staf TENAGA PENDIDIK', 'STAF2', 5, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(10, 'PENATA MUDA / PELAKSANA', 'PENA3', 1, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(11, 'Staf LABORAN', 'STAFLA', 6, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(12, 'PENGATUR MUDA TK. I / PELAKSANA', 'PENG1', 7, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(13, 'Staf PENGEMUDI', 'STAFPE', 8, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(14, 'Staf RUMAH TANGGA', 'STAFRU', 9, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(15, 'Staf SATPAM', 'STAFSA', 10, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(16, 'PENGATUR TK. I / PELAKSANA', 'PENG2', 11, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(17, 'Staf PUSTAKAWAN', 'STAFPU', 14, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(18, 'Staf STAF IT', 'STAFST', 15, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(19, 'Staf ADMINISTRASI', 'STAFAD', 11, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(20, 'Staf LABORAN FARMASI', 'STAF3', 16, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(21, 'Staf DOSEN MIK', 'STAF4', 17, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(22, 'Staf DOSEN FARMASI', 'STAF5', 18, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(23, 'Staf LABORAN MIK', 'STAF6', 19, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(24, 'Staf RESEPSIONIS', 'STAFRE', 20, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(25, 'Staf KEUANGAN', 'STAFKE', 21, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(26, 'Staf K3', 'STAFK3', 22, NULL, 1, '2026-09-01 01:43:05', '2026-09-01 01:43:05'),
(27, 'PENATA / PELAKSANA', 'PENA4', 1, NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(28, 'PENATA MUDA TK. I / PELAKSANA', 'PENA5', 1, NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(29, 'Staf Umum', 'STAFUM', 24, NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(30, 'Staf AKADEMIK/KEMAHASISWAAN FARMASI', 'STAFAK', 25, NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(31, 'Staf PSDM', 'STAFPS', 26, NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(32, 'Staf IT', 'STAFIT', 23, NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(33, 'Staf Laboran Farmasi', 'STAF7', 27, NULL, 1, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(34, 'Staf DOSEN S1 KEPERAWATAN', 'STAF8', 29, NULL, 1, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(35, 'Staf DOSEN NERS', 'STAF9', 28, NULL, 1, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(36, 'Dosen', NULL, 30, NULL, 1, '2026-09-01 01:43:08', '2026-09-01 01:43:08'),
(37, 'Staf BAAK', NULL, 33, NULL, 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(38, 'Staf Feeder', NULL, 34, NULL, 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(39, 'Staf Laboran DIV MIK', NULL, 35, NULL, 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(40, 'Staf Laboran S1 Farmasi', NULL, 36, NULL, 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(41, 'Staf PJ Apoteker', NULL, 37, NULL, 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(42, 'Staf Perpustakaan', NULL, 38, NULL, 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(43, 'Staf Akademik/Kemahasiswaan Akpw', NULL, 12, NULL, 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(44, 'Staf Resepsionis, Promo', NULL, 39, NULL, 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10'),
(45, 'Staf Pertukangan', NULL, 7, NULL, 1, '2026-09-01 01:43:10', '2026-09-01 01:43:10');

-- --------------------------------------------------------

--
-- Table structure for table `resignation_details`
--

CREATE TABLE `resignation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `resignation_date` date NOT NULL,
  `reason` enum('resign_mandiri','habis_kontrak','pensiun','phk','lainnya') NOT NULL,
  `reason_detail` text DEFAULT NULL,
  `clearance_status` enum('pending','process','completed') NOT NULL DEFAULT 'pending',
  `clearance_notes` text DEFAULT NULL,
  `clearance_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resignation_details`
--

INSERT INTO `resignation_details` (`id`, `employee_id`, `resignation_date`, `reason`, `reason_detail`, `clearance_status`, `clearance_notes`, `clearance_date`, `notes`, `created_at`, `updated_at`) VALUES
(1, 57, '1992-05-01', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '1992-05-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(2, 58, '1997-05-01', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '1997-05-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(3, 59, '2017-10-01', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2017-10-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(4, 60, '2020-05-02', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2020-05-02', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(5, 61, '1999-09-01', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '1999-09-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(6, 62, '2016-11-01', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2016-11-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(7, 63, '2016-05-02', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2016-05-02', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(8, 64, '2017-11-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2017-11-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(9, 65, '2017-12-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2017-12-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(10, 66, '2018-11-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2018-11-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(11, 67, '2019-05-02', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2019-05-02', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(12, 68, '2019-03-01', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2019-03-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(13, 69, '2019-05-02', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2019-05-02', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(14, 70, '2020-04-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2020-04-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(15, 71, '2020-09-10', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2020-09-10', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(16, 72, '2021-04-07', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2021-04-07', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(17, 73, '2021-04-07', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2021-04-07', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(18, 74, '2017-03-02', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2017-03-02', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(19, 75, '2017-10-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2017-10-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(20, 76, '2017-11-02', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2017-11-02', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(21, 77, '2017-11-03', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2017-11-03', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(22, 78, '2028-01-02', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2028-01-02', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(23, 79, '2028-01-02', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2028-01-02', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(24, 80, '2028-07-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2028-07-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(25, 81, '2021-10-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2021-10-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(26, 82, '2022-08-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2022-08-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(27, 83, '2022-08-31', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2022-08-31', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(28, 84, '2022-09-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2022-09-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(29, 85, '2023-03-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2023-03-01', NULL, '2026-09-01 01:43:06', '2026-09-01 01:43:06'),
(30, 86, '1994-01-07', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '1994-01-07', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(31, 87, '2020-10-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2020-10-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(32, 88, '2021-04-01', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2021-04-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(33, 89, '2021-05-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2021-05-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(34, 90, '2021-07-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2021-07-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(35, 91, '2021-07-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2021-07-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(36, 92, '2021-07-01', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2021-07-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(37, 93, '2021-07-01', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2021-07-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(38, 94, '2018-05-02', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2018-05-02', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(39, 95, '2019-04-03', 'resign_mandiri', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2019-04-03', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(40, 96, '2028-09-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2028-09-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(41, 97, '2028-09-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2028-09-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(42, 98, '2022-01-02', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2022-01-02', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(43, 99, '2022-02-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2022-02-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(44, 100, '2022-03-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2022-03-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(45, 101, '2022-08-19', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2022-08-19', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(46, 102, '2022-09-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2022-09-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(47, 103, '2023-03-01', 'habis_kontrak', 'Data diimpor dari daftar riwayat pegawai non-aktif.', 'completed', 'Penyelesaian aset dan administrasi selesai.', '2023-03-01', NULL, '2026-09-01 01:43:07', '2026-09-01 01:43:07'),
(48, 49, '2026-09-17', 'resign_mandiri', NULL, 'completed', NULL, NULL, NULL, '2026-09-17 07:14:40', '2026-09-17 07:14:40');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vjCQLmeU06mAQiLxWH7XXpR68kMFVSgXWVrIN2ED', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQjZtdXJFR2wzUTVTekhJd014b1pCRUI1N0x1RlRMekxHMU1HQzlLaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO3M6NToicm91dGUiO3M6OToiZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1789703909);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'app_name', 'PRISMA-PW', '2026-09-01 01:43:03', '2026-09-01 01:43:03'),
(2, 'app_description', 'Portal Informasi Sumber Daya Manusia Panti Waluya', '2026-09-01 01:43:03', '2026-09-01 01:43:03'),
(3, 'institution_name', 'STIKes Panti Waluya Malang', '2026-09-01 01:43:03', '2026-09-01 01:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('admin_it','hrd','guest') NOT NULL DEFAULT 'hrd',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `is_active`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin IT (STIKes Panti Waluya)', 'admin@simpeg.local', 'admin_it', 1, NULL, '$2y$12$oVX.fC4CNKX83k2p3knk/.IiFz1pt/L3eXATsJ8Q5LDuUopeImZQW', NULL, '2026-09-01 01:43:03', '2026-09-01 01:43:03'),
(2, 'Tim HRD & Kepeformatan', 'hrd@simpeg.local', 'hrd', 1, NULL, '$2y$12$8z7tXWNrhCwkW0hKeBD6.eNZn5vx2UCEgIZosP0iyfZwE03wmzMli', NULL, '2026-09-01 01:43:03', '2026-09-01 01:43:03'),
(3, 'Akun Tamu / Guest', 'guest@simpeg.local', 'guest', 1, NULL, '$2y$12$PVMHlbrk270brfQD/mbHHO63pfZFGqofvqeZsJbLqHADxRTmZW7Cq', NULL, '2026-09-01 01:43:03', '2026-09-01 01:43:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_code_unique` (`code`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_types_code_unique` (`code`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_nik_unique` (`nik`),
  ADD KEY `employees_department_id_foreign` (`department_id`),
  ADD KEY `employees_position_id_foreign` (`position_id`),
  ADD KEY `employees_supervisor_id_foreign` (`supervisor_id`);

--
-- Indexes for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_contacts_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_documents_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_educations`
--
ALTER TABLE `employee_educations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_educations_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_families`
--
ALTER TABLE `employee_families`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_families_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_trainings`
--
ALTER TABLE `employee_trainings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_trainings_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `positions_code_unique` (`code`),
  ADD KEY `positions_department_id_foreign` (`department_id`);

--
-- Indexes for table `resignation_details`
--
ALTER TABLE `resignation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resignation_details_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT for table `employee_educations`
--
ALTER TABLE `employee_educations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `employee_families`
--
ALTER TABLE `employee_families`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `employee_trainings`
--
ALTER TABLE `employee_trainings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `resignation_details`
--
ALTER TABLE `resignation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employees_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employees_supervisor_id_foreign` FOREIGN KEY (`supervisor_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  ADD CONSTRAINT `employee_contacts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD CONSTRAINT `employee_documents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_educations`
--
ALTER TABLE `employee_educations`
  ADD CONSTRAINT `employee_educations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_families`
--
ALTER TABLE `employee_families`
  ADD CONSTRAINT `employee_families_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_trainings`
--
ALTER TABLE `employee_trainings`
  ADD CONSTRAINT `employee_trainings_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `resignation_details`
--
ALTER TABLE `resignation_details`
  ADD CONSTRAINT `resignation_details_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
