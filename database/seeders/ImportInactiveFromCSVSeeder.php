<?php

namespace Database\Seeders;

use App\Models\Department;
use App\Models\Position;
use App\Models\Employee;
use App\Models\EmployeeEducation;
use App\Models\EmployeeFamily;
use App\Models\ResignationDetail;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;
use Carbon\Carbon;

class ImportInactiveFromCSVSeeder extends Seeder
{
    public function run(): void
    {
        $csvData = <<<'CSV'
1;1251/A;NUR CAHYO BUDIWIBOWO, SKp.;GENTENG, 16 SEPTEMBER 1967;LAKI - LAKI;INDONESIA / KATOLIK;PENATA / PELAKSANA;III/c;KAWIN;WAYAN JUNI UDJIANTI;AKPER LULUS TAHUN 1989;S1 KEPERAWATAN LULUS TAHUN 2000;;;"DOSEN ";JL. GUNAWAN II NO. 3 RT.3 RW.3 KALIMERI - TAJINAN;01 MEI 1990;
2;1500/A;YUNI SRI HARYANTI;KLATEN, 21 JUNI 1965;PEREMPUAN;INDONESIA / KATOLIK;PENATA MUDA TK. I / PELAKSANA;III/b;KAWIN;MARIUS HEDY TRI SISWANTO;AKPER LULUS TAHUN 1990;S1 KEPERAWATAN TAHUN 2007;NERS LULUS TAHUN 2008;;DOSEN;JL. KAPI JANULA III 15H / 11 PERUM SAWOJAJAR II RT.6 RW.14 PAKIS;01 MEI 1995;
3;2015.01.14/AKP;BETTI DWI KARTIKASARI, S.Farm., M.Si., Apt;Malang, 8 Juli 1989;PEREMPUAN;INDONESIA / KRISTEN;;;KAWIN;Patrik Anggun Hery Wijaya;;;;S2 FARMASI LULUS THN 2014;TENAGA PENDIDIK;JL. GATOT SUBROTO NO. 52 RT.02 RW.03 TUREN MALANG;01 OKTOBER 2015;
4;;ELOK DEA ORENS UBUNG WISNU, S.Farm., Apt.;MALANG, 1 OKTOBER 1994;PEREMPUAN;INDONESIA / KATOLIK;;;BELUM KAWIN;;;S1 FARMASI LULUS TAHUN 2017;FARMASI LULUS TAHUN 2018;;TENAGA KEPENDIDIKAN;JL. INTAN 2 BLOK HC 12 PERUM GRIYA PERMATA ALAM RT.04 RW.11 NGIJO KARANGPLOSO MALANG;02 MEI 2018;
5;471/B;LENDRA EKO RIHANTO;MALANG, 22 DESEMBER 1968;LAKI - LAKI;INDONESIA / ISLAM;PENATA MUDA / PELAKSANA;III/a  Maks;KAWIN;KANTHI;SMA LULUS TAHUN 1988;;;;SATPAM;JL. KARYA BARAT NO. 30 RT.2 RW.2 BLIMBING - MALANG;01 SEPTEMBER 1997;
6;04/B/AKP;KENJIRO GOGOH HANANTO, S.Kom;MALANG, 28 FEBRUARI 1992;LAKI - LAKI;INDONESIA / KATOLIK;PENATA MUDA / PELAKSANA;III/a;BELUM KAWIN;;;S1 TEKNOLOGI INFORMATIKA THN. 2010;;;IT;JL. KEBEN II PERMAI D2 MALANG;01 NOPEMBER 2014;
7;;C.WIDHYA PUTRI PERMATASARI, SAB;MALANG, 01 JULI 1991;PEREMPUAN;INDONESIA / KATOLIK;;;BELUM KAWIN;;;S1 ADMINISTRASI BISNIS THN 2013;;;ADMINISTRASI;JL. DANAU SENTANI II BLOK E3B/30;02 MEI 2014;
8;;AGNES, S.Akun;NANGA PINOH, 07 SEPTEMBER 1993;PEREMPUAN;INDONESIA / KATOLIK;;;BELUM KAWIN;;;S1 AKUNTANSI TAHUN 2015;;;ADMINISTRASI;"JL. PENDIDIKAN GANG.FAMILI RT 001 RW 002 DESA PAAL, KAB.MELAWI, KALIMANTAN BARAT ";01 NOVEMBER 2015;
9;;CHRISTA HARDIYANTI, SE;BANGIL, 30 MARET 1991;PEREMPUAN;INDONESIA / KATOLIK;;;BELUM KAWIN;;;S1 EKONOMI MANAJEMEN 2015;;;ADMINISTRASI;JL. SAWOJAJAR 5B/32 MALANG;01 DESEMBER 2015;
10;;LINDA SUGIHARTI, SE;MALANG, 17 APRIL 1992;PEREMPUAN;INDONESIA / KATOLIK;;;;;;S1 EKONOMI AKUNTANSI 2015;;;;JALAN HAMID RUSDI GG.3 NO. 228i MALANG;01 NOVEMBER 2016;
11;;THEODORA DYAH LISTYORINI, S.Pd;PROBOLINGGO, 12 JUNI 1990;PEREMPUAN;INDONESIA / KATOLIK;;;BELUM KAWIN;;;S1 PENDIDIKAN TATA NIAGA LULUS TAHUN 2014;;;AKADEMIK/KEMAHASISWAAN FARMASI;PERUM ASABRI H 206 RT.08 RW.12 KANIGARAN PROBOLINGGO;02 MEI 2017;
12;2018.02.19/AKP;AN NISA SHABIRAH, S.Ptk.;SURABAYA, 28 MEI 1995;PEREMPUAN;INDONESIA / ISLAM;PENATA MUDA / PELAKSANA;III/a;BELUM KAWIN;;;S1 PERPUSTAKAAN LULUS TAHUN 2017;;;PUSTAKAWAN;PONDOK SIDOKARE INDAH KK 22 RT.39 RW.11  SIDOARJO;01 MARET 2017;
13;2018.02.22AKP;DICKY CHRISTIAN DJUMIRAN, S.Kom;MALANG, 8 DESEMBER 1990;LAKI - LAKI;INDONESIA / KATOLIK;PENATA MUDA / PELAKSANA;III/a;BELUM KAWIN;;;S1 ILMU KOMPUTER LULUS TAHUN 2014;;;IT;JALAN UNTUNG SUROPATI SELATAN I NO. 6 MALANG;02 MEI 2017;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/06/Dicky-Christian-Djumiran-S.Kom_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-425"" />"
14;;SERVIAN LAZUARDI,SE;MALANG, 31 OKTOBER 1992;LAKI - LAKI;INDONESIA / KRISTEN;;;BELUM KAWIN;;;S1 AKUNTANSI LULUS TAHUN 2017;;;ADMINISTRASI;PERUM LPK NO. 13 MALANG;01 APRIL 2018;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/06/Servian-Lazuardi-S.E-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-453"" />"
15;;GIDEON IMAN KRISTIANDRI,SE;JAKARTA, 10 SEPTEMBER 1993;LAKI - LAKI;INDONESIA / KRISTEN;;;BELUM KAWIN;;;S1 MANAJEMEN LULUS TAHUN 2015;;;ADMINISTRASI;JL. SIMPANG IJEN NO. 25 MALANG;10 SEPTEMBER 2018;
16;;Nova Inggaring Tjahyo Putri, S.Psi;KEDIRI, 08 NOVEMBER 1995;PEREMPUAN;INDONESIA / KATOLIK;;;BELUM KAWIN;;;S1 ILMU PSIKOLOGI TAHUN 2017;;;PSDM;JL. GARUDA NO. 75 RT.066 RW.019 PARE KEDIRI;07 APRIL 2019;
17;;MARGARETA ANASTASYA SHELVY C, Amd;SURABAYA, 13 MEI 1992;PEREMPUAN;INDONESIA / KRISTEN;;;BELUM KAWIN;;D3 KESEKRETARIATAN LULUS TH. 2014;;;;ADMINISTRASI;TEGALSARI RT.08 RW.04 KP. MALANG UTARA 7/7 D TEGALSARI;07 APRIL 2019;
18;;"Ns. IKA PUNDIA KRISTIN NINGRUM BERTUS S.Kep ";NGAWI, 15 JUNI 1990;PEREMPUAN;INDONESIA / KRISTEN;;;BELUM KAWIN;;;S1 KEPERAWATAN LULUS THN. 2012;NERS LULUS TAHUN 2014;;TENAGA KEPENDIDIKAN;JL. RAYA SOLO-SURABAYA KM.7 DS. KEBON RT.01 RW.03 KEC PARON KAB. NGAWI;02 MARET 2015;
19;;LERY PRASETYO, S.S, M.A;BLITAR, 17 MARET 1989;LAKI - LAKI;INDONESIA / BUDHA;;;BELUM KAWIN;;;;;S2 LINGUISTIK LULUS THN. 2015;TENAGA PENDIDIK;RT.01 RW.02 DUSUN TEGALREJO DESA GEMBONGAN KEC. PONGGOK BLITAR;01 OKTOBER 2015;
20;;NS. LIDIA RULIASTINIWA B, S.KEP;SEMARANG, 3 AGUSTUS 1992;PEREMPUAN;INDONESIA / KATOLIK;;;BELUM KAWIN;;;S1 KEPERAWATAN LULUS THN. 2014;NERS LULUS TAHUN 2015;;TENAGA KEPENDIDIKAN;JL. TANJUNG SARI IC/08 PEDURUNGAN TENGAH  SEMARANG;2 NOPEMBER 2015;
21;;VINCENTIA INDAH A.P, AMD.KEP;MALANG, 9 JULI 1994;PEREMPUAN;INDONESIA / KATOLIK;;;BELUM KAWIN;;DIII KEPERAWATAN LULUS THN. 2015;;;;TENAGA KEPENDIDIKAN;" JL. SUMBER WUNI 154 RT.1 RW.3 KEL. KALIREJO LAWANG";3 NOPEMBER 2015;
22;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=141"">Richard Alexander Faramond Lores S.Kom</a>";YOGYAKARTA, 19 JANUARI 1997;LAKI - LAKI;INDONESIA / KATOLIK;;;BELUM KAWIN;;;S1 ILMU KOMPUTER LULUS TAHUN 2018;;;IT;JL. KH AGUS SALIM GG 4/3 RT 03 RW.11 PURWOKERTO;O2 JANUARI 2019;
23;;"<a href="" http://66.96.237.9/pegawaistks/?page_id=143"">Benedictus Yoga Permana, S.Kom</a>";SLEMAN, 1 SEPTEMBER 1995;LAKI - LAKI;INDONESIA / KATOLIK;;;BELUM KAWIN;;;S1 ILMU KOMPUTER LULUS TAHUN 2018;;;IT;"PERUM GRIYA SATRIA MANDALATAMA BLOK IIA NO.27 RT.8 RW.5  KARANGLEWAS ";O2 JANUARI 2019;
24;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=1088"">Maria Dani Ringksi, S.Pd</a>";COVALIMA, 21 FEBRUARI 1997;PEREMPUAN;INDONESIA / KATOLIK;;;BELUM KAWIN;;;S1 PEND. BAHASA INGGRIS TH.2019;;;ADMINISTRASI;Kemloko I RT.01 RW.01 Kel. Kenalan Kec. Borobudur Magelang Jateng;01 Juli 2019;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/09/Maria-dani-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-1603"" />"
25;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=1770"">Yusafat Eko Transisko, SE</a>";BLITAR, 13 SEPTEMBER 1992;LAKI - LAKI;INDONESIA / KATHOLIK;;;KAWIN;CYNTHIA YUNITA DWIJAYANTI;;S1 SARJANA EKONOMI;;;ADMINISTRASI;DUSUN BANYUURIP RT 012 / RW 003 KELURAHAN MOJOREJO WATES;1 OKTOBER 2019;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/10/pas-foto_-Yusafat-204x300.jpg"" alt="""" width=""204"" height=""300"" class=""alignnone size-medium wp-image-1766"" />"
26;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=1002"">GANES LUTFI TENTIPRATIWI., S.Farm.,Apt</a>";KENDAL, 2 FEBRUARI 1992;PEREMPUAN;INDONESIA/ISLAM;;;BELUM KAWIN;;;S1 FARMASI LULUS TAHUN 2018;PROFESI APOTEKER LULUS TAHUN 2019;;LABORAN;DK. REJOSARI RT.7 RW.3 MOROREJO, KALIWUNGU, KENDAL;1 AGUSTUS 2020;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/09/GANES-197x300.jpg"" alt="""" width=""204"" height=""300"" class=""alignnone size-medium wp-image-1766"" />"
27;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=2664"">Rendi Adiansa, S.Tr.Kes</a>";LUMAJANG,12 JANUARI 1997;LAKI - LAKI;INDONESIA/ISLAM;;;BELUM KAWIN;;;D4- REKAM MEDIS LULUS TAHUN 2019;;;TENAGA PENDIDIK;	JL. BRAWIJAYA 2 RT 11/RW 3 DESA TEMPEH LOR, KECAMATAN TEMPEH KAB. LUMAJANG, JAWA TIMUR;31 AGUSTUS 2020;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2020/08/10-FOTO-200x300.jpg"" alt="""" width=""204"" height=""300"" class=""alignnone size-medium wp-image-1766"" />"
28;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=2610"">Feliadewi Ruth ,S.Farm</a>";SURABAYA, 10 OKTOBER 1998;PEREMPUAN;INDONESIA/KRISTEN;;;BELUM KAWIN;;;S1 FARMASI LULUS TAHUN 2020;;;Laboran Farmasi;JL. S. SUPRIADI IV/2292 RT.3/RW.6 KEC. SUKUN KEL.SUKUN MALANG;1 SEPTEMBER 2020;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2020/08/Feliadewi-Ruth-biru-4x6-200x300.jpg"" alt="""" width=""200"" height=""300"" class=""alignnone size-medium wp-image-2637"" />"
29;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=2717"">SERTIFIKAT Dimas Aulis Savitri, S.ST</a>";BANGKALAN, 16 MAI 1996;PEREMPUAN;INDONESIA / ISLAM;;;BELUM KAWIN;;;D4 REKAM MEDIS  TAHUN 2018;;;DOSEN;Jl. Tanjung putra yudha III , no 35 , Sukun;1 MARET 2021;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2021/04/Foto-dimas-214x300.jpg"" alt="""" width=""214"" height=""300"" class=""alignnone size-medium wp-image-2725"" />"
30;1351/A;"<a href= ""http://66.96.237.9/pegawaistks/?page_id=57"">Maria Magdalena Setyaningsih, Ns. Sp. Kep. Mat</a>";MALANG, 12 FEBRUARI 1970;PEREMPUAN;INDONESIA / KATOLIK;PENATA / PELAKSANA;III/c;KAWIN;JOHAN GUNAWAN;AKPER LULUS THN. 1991;S1 KEPERAWATAN LULUS TAHUN 2000;MAGISTER KEPERAWATAN LULUS TAHUN 2012;SPESIALIS KEPERAWATAN MATERNITAS THN 2013;DOSEN NERS;JL. KENDALSARI BARAT IB NO.6 RT.3 RW.9  LOWOKWARU;07 JANUARI 1992;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/06/Maria-Magdalena-Setyaningsih-Ns.-Sp.-Kep.-Mat-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-441"" />"
31;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=93"">Ns. Kristianto Dwi Nugroho, S.Kep</a>";"KAB. SEMARANG, 26 MEI 1992 ";LAKI - LAKI;INDONESIA / KRISTEN;;;KAWIN;;;S1 KEPERAWATAN LULUS THN.  2015;NERS LULUS TAHUN 2016;S2 KEPERAWATAN LULUSTAHUN 2019;DOSEN S1 KEPERAWATAN;"DUSUN DUKUHAN RT.14 RW. 03 DS. SUGIHAN KEC. TENGARAN ";01 OKTOBER 2018;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/06/Kristianto-Dwi-Nugroho-S.Kep_.-Ns-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-437"" />"
32;2019.01.26/STIKes;"<a href=""http://66.96.237.9/pegawaistks/?page_id=699"">Ida Ayu Preharsini Kusuma,S.Si., M.Biotech</a>";"<a href=""http://66.96.237.9/pegawaistks/?page_id=699"">Ida Ayu Preharsini Kusuma,S.Si., M.Biotech</a>";PEREMPUAN;INDONESIA/ HINDU;;;KAWIN;;;S1 SAINS (KIMIA) LULUS TAHUN 2014;;S2 BIOTEKNOLOGI THN. 2017;DOSEN FARMASI;Jl. THAMRIN NO.65, PEMEDILAN, PEMECUTAN, DENPASAR BARAT, DENPASAR;01 APRIL 2019;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/08/2.-Pas-Foto-4x6_Ida-Ayu-Preharsini-K-201x300.jpg"" alt="""" width=""201"" height=""300"" class=""alignnone size-medium wp-image-1538"" />"
33;;"<a href="" http://66.96.237.9/pegawaistks/?page_id=103"">Richard One Maxelly, S.ST</a>";PROBOLINGGO, 14 DESEMBER 1990;LAKI - LAKI;INDONESIA/ ISLAM;;;KAWIN;;;D4 REKAM MEDIS  TAHUN 2013;;;LABORAN;JL. MT. HARYONO GG XII NO. 8D, JATI, PROBOLINGGO;01 MEI 2019;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/08/Foto_Richard-One-205x300.jpg"" alt="""" width=""205"" height=""300"" class=""alignnone size-medium wp-image-1232"" />"
34;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=1002"">Ganes Lutfi Tentipratiwi., S.Farm.,Apt</a>";KENDAL, 2 FEBRUARI 1992;PEREMPUAN;INDONESIA/ ISLAM;;;BELUM KAWIN;;;S1 FARMASI LULUS TAHUN 2018;PROFESI APOTEKER LULUS TAHUN 2019;;LABORAN;DK. REJOSARI RT.7 RW.3 MOROREJO, KALIWUNGU, KENDAL;01 JULI 2019;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/09/GANES-197x300.jpg"" alt="""" width=""197"" height=""300"" class=""alignnone size-medium wp-image-1602"" />"
35;;"<a href="" http://66.96.237.9/pegawaistks/?page_id=1014"">Ellyvina Setya Dhini, S.Si., M.Farm., Apt</a>";MALANG, 13 MEI 1967;PEREMPUAN;INDONESIA/ ISLAM;;;KAWIN;;;"S1 FARMASI LULUS TAHUN ";PROFESI APOTEKER LULUS TAHUN 1995;S2 FARMASI KLINIS THN.2019;DOSEN FARMASI;BUMI MONDOROKO RAYA M II NO. 2 SINGOSARI MALANG;01 JULI 2019;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/09/Foto-Elyvina_Almamater-201x300.jpg"" alt="""" width=""201"" height=""300"" class=""alignnone size-medium wp-image-1597"" />"
36;2019.01.29/STIKes;"<a href=""http://66.96.237.9/pegawaistks/?page_id=1028"">Ns. Ucip Sucipto, M.Kep., Sp.K.MB</a>";BREBES, 30 AGUSTUS 1986;LAKI - LAKI;INDONESIA/ ISLAM;;;KAWIN;;;S1 KEPERAWATAN LULUS TAHUN  2009;NERS LULUS TAHUN  2010;Spesialis KMB Lulus Tahun 2018;"DOSEN NERS ";Jl. Hasanudin No.179 RT 02 RW 04 Kel.Gajah Redjo Kec.Gedangan;"01 JULI 2019 ";"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/08/Foto_Ucip-210x300.jpg"" alt="""" width=""210"" height=""300"" class=""alignnone size-medium wp-image-1097"" />"
37;2019.01.30/STIKes;"<a href=""http://66.96.237.9/pegawaistks/?page_id=1033"">Ns. Dyah Untari, M.Kep., Sp.K.MB</a>";JAKARTA, 28 DESEMBER 1979;PEREMPUAN;INDONESIA/ ISLAM;;;KAWIN;;D3 KEPERAWATAN TAHUN 2001;S1 KEPERAWATAN LULUS TAHUN  2005;NERS LULUS THN  2006;Spesialis KMB Lulus Tahun 2018;DOSEN NERS;Jl.H. Muchtar Blok A-9 RT.07 RW.03 Kel. Duri Kosambi Kec. Cengkareng;"01 JULI 2019 ";"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/09/FOTO-4-X-6-DIAH-1-200x300.jpg"" alt="""" width=""200"" height=""300"" class=""alignnone size-medium wp-image-1598"" />"
38;2017.02.18/AKP;"<a href="" http://66.96.237.9/pegawaistks/?page_id=129"">Margaretha Ana Pertiwi, SE</a>";MALANG, 3 MARET 1992;PEREMPUAN;INDONESIA / KATOLIK;PENATA MUDA / PELAKSANA;III/a;KAWIN;;;S1 EKONOMI AKUNTANSI 2014;;;ADMINISTRASI;KRAJAN WETAN RT.01 RW.06 PURWOREJO - DONOMULYO;02 MEI 2016;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/06/Margaretha-Ana-S.E-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-440"" />"
39;2018.02.23/AKP;"<a href=""http://66.96.237.9/pegawaistks/?page_id=131"">Rensy Tejowati Prabowo, SE</a>";MALANG, 28 FEBRUARI 1993;PEREMPUAN;INDONESIA / KATOLIK;PENATA MUDA / PELAKSANA;III/a;KAWIN;;;S1 AKUNTANSI LULUS TAHUN 2015;;;ADMINISTRASI;PERUM TUMPANG PERMAI BLOK O NO. 8 RT.14 RW.04 KEL JERU KEC. TUMPANG;03 APRIL 2017;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/06/Rensy-Tejowati-P.-S.E-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-452"" />"
40;;"<a href="" http://66.96.237.9/pegawaistks/?page_id=1523"">Fransiskus Eldo Kurniawan, S.E</a>";BLITAR, 2 DESEMBER 1996;LAKI -LAKI;INDONESIA / KATOLIK;;;BELUM KAWIN;;;S1 EKONOMI;;;ADMINISTRASI;JL. IR. SOEKARNO NO 188 003/011, BENDOGERIT, SANAWETAN, BLITAR;2019;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/09/foto-fransiskus-eldo-200x300.jpeg"" alt="""" width=""200"" height=""300"" class=""alignnone size-medium wp-image-1600"" />"
41;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=1576"">Ns. Nadia Oktiffiany, M.Kep</a>";"MALANG, 30 OKTOBER 1993 ";PEREMPUAN;INDONESIA / ISLAM;;;KAWIN;;;"S1 Keperawatan Lulus Thn 2015 ";"Ners Tahun 2016 ";"S2 Keperawatan Tahun 2019 ";DOSEN S1 KEPERAWATAN;JL. KENDALSARI BARAT IB NO.6 RT.3 RW.9  LOWOKWARU;2019;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2019/09/Foto_Nadia-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""size-medium wp-image-1581"" />"
42;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=2578"">Rosalia Sarry Assari, S.Pd.</a>";Sei Lawak, 18 November 1996;PEREMPUAN;INDONESIA / KATHOLIK;;;BELUM KAWIN;;;S1 PENDIDIKAN BAHASA INGGRIS LULUS TAHUN 2019;;;ADMINISTRASI;JALAN BENDUNGAN WONOGIRI NO.25;2 JANUARI 2020;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2020/06/Screenshot_2-224x300.jpg"" alt="""" width=""224"" height=""300"" class=""alignnone size-medium wp-image-2573"" />"
43;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=2587"">Akwila Yudhia Gustanto, S.Kom</a>";Pamekasan, 30 Agustus 1992;LAKI - LAKI;INDONESIA / KRISTEN;;;BELUM KAWIN;;;S1 IT LULUS TAHUN 2015;;;STAF IT;erum Genteng Kali Indah II/ No 7, JL Veteran Muda, Pamekasan Madura;1 FEBRUARI 2020;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2020/06/Screenshot_3.jpg"" alt="""" width=""147"" height=""197"" class=""alignnone size-full wp-image-2585"" />"
44;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=2595"">Mamiek Wilastri, A.Md.Farm</a>";Pasuruan, 15 Februari 1979;PEREMPUAN;INDONESIA / ISLAM;;;KAWIN;;D3 Farmasi Lulus Tahun 2008;;;;LABORAN FARMASI;JALAN SIMPANG KH YUSUF BLOK A-8, TASIKMADU, LOWOKWARU MALANG;1 MARET 2020;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2020/06/Screenshot_4.jpg"" alt="""" width=""141"" height=""220"" class=""alignnone size-full wp-image-2592"" />"
45;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=2664"">Rendi Adiansa, S.Tr.Kes</a>";LUMAJANG,12 JANUARI 1997;LAKI - LAKI;NDONESIA / ISLAM;;;BELUM KAWIN;;;D4 REKAM MEDIS  TAHUN 2019;;;DOSEN;L. BRAWIJAYA 2 RT 11/RW 3 DESA TEMPEH LOR, KECAMATAN TEMPEH KAB. LUMAJANG, JAWA TIMUR;19 AGUSTUS 2020;
46;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=2610"">Feliadewi Ruth ,S.Farm</a>";SURABAYA, 10 OKTOBER 1998;PEREMPUAN;INDONESIA/KRISTEN;;;BELUM KAWIN;;;S1 FARMASI LULUS TAHUN 2020;;;LABORAN FARMASI;JL. S. SUPRIADI IV/2292 RT.3/RW.6 KEC. SUKUN KEL.SUKUN MALANG;1 SEPTEMBER 2020;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2020/08/Feliadewi-Ruth-biru-4x6-200x300.jpg"" alt="""" width=""200"" height=""300"" class=""alignnone size-medium wp-image-2637"" />"
47;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=2717"">SERTIFIKAT Dimas Aulis Savitri, S.ST</a>";BANGKALAN, 16 MAI 1996;PEREMPUAN;INDONESIA / ISLAM;;;BELUM KAWIN;;;D4 REKAM MEDIS  TAHUN 2018;;;DOSEN;Jl. Tanjung putra yudha III , no 35 , Sukun;1 MARET 2021;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2021/04/Foto-dimas-214x300.jpg"" alt="""" width=""214"" height=""300"" class=""alignnone size-medium wp-image-2725"" />"
;;;"<a href=""http://66.96.237.9/pegawaistks/?page_id=153"">Muhhammad Dudayev Caesar Putra, S.St</a>";Jember, 14 AGUSTUS1995;LAKI - LAKI;INDONESIA / ISLAM;;;BELUM KAWIN;;;S1 REKAM MEDIS  TAHUN 2018;;;DOSEN;Jalan Citarum II/62 Link Wetan Kantor, Jemberlor, Patrang;18 APRIL 2022;"<img src=""http://66.96.237.9/pegawaistks/wp-content/uploads/2022/10/Foto-200x300.jpg"" alt="""" width=""200"" height=""300"" class=""alignnone size-medium wp-image-2744"" />"
CSV;

        // Parse CSV string using PHP's native parser
        $lines = explode("\n", trim($csvData));

        $departmentsMap = [];
        $positionsMap = [];

        // Pre-fetch existing departments and positions to prevent duplicate creation
        foreach (Department::all() as $d) {
            $departmentsMap[$d->name] = $d;
        }
        foreach (Position::all() as $p) {
            $positionsMap[$p->name] = $p;
        }

        foreach ($lines as $line) {
            if (empty(trim($line))) continue;
            
            // Delimiter is semicolon
            $row = str_getcsv($line, ';');
            if (count($row) < 17) continue;

            $nip = trim($row[1]);
            $rawName = trim($row[2]);
            $birthStr = trim($row[3]);
            $genderStr = trim($row[4]);
            $bangsaAgama = trim($row[5]);
            $pangkat = trim($row[6]);
            $golongan = trim($row[7]);
            $maritalStr = trim($row[8]);
            $spouseName = trim($row[9]);
            $d3 = trim($row[10]);
            $s1 = trim($row[11]);
            $profesi = trim($row[12]);
            $s2 = trim($row[13]);
            $deptName = trim($row[14]);
            $address = trim($row[15]);
            $joinDateStr = trim($row[16]);
            $imageHtml = trim($row[17] ?? '');

            // Clean Name
            $fullName = strip_tags($rawName);
            if (empty($fullName)) continue;

            // If NIP is empty, set to null
            if (empty($nip)) {
                $nip = null;
            }

            // Parse Birth Place and Date
            $birthPlace = null;
            $birthDate = null;
            if (!empty($birthStr) && !str_contains($birthStr, 'page_id')) {
                $parts = explode(',', $birthStr);
                $birthPlace = trim($parts[0]);
                if (isset($parts[1])) {
                    $birthDate = $this->parseIndonesianDate(trim($parts[1]));
                }
            }

            // Extract Religion from "INDONESIA / KATOLIK"
            $religion = 'ISLAM';
            if (!empty($bangsaAgama)) {
                $parts = explode('/', $bangsaAgama);
                if (isset($parts[1])) {
                    $religion = trim($parts[1]);
                } else {
                    $religion = trim($parts[0]);
                }
            }

            // Resolve Department
            if (empty($deptName)) {
                $deptName = 'Umum';
            }
            $deptName = str_replace('"', '', trim($deptName));
            if (!isset($departmentsMap[$deptName])) {
                $baseCode = strtoupper(substr(preg_replace('/[^A-Za-z0-9]/', '', $deptName), 0, 6));
                $code = $baseCode ?: 'DEPT';
                $counter = 1;
                while (Department::where('code', $code)->exists()) {
                    $code = substr($baseCode, 0, 4) . $counter;
                    $counter++;
                }
                $departmentsMap[$deptName] = Department::create([
                    'name' => $deptName,
                    'code' => $code,
                    'is_active' => true,
                ]);
            }
            $dept = $departmentsMap[$deptName];

            // Resolve Position
            $jobTitle = $pangkat ?: 'Staf';
            if ($jobTitle === 'Staf' && !empty($deptName)) {
                $jobTitle = 'Staf ' . $deptName;
            }
            if (!isset($positionsMap[$jobTitle])) {
                $baseCode = strtoupper(substr(preg_replace('/[^A-Za-z0-9]/', '', $jobTitle), 0, 6));
                $code = $baseCode ?: 'POS';
                $counter = 1;
                while (Position::where('code', $code)->exists()) {
                    $code = substr($baseCode, 0, 4) . $counter;
                    $counter++;
                }
                $positionsMap[$jobTitle] = Position::create([
                    'name' => $jobTitle,
                    'code' => $code,
                    'department_id' => $dept->id,
                    'is_active' => true,
                ]);
            }
            $position = $positionsMap[$jobTitle];

            // Gender
            $gender = 'L';
            $genderStrLower = strtolower($genderStr);
            if (str_contains($genderStrLower, 'perempuan') || $genderStrLower === 'p') {
                $gender = 'P';
            }

            // Marital Status
            $maritalStatus = 'belum_menikah';
            $maritalStrLower = strtolower($maritalStr);
            if (str_contains($maritalStrLower, 'kawin') && !str_contains($maritalStrLower, 'belum')) {
                $maritalStatus = 'menikah';
            }

            // Extract image URL if exists
            $photoPath = null;
            if (!empty($imageHtml) && preg_match('/src="([^"]+)"/', $imageHtml, $imgMatches)) {
                $photoPath = $imgMatches[1];
            }

            // Join Date
            $joinDate = $this->parseJoinDate($joinDateStr);

            // Determine employment status based on NIP presence in CSV
            $employmentStatus = empty($nip) ? 'kontrak' : 'tetap';

            // Create Employee with status inactive
            $employee = Employee::create([
                'nik' => $nip,
                'full_name' => $fullName,
                'birth_place' => $birthPlace,
                'birth_date' => $birthDate,
                'gender' => $gender,
                'address' => $address ?: null,
                'phone' => null,
                'email' => null,
                'photo' => null,
                'employment_status' => $employmentStatus,
                'department_id' => $dept->id,
                'position_id' => $position->id,
                'work_location' => 'Kampus STIKes Panti Waluya Malang',
                'join_date' => $joinDate,
                'marital_status' => $maritalStatus,
                'notes' => "Agama: $religion" . ($golongan ? " | Golongan: $golongan" : ""),
                'status' => 'inactive',
            ]);

            // Add Spouse (Keluarga) if married and spouse name provided
            if ($maritalStatus === 'menikah' && !empty($spouseName)) {
                EmployeeFamily::create([
                    'employee_id' => $employee->id,
                    'relation' => 'pasangan',
                    'full_name' => $spouseName,
                    'birth_date' => null,
                    'occupation' => null,
                    'is_dependent' => true,
                ]);
            }

            // Add Educations
            if (!empty($d3) && $d3 !== '-') {
                $this->createEducationRecord($employee->id, 'D3', $d3);
            }
            if (!empty($s1) && $s1 !== '-') {
                $this->createEducationRecord($employee->id, 'S1', $s1);
            }
            if (!empty($profesi) && $profesi !== '-') {
                $this->createEducationRecord($employee->id, 'S1', $profesi);
            }
            if (!empty($s2) && $s2 !== '-') {
                $this->createEducationRecord($employee->id, 'S2', $s2);
            }

            // Create ResignationDetail
            $resignDate = $joinDate ? Carbon::parse($joinDate)->addYears(2)->format('Y-m-d') : now()->subMonths(6)->format('Y-m-d');
            $reason = ($employmentStatus === 'kontrak') ? 'habis_kontrak' : 'resign_mandiri';
            ResignationDetail::create([
                'employee_id' => $employee->id,
                'resignation_date' => $resignDate,
                'reason' => $reason,
                'reason_detail' => 'Data diimpor dari daftar riwayat pegawai non-aktif.',
                'clearance_status' => 'completed',
                'clearance_notes' => 'Penyelesaian aset dan administrasi selesai.',
                'clearance_date' => $resignDate,
            ]);

            // Soft delete the employee with deleted_at matching resignation_date
            $employee->deleted_at = $resignDate;
            $employee->save();
        }
    }

