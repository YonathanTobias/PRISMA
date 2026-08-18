-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2026 at 06:42 AM
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
(1, 'DOSEN', 'DOSEN', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(2, 'S1 Farmasi', 'S1FARM', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(3, 'TENAGA PENGAJAR', 'TENAGA', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(4, 'TENAGA KEPENDIDIKAN', 'TENA1', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(5, 'TENAGA PENDIDIK', 'TENA2', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(6, 'LABORAN', 'LABORA', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(7, 'PERTUKANGAN', 'PERTUK', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(8, 'PENGEMUDI', 'PENGEM', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(9, 'RUMAH TANGGA', 'RUMAHT', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(10, 'SATPAM', 'SATPAM', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(11, 'ADMINISTRASI', 'ADMINI', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(12, 'AKADEMIK/KEMAHASISWAAN AKPW', 'AKADEM', NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(13, 'LABORAN PRODI RM', 'LABO1', NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(14, 'PUSTAKAWAN', 'PUSTAK', NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(15, 'STAF IT', 'STAFIT', NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(16, 'LABORAN FARMASI', 'LABO2', NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(17, 'DOSEN MIK', 'DOSENM', NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(18, 'DOSEN FARMASI', 'DOSENF', NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(19, 'LABORAN MIK', 'LABO3', NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(20, 'RESEPSIONIS', 'RESEPS', NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(21, 'KEUANGAN', 'KEUANG', NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(22, 'K3', 'K3', NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `employment_status` enum('tetap','kontrak','magang','probation') NOT NULL DEFAULT 'tetap',
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED DEFAULT NULL,
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

INSERT INTO `employees` (`id`, `nik`, `full_name`, `birth_place`, `birth_date`, `gender`, `address`, `phone`, `email`, `photo`, `employment_status`, `department_id`, `position_id`, `supervisor_id`, `work_location`, `join_date`, `contract_end_date`, `status`, `marital_status`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1283/A', 'Wibowo, S.Kep., Ns. M.Biomed', 'Malang', '1967-10-07', 'L', 'PERUM GRAHA JATIMULYA KAV 21 RT.3 RW.6 JL. SAXOPHONE', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Wibowo-S.Kep_.-Ns.-M.-Biomed-199x300.jpg', 'tetap', 1, 1, NULL, 'Kampus STIKes Panti Waluya Malang', '1990-11-01', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/c', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(2, '1089/A', 'Emy Sutiyarsih, S.Kep., Ns., M.Kes', 'BANGREJO', '1967-10-23', 'P', 'DE CASABLANCA RESIDENCE BLOK C6 NO.43 RT.5 RW.5 KEDUNGKANDANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Emy-Sutiyarsih-S.Kep_.-Ns.-M.Kes_-199x300.jpg', 'tetap', 1, 1, NULL, 'Kampus STIKes Panti Waluya Malang', '1987-08-01', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/c', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(3, '1674/A', 'Ns. Monika Luhung, S.Kep., M.Kes', 'UJOH BILANG', '1965-11-15', 'P', 'JL. SIMPANG IJEN NO. 37 RT.6 RW.10 MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Monika-Luhung-S.Kep_.-M.Kep_-199x300.jpg', 'tetap', 1, 2, NULL, 'Kampus STIKes Panti Waluya Malang', '1997-09-16', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(4, '1778/A', 'Ns. Nanik Dwi Astutik, S.Kep., M.Kes', 'MALANG', '1979-12-29', 'P', 'PERUM GREEN LIVING BLOK B/11 A JL. SATSUI TUBUN RT.03 RW.06 GADANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Nanik-Dwi-Astutik-S.Kep_.-M.Kes_-199x300.jpg', 'tetap', 1, 3, NULL, 'Kampus STIKes Panti Waluya Malang', '2002-01-02', NULL, 'active', 'menikah', 'Agama: KRISTEN | Golongan: II/d', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(5, '1780/A', 'Ns. Ellia Ariesti, S.Kep., M.Kep', 'BLITAR', '1980-04-10', 'P', 'JL. KEPUH GG VII A NO.26 RT.5 RW.5 MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Ellia-Ariesti-S.Kep_.-M.Kep_-199x300.jpg', 'tetap', 1, 3, NULL, 'Kampus STIKes Panti Waluya Malang', '2002-01-02', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: II/d', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(6, '01/A/AKP', 'Wisoedhanie Widi Anugrahanti, SKM., M.Kes', 'MALANG', '1978-11-06', 'P', 'JL. GATOT SUBROTO I/36 SEDAYU - TUREN', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Wisoedhanie-Widi-A.-SKM.-M.Kes_-199x300.jpg', 'tetap', 1, 4, NULL, 'Kampus STIKes Panti Waluya Malang', '2003-02-03', NULL, 'active', 'menikah', 'Agama: ISLAM | Golongan: III/c', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(7, '05/A/AKP', 'Ns. Oda Debora, S.Kep., M.Kep', 'MALANG', '1985-04-29', 'P', 'JL. IKAN MAS 1 NO. 3 RT.1 RW.7 LOWOKWARU MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Oda-Debora-S.Kep_.-M.Kep_-199x300.jpg', 'tetap', 1, 2, NULL, 'Kampus STIKes Panti Waluya Malang', '2008-11-01', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(8, '08/A/AKP', 'ELI LEA WIDHIA PURWANDHANI , SST', 'KEDIRI', '1984-02-13', 'P', 'ASRAMA YONKAV 3 / TANK RANDUAGUNG SINGOSARI MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Eli-Lea-Widhia-P.-S.ST_-199x300.jpg', 'tetap', 1, 5, NULL, 'Kampus STIKes Panti Waluya Malang', '2012-05-01', NULL, 'active', 'menikah', 'Agama: KRISTEN', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(9, '09/A/AKP', 'Ns. IFA PANNYA SAKTI, S.Kep.,M.Kep', 'BLITAR', '1986-10-01', 'P', 'DSN. BUNENG RT.1 RW.2 DS. BORO KEC. SELOREJO BLITAR', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Ifa-Pannya-Sakti-S.Kep_-199x300.jpg', 'tetap', 1, 5, NULL, 'Kampus STIKes Panti Waluya Malang', '2012-05-01', NULL, 'active', 'menikah', 'Agama: BUDHA', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(10, '10/A/AKP', 'Ns. FEBRINA SECSARIA HANDINI, S.Kep.,M.Kep', 'MALANG 12 FEBRUARI 1986', NULL, 'P', 'JL. JALAK NO.23 RT.03 RW. 08 MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/08/Ns.-Febrina-Secsaria-Handini-S.Kep_-233x300.jpg', 'tetap', 2, 6, NULL, 'Kampus STIKes Panti Waluya Malang', '2012-05-01', NULL, 'active', 'menikah', 'Agama: KRISTEN', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(11, '11/A/AKP', 'Ns. BERLIANNY VENNY SIPOLLO, S.Kep.,.,M.Kep MNS', 'MALUKU', '1990-08-03', 'P', 'JL. BENDUNGAN LAHOR 42 RT.011 RW.002 KEL.KARANGKATES KEC. SUMBERPUCUNG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Berliany-Venny-S.-S.Kep_-199x300.jpg', 'tetap', 3, 7, NULL, 'Kampus STIKes Panti Waluya Malang', '2014-09-01', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(12, '2017.01.16.AKP', 'Ns. YUSTINA EMI SETYOBUDI, S.Kep.,M.Kep', 'MALANG', '1985-05-02', 'P', 'Dsn. Tlogo Rt.19 Rw.02 Tlogosari - Donomulyo - Malang', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Yustina-Emi-S.-S.Kep_-199x300.jpg', 'tetap', 1, 5, NULL, 'Kampus STIKes Panti Waluya Malang', '2015-01-02', NULL, 'active', 'menikah', 'Agama: KATOLIK', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(13, '2016.01.14/AKP', 'Ns. MARIA PRIESKA PUTRI PANGLIPUR ATI, S.Kep.,M.Kep', 'KAB. SEMARANG', '1990-03-25', 'P', 'DSN. KAMPUNG RAPET I/III KEC. BANYUBIRU', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Maria-Prieska-P.P.A.-S.Kep_.-Ns-199x300.jpg', 'tetap', 1, 5, NULL, 'Kampus STIKes Panti Waluya Malang', '2015-01-02', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(14, '2016.01.15.AKP', 'NARITA DIATANTI, Amd.Kep', 'MALANG', '1989-08-26', 'P', 'JL. W.R. SUPRATMAN RT.002 RW.004 TANGGUNG - TUREN - MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Narita-Diatanti-Amd.Kep_-199x300.jpg', 'tetap', 4, 8, NULL, 'Kampus STIKes Panti Waluya Malang', '2015-06-01', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(15, '2017.01.17/AKP', 'Ns. ACHMAD SYUKKUR, S.Kep', 'BANGKALAN', '1990-11-17', 'L', 'JL. LAKS MARTADINATA 14 RT.14 RW.02 KOTALAMA KEDUNGKANDANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/08/pak-syukur-225x300.jpg', 'tetap', 4, 8, NULL, 'Kampus STIKes Panti Waluya Malang', '2016-05-02', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(16, '2018.01.24/STIKes', 'YAFET PRADIKATAMA PRIHANTO, S.Kep.,Ns.,M.Kep', 'TEMANGGUNG', '1989-08-09', 'L', 'JL. PARAKAN NGADIREJO KM 04, Dsn. KARANGSENEN RT.01/04 DESA TRAJI KEC. PARAKAN KAB. TEMANGGUNG JAWA TENGAH', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Yafet-Pradikatama-P.-S.Kep_.-Ns-199x300.jpg', 'tetap', 5, 9, NULL, 'Kampus STIKes Panti Waluya Malang', '2017-04-03', NULL, 'active', 'menikah', 'Agama: KRISTEN', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(17, '07/A/AKP', 'Ns. ELIZABETH YUN-YUN VINSUR, M.Kep', 'MALANG', '1986-01-14', 'P', 'JL. SUMPIL II/8 BRT.2 RW.6  BLIMBING MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Elizabeth-Yun-Yun-S.Kep_.-M.Kep_-199x300.jpg', 'tetap', 1, 10, NULL, 'Kampus STIKes Panti Waluya Malang', NULL, NULL, 'active', 'belum_menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(18, '2022.01.46/STIKes', 'VINCENSIA DEA PRASETYA PUTRI, Amd.Kes', 'SURABAYA', '1996-09-28', 'P', 'JL. BANDULAN BARU 162C', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/09/foto-vincensia-dea-200x300.jpeg', 'tetap', 6, 11, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-01-02', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(19, '2020.01.42/Stikes', 'DEVANUS LAHARDO, A.Md., S.E., M.M', 'BLITAR', '1975-12-10', 'L', 'JL. TELUK CENDRAWASIH 95E MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/09/Devanus-Lahardo-198x300.jpg', 'tetap', 1, 5, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-04-01', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(20, '450/B', 'AGUS WIDODO', 'MALANG', '1975-08-19', 'L', 'PETUNGSEWU RT.09 RW.03 PETUNGSEWU WAGIR', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Agus-Widodo-199x300.jpg', 'tetap', 7, 12, NULL, 'Kampus STIKes Panti Waluya Malang', '1995-12-01', NULL, 'active', 'menikah', 'Agama: ISLAM | Golongan: II/b', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(21, '03/C/AKP.', 'YULI HARIADI WIDODO', 'MALANG', '1983-07-09', 'L', 'SUKUN MARGA BHAKTI NO. 30 RT.2 RW.10', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Yuli-Hariadi-199x300.jpg', 'tetap', 8, 13, NULL, 'Kampus STIKes Panti Waluya Malang', '2009-12-01', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: II/a', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(22, '427/B', 'INDARTI', 'PASURUAN', '1979-05-31', 'P', 'JL. S. SUPRIYADI GG. II E NO. 8 RT.2 RW.3 MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Indarti-199x300.jpg', 'tetap', 9, 12, NULL, 'Kampus STIKes Panti Waluya Malang', '1995-03-16', NULL, 'active', 'menikah', 'Agama: ISLAM | Golongan: II/b', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(23, '2017.02.21/AKP', 'NATALIA HENDRI SUSANTI', 'MALANG', '1985-12-25', 'P', 'JL. DERKUKU SELATAN NO. 21 MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Natalia-199x300.jpg', 'tetap', 9, 14, NULL, 'Kampus STIKes Panti Waluya Malang', '2013-03-01', NULL, 'active', 'menikah', 'Agama: KATOLIK', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(24, '04/C/AKP.', 'DAVID ARDIANTO', 'MALANG', '1982-07-14', 'L', 'JL. S. SUPRIYADI GG. 7 RT.6 RW.2 NO. 22 SUKUN', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/David-Ardianto-199x300.jpg', 'tetap', 10, 15, NULL, 'Kampus STIKes Panti Waluya Malang', '2008-02-25', NULL, 'active', 'menikah', 'Agama: KRISTEN', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(25, '1675/A', 'WIENDA SETYOWATI, SE', 'MALANG', '1979-07-30', 'P', 'JL. MANYAR NO. 32 MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Wienda-Setyowati-S.E-199x300.jpg', 'tetap', 11, 10, NULL, 'Kampus STIKes Panti Waluya Malang', '1997-09-16', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(26, '1685/A', 'KRISTINA RINI SUSANTI', 'MADIUN', '1979-11-24', 'P', 'JL. KEMANTREN I GG. SIMPANG BRAWIJAYA C-7 RT.12 RW.03 SUKUN MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Kristina-Rini-Susanti-199x300.jpg', 'tetap', 11, 16, NULL, 'Kampus STIKes Panti Waluya Malang', '1998-05-15', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: II/d', '2026-08-11 21:40:34', '2026-08-11 21:40:34', NULL),
(27, '2018.02.20/AKP', 'MAGDALENA NOVITASARI DWI SUSANTI, Amd', 'MALANG', '1992-11-09', 'P', 'JL.SEMBOJA 15 RT.02 RW.03 KEL. CEPOKOMULYO KEPANJEN', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Magdalena-Novi-Amd-199x300.jpg', 'tetap', 12, 10, NULL, 'Kampus STIKes Panti Waluya Malang', '2017-04-03', NULL, 'active', 'menikah', 'Agama: KATOLIK | Golongan: III/a', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(28, '2019.02.25/STIKes', 'RASWATI PRAPTI RAHAYU,S.ST', 'BANYUWANGI', '1993-06-26', 'P', 'DSN. PERSEN DS. KEDUNGASRI 15/03 KEC. TEGALDLIMO KAB.BANYUWANGI', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Raswati-Prapti-R.-S.ST_-199x300.jpg', 'tetap', 13, 10, NULL, 'Kampus STIKes Panti Waluya Malang', '2017-04-03', NULL, 'active', 'belum_menikah', 'Agama: HINDU | Golongan: III/a', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(29, '2020.02.38/Stikes', 'FERRA MELADIANA, S.IP', 'MALANG', '1996-03-09', 'P', 'JL. KERTORAHARJO 26B MALANG', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/09/Ferra-Meladiana-211x300.jpg', 'tetap', 14, 17, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-03-01', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(30, '2020.02.39/Stikes', 'DYLA AYU PUSPITASARI, S.IP', 'KEDIRI', '1996-09-19', 'P', 'DUSUN PULOREJO RT.01 RW.20 DESA KRECEK KEC. BADAS KAB. KEDIRI JATIM', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2019/09/foto-dyla-ayu-200x300.jpeg', 'tetap', 14, 17, NULL, 'Kampus STIKes Panti Waluya Malang', '2019-03-01', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(31, NULL, 'Mochamad Ali Sodikin, S.Kep, Ns.Sp.Kep.J., M.Kep.', 'PASURUAN', '1977-10-24', 'L', 'Puri Purwosari  Indah A - 14 Purwosari', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2020/06/ALI-SODIKIN.jpg', 'kontrak', 1, 5, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-04-01', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(32, '2021.01.44/STIKes', ' Venny Kurnia Andika, S.Si, M.Biotech ', 'Pontianak', '1989-03-16', 'P', 'JL. SUTAN SYAHRIR GG KARYA 1 NO.37 BERINGIN/KAPUAS', NULL, NULL, 'http://66.96.237.13/pegawaistks/wp-content/uploads/2020/09/Screenshot_3.jpg', 'tetap', 1, 5, NULL, 'Kampus STIKes Panti Waluya Malang', '2020-09-01', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(33, '2022.01.48/STIKes', 'Ns. Oktavia Indriyani, S.Kep', 'Magelang', '1996-10-01', 'P', 'Dusun Wonosari RT 4/ RW 21 Gunung Pring Muntilan', NULL, NULL, NULL, 'tetap', 6, 11, NULL, 'Kampus STIKes Panti Waluya Malang', NULL, NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(34, '2021.01.45/STIKes', 'Nita Dwi Nur Aini, S.ST., M.Kes', 'PROBOLINGGO', '1996-06-10', 'P', 'Jalan mastrip gang mangga no 2 RT 01 RW 04 kel. Jrebeng wetan kec. Kedopok kota probolinggo jatim', NULL, NULL, NULL, 'tetap', 1, 5, NULL, 'Kampus STIKes Panti Waluya Malang', NULL, NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(35, '2023.01.49/STIKes', 'Sirilus Deodatus Sawu, S.Farm., M.Farm', 'Soe', '1996-03-29', 'L', 'Oekefan, RT/RW 007/003 Kota Soe Nusa Tenggara Timur', NULL, NULL, NULL, 'tetap', 1, 5, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(36, '2025.02.61/STIKes', 'Yonathan Tobias Buttok, S.Tr.Kom', 'Malang', '1999-01-04', 'L', 'JI. Tlogo Indah IV No. 65 RT.001 RW.002 Kelurahan Tlogomas Kecamatan Lowokwaru MALANG', NULL, NULL, NULL, 'tetap', 15, 18, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(37, '2024.02.54/STIKes', 'Atanasius Omega Dewantara, SE', 'Malang', '1999-05-02', 'L', 'Perum Griya Asri Blok T-2 RT.09 RW.04 Kel.Pandanwangi Kec. Blimbing - MALANG', NULL, NULL, NULL, 'tetap', 11, 19, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(38, '2023.01.55/STIKes', 'Yushinta Elsa Valina, S.Farm', 'Malang', '1999-08-20', 'P', 'JI. Tlogo Indah IV No. 65 RT.001 RWSUMBER WUNI GG MANGGA 304, KALIREJO, LAWANG', NULL, NULL, NULL, 'tetap', 16, 20, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(39, '2025.01.59/STIKes', 'Nancy Ratu Jovancha Laurentza, S.Far', 'Malang', '1998-11-25', 'P', 'Jl. Hasanudin rt 03 rw 08 Junrejo, Batu', NULL, NULL, NULL, 'tetap', 16, 20, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(40, '2023.01.51/STIKes', 'Bhre Diansyah D.K.,S.Tr.Kes.,M.K.M', 'Lumajang', '1998-02-26', 'L', 'Perumnas Jatiroto RT.06/ RW.07 Lumajang', NULL, NULL, NULL, 'tetap', 17, 21, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(41, '2023.01.50/STIKes', 'Moh. Maulana,  S.Tr.Kes.,M.K.M', 'Jember', '1997-07-21', 'L', NULL, NULL, NULL, NULL, 'tetap', 17, 21, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(42, '2024.01.57/STIKes', 'Jeffry Atur Firdaus, S.T., M.Kom', 'Pasuruan', '1998-10-29', 'L', NULL, NULL, NULL, NULL, 'tetap', 17, 21, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(43, '2025.01.63/STIKes', 'Endang Krisnawati, S.Stat., M.Stat', 'Tulungagung', NULL, 'P', NULL, NULL, NULL, NULL, 'tetap', 17, 21, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(44, '2025.01.62/STIKes', 'Ika Nuraini, S.Farm., M.Farm', 'Malang', '2000-07-01', 'P', NULL, NULL, NULL, NULL, 'tetap', 18, 22, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(45, '2025.01.64/STIKes', 'apt. Yulinda Pristi Dwi Hapysari, S.Farm., M.Farm', 'Kediri', '1996-07-01', 'P', NULL, NULL, NULL, NULL, 'tetap', 18, 22, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(46, NULL, 'Apt. Hestining Puspaweni, S.Farm., M.Farm', 'Palangkaraya', '1995-10-11', 'P', NULL, NULL, NULL, NULL, 'kontrak', 18, 22, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(47, '2025.01.65/STIKes', 'Fransiska Elsia One Irawan, S.Farm', 'Malang', '2001-01-28', 'P', NULL, NULL, NULL, NULL, 'tetap', 16, 20, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(48, '2024.01.58/STIKes', 'Yolanda Agustina, S.Farm', 'Malang', '2001-07-12', 'P', NULL, NULL, NULL, NULL, 'tetap', 16, 20, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(49, '2025.01.60/STIKes', 'Agnes Carolina Kristin, S.Tr.RMIK', 'Malang', '2001-03-01', 'P', NULL, NULL, NULL, NULL, 'tetap', 19, 23, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KRISTEN', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(50, NULL, 'Egnatius Permadi S.Tr.RMIK', 'Malang', '2003-02-22', 'L', NULL, NULL, NULL, NULL, 'kontrak', 19, 23, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(51, NULL, 'Vania Livia Kesrina Kendinar Makmur Jaya Waimuri, S.Tr.Par', 'Biak', '2001-06-08', 'P', NULL, NULL, NULL, NULL, 'kontrak', 20, 24, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(52, NULL, 'Bernadette Adriana Farelita Yohandhy, S.Ak', 'Padang', '2001-11-05', 'P', NULL, NULL, NULL, NULL, 'kontrak', 21, 25, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(53, NULL, 'Katarina Sastrini Wawut, S.Ak', 'Nterlango', '2002-08-18', 'P', NULL, NULL, NULL, NULL, 'kontrak', 21, 25, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(54, NULL, 'Yohanes Yudha Saputra Bangko, S.Kom', 'Malang', '2003-08-19', 'L', NULL, NULL, NULL, NULL, 'kontrak', 15, 18, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: KATOLIK', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(55, NULL, 'Dany Arief Herlambang, S.Tr.Kes', 'Mojokerto 11 Januari 2003', NULL, 'L', NULL, NULL, NULL, NULL, 'kontrak', 22, 26, NULL, 'Kampus STIKes Panti Waluya Malang', '2026-08-12', NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL),
(56, NULL, 'Mochamad Abdul Aziz', 'Malang', '1996-10-15', 'L', NULL, NULL, NULL, NULL, 'kontrak', 9, 14, NULL, 'Kampus STIKes Panti Waluya Malang', NULL, NULL, 'active', 'belum_menikah', 'Agama: ISLAM', '2026-08-11 21:40:35', '2026-08-11 21:40:35', NULL);

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
  `type` enum('ktp','npwp','bpjs_kesehatan','bpjs_ketenagakerjaan','ijazah','kontrak_kerja','sk_jabatan','foto','lainnya') NOT NULL,
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
(1, 1, 'D3', 'AKPER LULUS THN. 1989', NULL, '1989', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(2, 1, 'S1', 'S1 KEPERAWATAN LULUS TAHUN 2001', NULL, '2001', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(3, 1, 'S1', 'NERS LULUS TAHUN 2002', NULL, '2002', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(4, 1, 'S2', 'MAGISTER BIOMEDIK THN 2014', NULL, '2014', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(5, 2, 'D3', 'AKPER LULUS TAHUN 1992', NULL, '1992', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(6, 2, 'S1', 'S1 KEPERAWATAN TAHUN 2007', NULL, '2007', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(7, 2, 'S1', 'NERS LULUS TAHUN 2008', NULL, '2008', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(8, 2, 'S2', 'MAGISTER KESEHATAN TAHUN 2012', NULL, '2012', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(9, 3, 'D3', 'AKPER LULUS TAHUN 2005', NULL, '2005', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(10, 3, 'S1', 'S1 KEPERAWATAN LULUS TAHUN 2011', NULL, '2011', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(11, 3, 'S1', 'NERS LULUS TAHUN 2012', NULL, '2012', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(12, 3, 'S2', 'MAGISTER KESEHATAN TAHUN 2018', NULL, '2018', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(13, 4, 'D3', 'AKPER LULUS TAHUN 2001', NULL, '2001', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(14, 4, 'S1', 'S1 KEPERAWATAN LULUS TAHUN 2009', NULL, '2009', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(15, 4, 'S1', 'NERS TAHUN 2010', NULL, '2010', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(16, 4, 'S2', 'MAGISTER KESEHATAN2017', NULL, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(17, 5, 'D3', 'AKPER LULUS TAHUN 2001', NULL, '2001', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(18, 5, 'S1', 'S1 KEPERAWATAN LULUS TAHUN 2009', NULL, '2009', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(19, 5, 'S1', 'NERS LULUS TAHUN 2010', NULL, '2010', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(20, 5, 'S2', 'MAGISTER KEPERAWATAN TAHUN 2017', NULL, '2017', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(21, 6, 'S1', 'S1 KESEHATAN MASYARAKAT 2002', NULL, '2002', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(22, 6, 'S2', 'MAGISTER KEPERAWATAN TAHUN 2017', NULL, '2017', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(23, 7, 'S1', 'S1 KEPERAWATAN TAHUN 2007', NULL, '2007', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(24, 7, 'S1', 'NERS LULUS TAHUN 2008', NULL, '2008', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(25, 7, 'S2', 'MAGISTER KEPERAWATAN TAHUN 2016', NULL, '2016', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(26, 8, 'D3', 'D IV KEBIDANAN LULUS TAHUN 2008', NULL, '2008', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(27, 9, 'S1', 'S1 KEPERAWATAN LULUS TAHUN 2011', NULL, '2011', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(28, 9, 'S1', 'NERS LULUS TAHUN 2012', NULL, '2012', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(29, 10, 'S1', 'S1 KEPERAWATAN 2011', NULL, '2011', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(30, 10, 'S1', 'NERS LULUS TAHUN 2012', NULL, '2012', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(31, 11, 'S1', 'S1 KEPERAWATAN LULUS THN. 2013', NULL, '2013', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(32, 11, 'S1', 'NERS LULUS TAHUN 2014', NULL, '2014', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(33, 12, 'S1', 'S1 KEPERAWATAN LULUS THN. 2011', NULL, '2011', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(34, 12, 'S1', 'NERS LULUS TAHUN 2012', NULL, '2012', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(35, 13, 'S1', 'S1 KEPERAWATAN LULUS THN.  2013', NULL, '2013', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(36, 13, 'S1', 'NERS LULUS TAHUN 2014', NULL, '2014', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(37, 14, 'D3', 'DIII KEPERAWATAN LULUS THN 2010', NULL, '2010', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(38, 15, 'S1', 'S1 KEPERAWATAN LULUS THN 2015', NULL, '2015', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(39, 15, 'S1', 'NERS LULUS TAHUN 2016', NULL, '2016', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(40, 16, 'S1', 'S1 KEPERAWATAN LULUS TAHUN 2012', NULL, '2012', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(41, 16, 'S1', 'NERS LULUS TAHUN 2013', NULL, '2013', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(42, 16, 'S2', 'S2 KEPERAWATAN TAHUN 2018', NULL, '2018', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(43, 17, 'S1', 'S1 KEPERAWATAN LULUS THN.  2008', NULL, '2008', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(44, 17, 'S1', 'NERS LULUS TAHUN 2009', NULL, '2009', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(45, 17, 'S2', 'MAGISTER KEPERAWATAN THN. 2018', NULL, '2018', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(46, 18, 'D3', 'D3 RMIK LULUS TAHUN 2018', NULL, '2018', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(47, 19, 'D3', 'D3 FARMASI LULUS TAHUN 1996', NULL, '1996', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(48, 19, 'S1', 'S1 MANAJEMEN LULUS TAHUN 2009', NULL, '2009', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(49, 19, 'S2', 'S2 MANAJEMEN KESEHATAN THN. 2011', NULL, '2011', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(50, 20, 'D3', 'SMP LULUS TAHUN 1992', NULL, '1992', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(51, 21, 'D3', 'SMU LULUS TAHUN 2003', NULL, '2003', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(52, 22, 'D3', 'SMP LULUS TAHUN 1994', NULL, '1994', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(53, 23, 'D3', 'SMA LULUS THN. 2010', NULL, '2010', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(54, 24, 'D3', 'STM LULUS THN. 2001', NULL, '2001', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(55, 25, 'D3', 'SMK LULUS TAHUN 1997', NULL, '1997', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(56, 25, 'S1', 'S1 AKUNTANSI LULUS TAHUN 2011', NULL, '2011', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(57, 26, 'D3', 'SMA LULUS TAHUN 1997', NULL, '1997', NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(58, 27, 'D3', 'DIII KESEKRETARIATAN LULUS TH. 2013', NULL, '2013', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(59, 28, 'D3', 'D IV REKAM MEDIK LULUS TAHUN 2015', NULL, '2015', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(60, 29, 'S1', 'S1 ILMU PERPUSTAKAAN TAHUN 2018', NULL, '2018', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(61, 30, 'S1', 'S1 ILMU PERPUSTAKAAN TAHUN 2018', NULL, '2018', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(62, 31, 'D3', 'D3 KEPERAWATAN LULUS TAHUN 2002', NULL, '2002', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(63, 31, 'S1', 'S1 KEPERAWATAN LULUS TAHUN 2009', NULL, '2009', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(64, 31, 'S1', 'NERS LULUS TAHUN 2010', NULL, '2010', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(65, 31, 'S2', 'MAGISTER KEPERAWATAN LULUS TAHUN 2015', NULL, '2015', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(66, 32, 'S1', 'S1 SARJANA SAINS lulus tahun 2011', NULL, '2011', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(67, 32, 'S2', 'S2 SARJANA BIOTECHNOLOGY lulus tahun 2018', NULL, '2018', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(68, 33, 'S1', 'S1 KEPERAWATAN LULUS TAHUN 2019', NULL, '2019', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(69, 33, 'S2', 'NERS LULUS TAHUN 2020', NULL, '2020', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(70, 34, 'S1', 'D4 REKAM MEDIK lulus 2018', NULL, '2018', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(71, 35, 'S1', 'S1 Farmasi Lulus Tahun 2018', NULL, '2018', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(72, 35, 'S1', 'Apoteker Lulus Thn 2019', NULL, '2019', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(73, 35, 'S2', 'S2 FARMASI LULUS TAHUN 2022', NULL, '2022', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(74, 36, 'S1', 'D4 Teknik informatika Lulus Tahun 2021', NULL, '2021', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(75, 37, 'S1', 'S1 Manajemen Lulus Tahun 2021', NULL, '2021', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(76, 38, 'S1', 'S1 Farmasi Lulus Tahun 2022', NULL, '2022', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(77, 39, 'S1', 'S1 Farmasi Lulus Tahun 2022', NULL, '2022', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(78, 40, 'S1', 'D4 REKAM MEDIS Lulus Tahun 2020', NULL, '2020', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(79, 40, 'S2', 'S2 ILMU KESEHATAN MASYARAKAT LULUS TAHUN 2022', NULL, '2022', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(80, 41, 'S1', 'D4 REKAM MEDIS Lulus Tahun 2020', NULL, '2020', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(81, 41, 'S2', 'S2 ILMU KESEHATAN MASYARAKAT LULUS TAHUN 2022', NULL, '2022', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(82, 42, 'S1', 'S1 Teknik Komputer Unibraw Thn. 2020', NULL, '2020', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(83, 42, 'S2', 'S2 Ilmu Komputer Unibraw Tahun 2022', NULL, '2022', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(84, 43, 'S1', 'S1 Statistik Unibraw Tahun 2021', NULL, '2021', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(85, 43, 'S2', 'S2 Statistik Unibraw Tahun 2022', NULL, '2022', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(86, 44, 'S1', 'S1 Farmasi Univ Machung Thn. 2022', NULL, '2022', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(87, 44, 'S2', 'S2 Farmasi Univ Setia Budi Thn.2024', NULL, '2024', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(88, 45, 'S1', 'S1 Farmasi Tahun 2019 Univ Muhammadiyah Malang', NULL, '2019', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(89, 45, 'S1', 'Apoteker Thn. 2021 Institut Sains dan Tek Nas Jakarta', NULL, '2021', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(90, 45, 'S2', 'S2 Farmasi Tahun 2024 Univ Setia Budi Surakarta', NULL, '2024', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(91, 46, 'S1', 'S1 Farmasi Tahun 2018 Univ Muhammadiyah Malang', NULL, '2018', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(92, 46, 'S1', 'Apoteker Thn. 2020 Univ Muhammadiyah Malang', NULL, '2020', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(93, 46, 'S2', 'S2 Farmasi Tahun 2024 Univ Airlangga', NULL, '2024', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(94, 47, 'S1', 'S1 Farmasi Tahun 2023 Stikes Panti Waluya', NULL, '2023', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(95, 48, 'S1', 'S1 Farmasi Tahun 2023 Stikes Panti Waluya', NULL, '2023', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(96, 49, 'S1', 'DIV MIK Tahun 2023 Stikes Panti Waluya', NULL, '2023', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(97, 50, 'S1', 'DIV MIK Tahun 2025 Stikes Panti Waluya', NULL, '2025', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(98, 51, 'S1', 'DIV Destinasi Wisata Unmer Tahun 2022', NULL, '2022', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(99, 52, 'S1', 'S1 Akuntansi Univ Widya Karya Lulus Tahun 2024', NULL, '2024', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(100, 53, 'S1', 'S1 Akuntansi Univ Widya Karya Tahun 2025', NULL, '2025', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(101, 54, 'S1', 'S1 Teknik Informatika ITN Malang Tahun 2025', NULL, '2025', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(102, 55, 'S1', 'DIV Keselamatan dan Kesehatan Kerja Poltekkes Kemenkes Malang Thn 2025', NULL, '2025', NULL, '2026-08-11 21:40:35', '2026-08-11 21:40:35');

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
(1, 1, 'pasangan', 'Cetty Lellyani', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(2, 2, 'pasangan', 'ANTONIUS TRIYUDA EKA. P', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(3, 3, 'pasangan', 'HUPITOYO', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(4, 4, 'pasangan', 'EDY OKTA LEVENCIA', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(5, 5, 'pasangan', 'NANANG SUDIRO FITRIANTO', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(6, 6, 'pasangan', 'HERMAN SETYAWAN', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(7, 7, 'pasangan', 'ANDREAS PATRIA WIBISANA', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(8, 9, 'pasangan', 'DARWANTO', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(9, 10, 'pasangan', 'ANDREAS', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(10, 15, 'pasangan', 'DESY AYU VIRANA', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(11, 16, 'pasangan', 'GABRIELA WAHYU ANDHIKASARI', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(12, 20, 'pasangan', 'NURJANATUL ALIYAH', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(13, 21, 'pasangan', 'MONICA DWI SIH PANGLIPUR', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(14, 22, 'pasangan', 'SUPRIJONO', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(15, 24, 'pasangan', 'MARIA LILIS MEI KRISTANTI', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(16, 25, 'pasangan', 'HENGKY AGUNG KURNIAWAN', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(17, 26, 'pasangan', 'RIKKY SETIAWAN', NULL, NULL, 1, NULL, NULL, '2026-08-11 21:40:34', '2026-08-11 21:40:34');

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
(13, '2024_01_01_000010_create_resignation_details_table', 1);

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
(1, 'PENATA/PELAKSANA', 'PENATA', 1, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(2, 'PENATA MUDA/PELAKSANA', 'PENA1', 1, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(3, 'PENGATUR TK.I/PELAKSANA', 'PENGAT', 1, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(4, 'PENATA /PELAKSANA', 'PENA2', 1, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(5, 'Staf DOSEN', 'STAFDO', 1, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(6, 'Staf S1 Farmasi', 'STAFS1', 2, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(7, 'Staf TENAGA PENGAJAR', 'STAFTE', 3, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(8, 'Staf TENAGA KEPENDIDIKAN', 'STAF1', 4, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(9, 'Staf TENAGA PENDIDIK', 'STAF2', 5, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(10, 'PENATA MUDA / PELAKSANA', 'PENA3', 1, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(11, 'Staf LABORAN', 'STAFLA', 6, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(12, 'PENGATUR MUDA TK. I / PELAKSANA', 'PENG1', 7, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(13, 'Staf PENGEMUDI', 'STAFPE', 8, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(14, 'Staf RUMAH TANGGA', 'STAFRU', 9, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(15, 'Staf SATPAM', 'STAFSA', 10, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(16, 'PENGATUR TK. I / PELAKSANA', 'PENG2', 11, NULL, 1, '2026-08-11 21:40:34', '2026-08-11 21:40:34'),
(17, 'Staf PUSTAKAWAN', 'STAFPU', 14, NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(18, 'Staf STAF IT', 'STAFST', 15, NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(19, 'Staf ADMINISTRASI', 'STAFAD', 11, NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(20, 'Staf LABORAN FARMASI', 'STAF3', 16, NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(21, 'Staf DOSEN MIK', 'STAF4', 17, NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(22, 'Staf DOSEN FARMASI', 'STAF5', 18, NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(23, 'Staf LABORAN MIK', 'STAF6', 19, NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(24, 'Staf RESEPSIONIS', 'STAFRE', 20, NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(25, 'Staf KEUANGAN', 'STAFKE', 21, NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35'),
(26, 'Staf K3', 'STAFK3', 22, NULL, 1, '2026-08-11 21:40:35', '2026-08-11 21:40:35');

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
('2303IiCnet48iGDUs63MeBtrgwItu1ZAJbh2gxT8', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibm1NMEtDQVFUWTFjYnhLVlJqdlJaTTBCWFBZTUFTbms3dUFlbzZrTCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjg4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZW1wbG95ZWVzP2RlcGFydG1lbnRfaWQ9JmVtcGxveW1lbnRfc3RhdHVzPWtvbnRyYWsmZ2VuZGVyPSZzZWFyY2g9IjtzOjU6InJvdXRlIjtzOjE1OiJlbXBsb3llZXMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1786509694);

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
(1, 'Admin IT (STIKes Panti Waluya)', 'admin@simpeg.local', 'admin_it', 1, NULL, '$2y$12$F9C/ZERTPUlbUeC0qPFImO940DifEZjMBtv1wml9F.FGVmrjI/7gG', NULL, '2026-08-11 21:40:33', '2026-08-11 21:40:33'),
(2, 'Tim HRD & Kepeformatan', 'hrd@simpeg.local', 'hrd', 1, NULL, '$2y$12$.4jbfyTgwDgrVo6aRviog.PPAVjDzDxvKkzw1I9bH0BOgJV2.D5Gy', NULL, '2026-08-11 21:40:33', '2026-08-11 21:40:33'),
(3, 'Akun Tamu / Guest', 'guest@simpeg.local', 'guest', 1, NULL, '$2y$12$KukBu/Hp36jl9hS0BI91SOdatlMLKjKWF6GjJGkT2ki3VPnGWCKmi', NULL, '2026-08-11 21:40:33', '2026-08-11 21:40:33');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_educations`
--
ALTER TABLE `employee_educations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `employee_families`
--
ALTER TABLE `employee_families`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `resignation_details`
--
ALTER TABLE `resignation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