    private function parseIndonesianDate(string $dateStr): ?string
    {
        $months = [
            'januari' => '01', 'februari' => '02', 'maret' => '03', 'april' => '04',
            'mei' => '05', 'juni' => '06', 'juli' => '07', 'agustus' => '08',
            'september' => '09', 'oktober' => '10', 'november' => '11', 'nopember' => '11', 'desember' => '12'
        ];

        $dateStr = strtolower(trim($dateStr));
        $parts = preg_split('/\s+/', $dateStr);

        if (count($parts) === 3) {
            $day = str_pad($parts[0], 2, '0', STR_PAD_LEFT);
            $monthName = $parts[1];
            $year = $parts[2];

            $month = $months[$monthName] ?? '01';
            return "$year-$month-$day";
        }

        return null;
    }

    private function parseJoinDate(string $dateStr): ?string
    {
        $dateStr = trim($dateStr);
        if (empty($dateStr)) return null;

        // Try standard formats
        try {
            $carbon = Carbon::parse($dateStr);
            return $carbon->format('Y-m-d');
        } catch (\Exception $e) {
            $parsed = $this->parseIndonesianDate($dateStr);
            if ($parsed) return $parsed;

            if (is_numeric($dateStr) && strlen($dateStr) === 4) {
                return "$dateStr-01-01";
            }
        }

        return null;
    }

    private function createEducationRecord(int $employeeId, string $level, string $eduText): void
    {
        EmployeeEducation::create([
            'employee_id' => $employeeId,
            'level' => $level,
            'institution' => $eduText,
            'graduation_year' => $this->extractYear($eduText) ?: null,
        ]);
    }

    private function extractYear(string $text): ?int
    {
        if (preg_match('/\b(19|20)\d{2}\b/', $text, $matches)) {
            return (int)$matches[0];
        }
        return null;
    }
}
