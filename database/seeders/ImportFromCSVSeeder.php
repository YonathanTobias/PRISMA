<?php

namespace Database\Seeders;

use App\Models\Department;
use App\Models\Position;
use App\Models\User;
use App\Models\Employee;
use App\Models\EmployeeEducation;
use App\Models\EmployeeFamily;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Carbon\Carbon;

class ImportFromCSVSeeder extends Seeder
{
    public function run(): void
    {
        // 1. Clear existing dynamic tables disabling foreign keys for MySQL compatibility
        Schema::disableForeignKeyConstraints();
        Employee::truncate();
        Department::truncate();
        Position::truncate();
        EmployeeEducation::truncate();
        EmployeeFamily::truncate();
        Schema::enableForeignKeyConstraints();

        $csvData = <<<'CSV'
NIP,NAMA PEGAWAI,"TEMPAT, TANGGAL LAHIR",ALAMAT,BAGIAN,JENIS KELAMIN,AGAMA,PANGKAT/JABATAN,GOLONGAN,KAWIN,SUAMI/ISTRI,D3,S1,PROFESI,S2,MASUK BEKERJA,IMAGE
1283/A,"<a href=""http://66.96.237.13/pegawaistks/?page_id=54"">Wibowo, S.Kep., Ns. M.Biomed</a>","Malang, 7 Oktober 1967",PERUM GRAHA JATIMULYA KAV 21 RT.3 RW.6 JL. SAXOPHONE,DOSEN,Laki Laki,KATOLIK,PENATA/PELAKSANA,III/c,KAWIN,Cetty Lellyani,AKPER LULUS THN. 1989,S1 KEPERAWATAN LULUS TAHUN 2001,NERS LULUS TAHUN 2002,MAGISTER BIOMEDIK THN 2014,01-Nov-90,"<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Wibowo-S.Kep_.-Ns.-M.-Biomed-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-455"" />"
1089/A,"<a href=""http://66.96.237.13/pegawaistks/?page_id=59"">Emy Sutiyarsih, S.Kep., Ns., M.Kes</a>","BANGREJO, 23 OKTOBER 1967",DE CASABLANCA RESIDENCE BLOK C6 NO.43 RT.5 RW.5 KEDUNGKANDANG,DOSEN,PEREMPUAN,KATOLIK,PENATA/PELAKSANA,III/c,KAWIN,ANTONIUS TRIYUDA EKA. P,AKPER LULUS TAHUN 1992,S1 KEPERAWATAN TAHUN 2007,NERS LULUS TAHUN 2008,MAGISTER KESEHATAN TAHUN 2012,01 AGUSTUS 1987,"<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Emy-Sutiyarsih-S.Kep_.-Ns.-M.Kes_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-429"" />"
1674/A,"<a href=""http://66.96.237.13/pegawaistks/?page_id=61"">Ns. Monika Luhung, S.Kep., M.Kes</a>","UJOH BILANG, 15 NOVEMBER 1965",JL. SIMPANG IJEN NO. 37 RT.6 RW.10 MALANG,DOSEN,PEREMPUAN,KATOLIK,PENATA MUDA/PELAKSANA,III/a,KAWIN,HUPITOYO,AKPER LULUS TAHUN 2005,S1 KEPERAWATAN LULUS TAHUN 2011,NERS LULUS TAHUN 2012,MAGISTER KESEHATAN TAHUN 2018,16-Sep-97,"<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Monika-Luhung-S.Kep_.-M.Kep_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-444"" />"
1778/A,"<a href=""http://66.96.237.13/pegawaistks/?page_id=63"">Ns. Nanik Dwi Astutik, S.Kep., M.Kes</a>","MALANG, 29 DESEMBER 1979",PERUM GREEN LIVING BLOK B/11 A JL. SATSUI TUBUN RT.03 RW.06 GADANG,DOSEN,PEREMPUAN,KRISTEN,PENGATUR TK.I/PELAKSANA,II/d,KAWIN,EDY OKTA LEVENCIA,AKPER LULUS TAHUN 2001,S1 KEPERAWATAN LULUS TAHUN 2009,NERS TAHUN 2010,MAGISTER KESEHATAN2017,02 JANUARI 2002,"<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Nanik-Dwi-Astutik-S.Kep_.-M.Kes_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-445"" />"
1780/A,"<a href=""http://66.96.237.13/pegawaistks/?page_id=65"">Ns. Ellia Ariesti, S.Kep., M.Kep</a>","BLITAR, 10 APRIL 1980",JL. KEPUH GG VII A NO.26 RT.5 RW.5 MALANG,DOSEN,PEREMPUAN,KATOLIK,PENGATUR TK.I/PELAKSANA,II/d,KAWIN,NANANG SUDIRO FITRIANTO,AKPER LULUS TAHUN 2001,S1 KEPERAWATAN LULUS TAHUN 2009,NERS LULUS TAHUN 2010,MAGISTER KEPERAWATAN TAHUN 2017,02 JANUARI 2002,"<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Ellia-Ariesti-S.Kep_.-M.Kep_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-428"" />"
01/A/AKP,"<a href=""http://66.96.237.13/pegawaistks/?page_id=67"">Wisoedhanie Widi Anugrahanti, SKM., M.Kes</a>","MALANG, 6 NOVEMBER 1978",JL. GATOT SUBROTO I/36 SEDAYU - TUREN,DOSEN,PEREMPUAN,ISLAM,PENATA /PELAKSANA,III/c,KAWIN,HERMAN SETYAWAN,,S1 KESEHATAN MASYARAKAT 2002,,MAGISTER KEPERAWATAN TAHUN 2017,03 FEBRUARI 2003,"<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Wisoedhanie-Widi-A.-SKM.-M.Kes_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-457"" />"
05/A/AKP,"<a href=""http://66.96.237.13/pegawaistks/?page_id=69"">Ns. Oda Debora, S.Kep., M.Kep</a>","MALANG, 29 APRIL 1985",JL. IKAN MAS 1 NO. 3 RT.1 RW.7 LOWOKWARU MALANG,DOSEN,PEREMPUAN,KATOLIK,PENATA MUDA/PELAKSANA,III/a,KAWIN,ANDREAS PATRIA WIBISANA,,S1 KEPERAWATAN TAHUN 2007,NERS LULUS TAHUN 2008,MAGISTER KEPERAWATAN TAHUN 2016,01-Nov-08,"<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Oda-Debora-S.Kep_.-M.Kep_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-449"" />"
08/A/AKP,"<a href=""http://66.96.237.13/pegawaistks/?page_id=71"">ELI LEA WIDHIA PURWANDHANI , SST</a>","KEDIRI, 13 FEBRUARI 1984",ASRAMA YONKAV 3 / TANK RANDUAGUNG SINGOSARI MALANG,DOSEN,PEREMPUAN,KRISTEN,,,KAWIN,,D IV KEBIDANAN LULUS TAHUN 2008,,,,01 MEI 2012,"<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Eli-Lea-Widhia-P.-S.ST_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-426"" />"
09/A/AKP,"<a href=""http://66.96.237.13/pegawaistks/?page_id=73"">Ns. IFA PANNYA SAKTI, S.Kep.,M.Kep</a>","BLITAR , 01 OKTOBER 1986",DSN. BUNENG RT.1 RW.2 DS. BORO KEC. SELOREJO BLITAR,DOSEN,PEREMPUAN,BUDHA,,,KAWIN,DARWANTO,,S1 KEPERAWATAN LULUS TAHUN 2011,NERS LULUS TAHUN 2012,,01 MEI 2012,"<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Ifa-Pannya-Sakti-S.Kep_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-433"" />"
10/A/AKP,"<a href=""http://66.96.237.13/pegawaistks/?page_id=75"">Ns. FEBRINA SECSARIA HANDINI, S.Kep.,M.Kep</a>",MALANG 12 FEBRUARI 1986,JL. JALAK NO.23 RT.03 RW. 08 MALANG,S1 Farmasi,PEREMPUAN,KRISTEN,,,KAWIN,ANDREAS,,S1 KEPERAWATAN 2011,NERS LULUS TAHUN 2012,,01 MEI 2012,"[caption id=""attachment_1093"" align=""alignnone"" width=""233""]<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/08/Ns.-Febrina-Secsaria-Handini-S.Kep_-233x300.jpg"" alt="""" width=""233"" height=""300"" class=""size-medium wp-image-1093"" /> SONY DSC[/caption]"
"11/A/AKP","<a href=""http://66.96.237.13/pegawaistks/?page_id=77"">Ns. BERLIANNY VENNY SIPOLLO, S.Kep.,.,M.Kep MNS</a>","MALUKU, 03 AGUSTUS 1990","JL. BENDUNGAN LAHOR 42 RT.011 RW.002 KEL.KARANGKATES KEC. SUMBERPUCUNG","TENAGA PENGAJAR",PEREMPUAN,KATOLIK,,"III/a","BELUM KAWIN",,,S1 KEPERAWATAN LULUS THN. 2013,"NERS LULUS TAHUN 2014",,"01 SEPTEMBER 2014","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Berliany-Venny-S.-S.Kep_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-423"" />"
"2017.01.16.AKP","<a href=""http://66.96.237.13/pegawaistks/?page_id=79"">Ns. YUSTINA EMI SETYOBUDI, S.Kep.,M.Kep</a>","MALANG, 2 MEI 1985","Dsn. Tlogo Rt.19 Rw.02 Tlogosari - Donomulyo - Malang","DOSEN","PEREMPUAN",KATOLIK,,," KAWIN",,,S1 KEPERAWATAN LULUS THN. 2011,"NERS LULUS TAHUN 2012",,"02 JANUARI 2015","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Yustina-Emi-S.-S.Kep_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-461"" />"
"2016.01.14/AKP","<a href=""http://66.96.237.13/pegawaistks/?page_id=81"">Ns. MARIA PRIESKA PUTRI PANGLIPUR ATI, S.Kep.,M.Kep</a>","KAB. SEMARANG, 25 MARET 1990","DSN. KAMPUNG RAPET I/III KEC. BANYUBIRU ","DOSEN","PEREMPUAN",KATOLIK,,,"BELUM KAWIN",,,S1 KEPERAWATAN LULUS THN.  2013,"NERS LULUS TAHUN 2014",,"02 JANUARI 2015","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Maria-Prieska-P.P.A.-S.Kep_.-Ns-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-442"" />"
"2016.01.15.AKP","<a href=""http://66.96.237.13/pegawaistks/narita-diatanti-amd-kep/"">NARITA DIATANTI, Amd.Kep</a>","MALANG, 26 AGUSTUS 1989","JL. W.R. SUPRATMAN RT.002 RW.004 TANGGUNG - TUREN - MALANG","TENAGA KEPENDIDIKAN","PEREMPUAN",KRISTEN,,,"BELUM KAWIN",,"DIII KEPERAWATAN LULUS THN 2010",,,,"01 JUNI 2015","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Narita-Diatanti-Amd.Kep_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-446"" />"
"2017.01.17/AKP","<a href=""http://66.96.237.13/pegawaistks/ns-achmad-syukkur-s-kep/"">Ns. ACHMAD SYUKKUR, S.Kep</a>","BANGKALAN, 17 NOVEMBER 1990","JL. LAKS MARTADINATA 14 RT.14 RW.02 KOTALAMA KEDUNGKANDANG","TENAGA KEPENDIDIKAN","LAKI - LAKI",ISLAM,,,"KAWIN","DESY AYU VIRANA",,"S1 KEPERAWATAN LULUS THN 2015","NERS LULUS TAHUN 2016",,"02 MEI 2016","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/08/pak-syukur-225x300.jpg"" alt="""" width=""225"" height=""300"" class=""alignnone size-medium wp-image-1094"" />"
"2018.01.24/STIKes","<a href=""http://66.96.237.13/pegawaistks/yafet-pradikatama-prihanto-s-kep-ns/"">YAFET PRADIKATAMA PRIHANTO, S.Kep.,Ns.,M.Kep</a>","TEMANGGUNG, 9 AGUSTUS 1989","JL. PARAKAN NGADIREJO KM 04, Dsn. KARANGSENEN RT.01/04 DESA TRAJI KEC. PARAKAN KAB. TEMANGGUNG JAWA TENGAH","TENAGA PENDIDIK","LAKI - LAKI",KRISTEN,,,"KAWIN","GABRIELA WAHYU ANDHIKASARI",,S1 KEPERAWATAN LULUS TAHUN 2012,NERS LULUS TAHUN 2013,S2 KEPERAWATAN TAHUN 2018,"03 APRIL 2017","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Yafet-Pradikatama-P.-S.Kep_.-Ns-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-458"" />"
"07/A/AKP","<a href=""http://66.96.237.13/pegawaistks/ns-elizabeth-yun-yun-vinsur-m-kep/"">Ns. ELIZABETH YUN-YUN VINSUR, M.Kep</a>","MALANG, 14 JANUARI 1986","JL. SUMPIL II/8 BRT.2 RW.6  BLIMBING MALANG","DOSEN","PEREMPUAN",KATOLIK,"PENATA MUDA / PELAKSANA","III/a","BELUM KAWIN",,,"S1 KEPERAWATAN LULUS THN.  2008","NERS LULUS TAHUN 2009","MAGISTER KEPERAWATAN THN. 2018","02 JANUARI 2010 + 1 FEBRUARI 2018","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Elizabeth-Yun-Yun-S.Kep_.-M.Kep_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-427"" />"
"2022.01.46/STIKes","<a href=""http://66.96.237.13/pegawaistks/vincensia-dea-prasetya-putri-amd-kes/"">VINCENSIA DEA PRASETYA PUTRI, Amd.Kes</a>","SURABAYA, 28 SEPTEMBER 1996","JL. BANDULAN BARU 162C","LABORAN","PEREMPUAN",KATOLIK,,,"BELUM KAWIN",,"D3 RMIK LULUS TAHUN 2018",,,,"02 JANUARI 2019","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/09/foto-vincensia-dea-200x300.jpeg"" alt="""" width=""200"" height=""300"" class=""alignnone size-medium wp-image-1601"" />"
"2020.01.42/Stikes","<a href=""http://66.96.237.13/pegawaistks/devanus-lahardo-a-md-s-e-m-m/"">DEVANUS LAHARDO, A.Md., S.E., M.M</a>","BLITAR, 10 DESEMBER 1975","JL. TELUK CENDRAWASIH 95E MALANG","DOSEN","LAKI - LAKI",ISLAM,,,"KAWIN",,"D3 FARMASI LULUS TAHUN 1996","S1 MANAJEMEN LULUS TAHUN 2009",,"S2 MANAJEMEN KESEHATAN THN. 2011","01 APRIL 2019","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/09/Devanus-Lahardo-198x300.jpg"" alt="""" width=""198"" height=""300"" class=""alignnone size-medium wp-image-1595"" />"
"450/B","<a href=""http://66.96.237.13/pegawaistks/agus-widodo/"">AGUS WIDODO</a>","MALANG, 19 AGUSTUS 1975","PETUNGSEWU RT.09 RW.03 PETUNGSEWU WAGIR","PERTUKANGAN","LAKI - LAKI",ISLAM,"PENGATUR MUDA TK. I / PELAKSANA","II/b","KAWIN","NURJANATUL ALIYAH","SMP LULUS TAHUN 1992",,,,"01 DESEMBER 1995","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Agus-Widodo-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-422"" />"
"03/C/AKP.","<a href=""http://66.96.237.13/pegawaistks/yuli-hariadi-widodo/"">YULI HARIADI WIDODO</a>","MALANG, 9 JULI 1983","SUKUN MARGA BHAKTI NO. 30 RT.2 RW.10","PENGEMUDI","LAKI - LAKI",KATOLIK,,"II/a","KAWIN","MONICA DWI SIH PANGLIPUR","SMU LULUS TAHUN 2003",,,,"01 DESEMBER 2009","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Yuli-Hariadi-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-460"" />"
"427/B","<a href=""http://66.96.237.13/pegawaistks/indarti/"">INDARTI</a>","PASURUAN, 31 MEI 1979","JL. S. SUPRIYADI GG. II E NO. 8 RT.2 RW.3 MALANG","RUMAH TANGGA","PEREMPUAN",ISLAM,"PENGATUR MUDA TK. I / PELAKSANA","II/b","KAWIN","SUPRIJONO","SMP LULUS TAHUN 1994",,,,"16 MARET 1995","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Indarti-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-435"" />"
"2017.02.21/AKP","<a href=""http://66.96.237.13/pegawaistks/natalia-hendri-susanti/"">NATALIA HENDRI SUSANTI</a>","MALANG, 25 DESEMBER 1985","JL. DERKUKU SELATAN NO. 21 MALANG","RUMAH TANGGA","PEREMPUAN",KATOLIK,,,"KAWIN",,"SMA LULUS THN. 2010",,,,"01 MARET 2013","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Natalia-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-447"" />"
"04/C/AKP.","<a href=""http://66.96.237.13/pegawaistks/david-ardianto/"">DAVID ARDIANTO</a>","MALANG, 14 JULI 1982","JL. S. SUPRIYADI GG. 7 RT.6 RW.2 NO. 22 SUKUN","SATPAM","LAKI - LAKI",KRISTEN,,,"KAWIN","MARIA LILIS MEI KRISTANTI","STM LULUS THN. 2001",,,,"25 FEBRUARI 2008","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/David-Ardianto-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-424"" />"
"1675/A","<a href=""http://66.96.237.13/pegawaistks/wienda-setyowati-se/"">WIENDA SETYOWATI, SE</a>","MALANG, 30 JULI 1979","JL. MANYAR NO. 32 MALANG","ADMINISTRASI","PEREMPUAN",KATOLIK,"PENATA MUDA / PELAKSANA","III/a","KAWIN","HENGKY AGUNG KURNIAWAN","SMK LULUS TAHUN 1997","S1 AKUNTANSI LULUS TAHUN 2011",,,"16 SEPTEMBER 1997","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Wienda-Setyowati-S.E-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-456"" />"
"1685/A","<a href=""http://66.96.237.13/pegawaistks/kristina-rini-susanti/"">KRISTINA RINI SUSANTI</a>","MADIUN, 24 NOPEMBER 1979","JL. KEMANTREN I GG. SIMPANG BRAWIJAYA C-7 RT.12 RW.03 SUKUN MALANG","ADMINISTRASI","PEREMPUAN",KATOLIK,"PENGATUR TK. I / PELAKSANA","II/d","KAWIN","RIKKY SETIAWAN","SMA LULUS TAHUN 1997",,,,"15 MEI 1998","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Kristina-Rini-Susanti-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-438"" />"
"2018.02.20/AKP","<a href=""http://66.96.237.13/pegawaistks/magdalena-novitasari-dwi-susanti-amd/"">MAGDALENA NOVITASARI DWI SUSANTI, Amd</a>","MALANG, 9 NOVEMBER 1992","JL.SEMBOJA 15 RT.02 RW.03 KEL. CEPOKOMULYO KEPANJEN","AKADEMIK/KEMAHASISWAAN AKPW","PEREMPUAN",KATOLIK,"PENATA MUDA / PELAKSANA","III/a","KAWIN",,"DIII KESEKRETARIATAN LULUS TH. 2013",,,,"03 APRIL 2017","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Magdalena-Novi-Amd-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-439"" />"
"2019.02.25/STIKes","<a href=""http://66.96.237.13/pegawaistks/raswati-prapti-rahayus-st/"">RASWATI PRAPTI RAHAYU,S.ST</a>","BANYUWANGI, 26 JUNI 1993","DSN. PERSEN DS. KEDUNGASRI 15/03 KEC. TEGALDLIMO KAB.BANYUWANGI","LABORAN PRODI RM","PEREMPUAN",HINDU,"PENATA MUDA / PELAKSANA","III/a","BELUM KAWIN",,"D IV REKAM MEDIK LULUS TAHUN 2015",,,,"03 APRIL 2017","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/06/Raswati-Prapti-R.-S.ST_-199x300.jpg"" alt="""" width=""199"" height=""300"" class=""alignnone size-medium wp-image-451"" />"
"2020.02.38/Stikes","<a href=""http://66.96.237.13/pegawaistks/ferra-meladiana-s-ip/"">FERRA MELADIANA, S.IP</a>","MALANG, 09 MARET 1996","JL. KERTORAHARJO 26B MALANG","PUSTAKAWAN","PEREMPUAN",ISLAM,,,"BELUM KAWIN",,,"S1 ILMU PERPUSTAKAAN TAHUN 2018",,,"01 MARET 2019","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/09/Ferra-Meladiana-211x300.jpg"" alt="""" width=""211"" height=""300"" class=""alignnone size-medium wp-image-1596"" />"
"2020.02.39/Stikes","<a href=""http://66.96.237.13/pegawaistks/dyla-ayu-puspitasari-s-ip/"">DYLA AYU PUSPITASARI, S.IP</a>","KEDIRI, 19 SEPTEMBER 1996","DUSUN PULOREJO RT.01 RW.20 DESA KRECEK KEC. BADAS KAB. KEDIRI JATIM","PUSTAKAWAN","PEREMPUAN",ISLAM,,,"BELUM KAWIN",,,"S1 ILMU PERPUSTAKAAN TAHUN 2018",,,"01 MARET 2019","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2019/09/foto-dyla-ayu-200x300.jpeg"" alt="""" width=""200"" height=""300"" class=""alignnone size-medium wp-image-1599"" />"
,"<a href=""http://66.96.237.13/pegawaistks/?page_id=2556"">Mochamad Ali Sodikin, S.Kep, Ns.Sp.Kep.J., M.Kep.</a>","PASURUAN, 24 OKTOBER 1977","Puri Purwosari  Indah A - 14 Purwosari","DOSEN","LAKI - LAKI","ISLAM",,,"KAWIN",,"D3 KEPERAWATAN LULUS TAHUN 2002","S1 KEPERAWATAN LULUS TAHUN 2009","NERS LULUS TAHUN 2010","MAGISTER KEPERAWATAN LULUS TAHUN 2015","01-Apr-20","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2020/06/ALI-SODIKIN.jpg"" alt="""" width=""207"" height=""294"" class=""alignnone size-full wp-image-2561"" />"
"2021.01.44/STIKes","<a href=""http://66.96.237.13/pegawaistks/?page_id=2656""> Venny Kurnia Andika, S.Si, M.Biotech </a>","Pontianak, 16 Maret 1989","JL. SUTAN SYAHRIR GG KARYA 1 NO.37 BERINGIN/KAPUAS","DOSEN","PEREMPUAN","KRISTEN",,,"BELUM KAWIN",,,"S1 SARJANA SAINS lulus tahun 2011",,"S2 SARJANA BIOTECHNOLOGY lulus tahun 2018","01-Sep-20","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2020/09/Screenshot_3.jpg"" alt="""" width=""207"" height=""294"" class=""alignnone size-full wp-image-2561"" />"
"2022.01.48/STIKes","<a href=""http://66.96.237.13/pegawaistks/?page_id=2684"">Ns. Oktavia Indriyani, S.Kep</a>","Magelang, 1 Oktober 1996","Dusun Wonosari RT 4/ RW 21 Gunung Pring Muntilan","LABORAN","PEREMPUAN","KATOLIK",,,"BELUM KAWIN",,,,"S1 KEPERAWATAN LULUS TAHUN 2019","NERS LULUS TAHUN 2020",,"29-Sep-20","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2021/04/Foto-213x300.jpg"" alt="""" width=""213"" height=""300"" class=""alignnone size-medium wp-image-2676"" />"
"2021.01.45/STIKes","<a href=""http://66.96.237.13/pegawaistks/?page_id=2694"">Nita Dwi Nur Aini, S.ST., M.Kes</a>","PROBOLINGGO, 10 JUNI 1996","Jalan mastrip gang mangga no 2 RT 01 RW 04 kel. Jrebeng wetan kec. Kedopok kota probolinggo jatim","DOSEN","PEREMPUAN","ISLAM",,,"BELUM KAWIN",,,,"D4 REKAM MEDIK lulus 2018",,,"2 FEBRUARI 2021","<img src=""http://66.96.237.13/pegawaistks/wp-content/uploads/2021/04/Foto-nita-217x300.jpg"" alt="""" width=""217"" height=""300"" class=""alignnone size-medium wp-image-2700"" />"
"2023.01.49/STIKes","<a href=""http://66.96.237.13/pegawaistks/?page_id=2770"">Sirilus Deodatus Sawu, S.Farm., M.Farm</a>","Soe, 29 Maret 1996","Oekefan, RT/RW 007/003 Kota Soe Nusa Tenggara Timur","DOSEN","LAKI - LAKI","KATOLIK",,,"BELUM KAWIN",,,"S1 Farmasi Lulus Tahun 2018","Apoteker Lulus Thn 2019","S2 FARMASI LULUS TAHUN 2022","2022",
"2025.02.61/STIKes","<a href=""http://66.96.237.13/pegawaistks/?page_id=2786"">Yonathan Tobias Buttok, S.Tr.Kom</a>","Malang, 04 Januari 1999","JI. Tlogo Indah IV No. 65 RT.001 RW.002 Kelurahan Tlogomas Kecamatan Lowokwaru MALANG","STAF IT","LAKI - LAKI","KRISTEN",,,"BELUM KAWIN",,,"D4 Teknik informatika Lulus Tahun 2021",,,"2022",
"2024.02.54/STIKes","<a href=""http://66.96.237.13/pegawaistks/?page_id=2801"">Atanasius Omega Dewantara, SE</a>","Malang,02 Mei 1999","Perum Griya Asri Blok T-2 RT.09 RW.04 Kel.Pandanwangi Kec. Blimbing - MALANG","ADMINISTRASI","LAKI - LAKI","KATOLIK",,,"BELUM KAWIN",,,"S1 Manajemen Lulus Tahun 2021",,,"2022",
"2023.01.55/STIKes","<a href=""http://66.96.237.13/pegawaistks/?page_id=2819"">Yushinta Elsa Valina, S.Farm</a>","Malang, 20 Agustus 1999","JI. Tlogo Indah IV No. 65 RT.001 RWSUMBER WUNI GG MANGGA 304, KALIREJO, LAWANG","LABORAN FARMASI","PEREMPUAN","KRISTEN",,,"BELUM KAWIN",,,"S1 Farmasi Lulus Tahun 2022",,,"2022",
"2025.01.59/STIKes","<a href=""http://66.96.237.13/pegawaistks/?page_id=2833"">Nancy Ratu Jovancha Laurentza, S.Far</a>","Malang, 25 November 1998","Jl. Hasanudin rt 03 rw 08 Junrejo, Batu","LABORAN FARMASI","PEREMPUAN","KRISTEN",,,"BELUM KAWIN",,,"S1 Farmasi Lulus Tahun 2022",,,"2022",
"2023.01.51/STIKes","<a href=""http://66.96.237.13/pegawaistks/?page_id=2837"">Bhre Diansyah D.K.,S.Tr.Kes.,M.K.M</a>","Lumajang, 26 Februari 1998","Perumnas Jatiroto RT.06/ RW.07 Lumajang","DOSEN MIK","LAKI - LAKI","ISLAM",,,"KAWIN",,,"D4 REKAM MEDIS Lulus Tahun 2020",,"S2 ILMU KESEHATAN MASYARAKAT LULUS TAHUN 2022","2022",
"2023.01.50/STIKes","Moh. Maulana,  S.Tr.Kes.,M.K.M","Jember, 21 Juli 1997",,"DOSEN MIK","LAKI - LAKI","ISLAM",,,"BELUM KAWIN",,,"D4 REKAM MEDIS Lulus Tahun 2020",,"S2 ILMU KESEHATAN MASYARAKAT LULUS TAHUN 2022","2022",
"2024.01.57/STIKes","Jeffry Atur Firdaus, S.T., M.Kom","Pasuruan, 29 Oktober 1998",,"DOSEN MIK","LAKI - LAKI","ISLAM",,,"BELUM KAWIN",,,"S1 Teknik Komputer Unibraw Thn. 2020",,"S2 Ilmu Komputer Unibraw Tahun 2022","2024",
"2025.01.63/STIKes","Endang Krisnawati, S.Stat., M.Stat","Tulungagung, 15 September1998",,"DOSEN MIK","PEREMPUAN","ISLAM",,,"BELUM KAWIN",,,"S1 Statistik Unibraw Tahun 2021",,"S2 Statistik Unibraw Tahun 2022","2025",
"2025.01.62/STIKes","Ika Nuraini, S.Farm., M.Farm","Malang, 01 Juli 2000",,"DOSEN FARMASI","PEREMPUAN","ISLAM",,,"KAWIN",,,"S1 Farmasi Univ Machung Thn. 2022",,"S2 Farmasi Univ Setia Budi Thn.2024","2024",
"2025.01.64/STIKes","apt. Yulinda Pristi Dwi Hapysari, S.Farm., M.Farm","Kediri, 01 Juli 1996",,"DOSEN FARMASI","PEREMPUAN","ISLAM",,,"KAWIN",,,"S1 Farmasi Tahun 2019 Univ Muhammadiyah Malang","Apoteker Thn. 2021 Institut Sains dan Tek Nas Jakarta","S2 Farmasi Tahun 2024 Univ Setia Budi Surakarta","2024",
,"Apt. Hestining Puspaweni, S.Farm., M.Farm","Palangkaraya, 11 Oktober 1995",,"DOSEN FARMASI","PEREMPUAN","ISLAM",,,"KAWIN",,,"S1 Farmasi Tahun 2018 Univ Muhammadiyah Malang","Apoteker Thn. 2020 Univ Muhammadiyah Malang","S2 Farmasi Tahun 2024 Univ Airlangga","2025",
"2025.01.65/STIKes","Fransiska Elsia One Irawan, S.Farm","Malang, 28 Januari 2001",,"LABORAN FARMASI","PEREMPUAN","KATOLIK",,,"BELUM KAWIN",,,"S1 Farmasi Tahun 2023 Stikes Panti Waluya",,,"2023",
"2024.01.58/STIKes","Yolanda Agustina, S.Farm","Malang, 12 Juli 2001",,"LABORAN FARMASI","PEREMPUAN","KRISTEN",,,"BELUM KAWIN",,,"S1 Farmasi Tahun 2023 Stikes Panti Waluya",,,"2023",
"2025.01.60/STIKes","Agnes Carolina Kristin, S.Tr.RMIK","Malang, 1 Maret 2001",,"LABORAN MIK","PEREMPUAN","KRISTEN",,,"BELUM KAWIN",,,"DIV MIK Tahun 2023 Stikes Panti Waluya",,,"2024",
,"Egnatius Permadi S.Tr.RMIK","Malang, 22 Februari 2003",,"LABORAN MIK","LAKI - LAKI","KATOLIK",,,"BELUM KAWIN",,,"DIV MIK Tahun 2025 Stikes Panti Waluya",,,"2025",
,"Vania Livia Kesrina Kendinar Makmur Jaya Waimuri, S.Tr.Par","Biak, 08 Juni 2001",,"RESEPSIONIS","PEREMPUAN","KATOLIK",,,"BELUM KAWIN",,,"DIV Destinasi Wisata Unmer Tahun 2022",,,"2025",
,"Bernadette Adriana Farelita Yohandhy, S.Ak","Padang, 5 November 2001",,"KEUANGAN","PEREMPUAN","KATOLIK",,,"BELUM KAWIN",,,"S1 Akuntansi Univ Widya Karya Lulus Tahun 2024",,,"2025",
,"Katarina Sastrini Wawut, S.Ak","Nterlango, 18 Agustus 2002",,"KEUANGAN","PEREMPUAN","KATOLIK",,,"BELUM KAWIN",,,"S1 Akuntansi Univ Widya Karya Tahun 2025",,,"2025",
,"Yohanes Yudha Saputra Bangko, S.Kom","Malang, 19 Agustus 2003",,"STAF IT","LAKI - LAKI","KATOLIK",,,"BELUM KAWIN",,,"S1 Teknik Informatika ITN Malang Tahun 2025",,,"2025",
,"Dany Arief Herlambang, S.Tr.Kes","Mojokerto 11 Januari 2003",,"K3","LAKI - LAKI","ISLAM",,,"BELUM KAWIN",,,"DIV Keselamatan dan Kesehatan Kerja Poltekkes Kemenkes Malang Thn 2025",,,"2025",
,"Mochamad Abdul Aziz","Malang, 15 Oktober 1996",,"RUMAH TANGGA","LAKI - LAKI","ISLAM",,,,,,,,,2025",
CSV;

        // Parse CSV string using PHP's native parser
        $lines = explode("\n", trim($csvData));
        $header = str_getcsv(array_shift($lines));

        $departmentsMap = [];
        $positionsMap = [];

        foreach ($lines as $line) {
            if (empty(trim($line))) continue;
            
            $row = str_getcsv($line);
            if (count($row) < 17) continue;

            $nip = trim($row[0]);
            $rawName = trim($row[1]);
            $birthStr = trim($row[2]);
            $address = trim($row[3]);
            $deptName = trim($row[4]);
            $genderStr = trim($row[5]);
            $religion = trim($row[6]);
            $pangkat = trim($row[7]);
            $golongan = trim($row[8]);
            $maritalStr = trim($row[9]);
            $spouseName = trim($row[10]);
            $d3 = trim($row[11]);
            $s1 = trim($row[12]);
            $profesi = trim($row[13]);
            $s2 = trim($row[14]);
            $joinDateStr = trim($row[15]);
            $imageHtml = trim($row[16]);

            // 1. Clean Name (strip HTML link)
            $fullName = strip_tags($rawName);

            // Set NIP to null if not present
            if (empty($nip)) {
                $nip = null;
            }

            // 2. Parse Birth Place and Date
            $birthPlace = null;
            $birthDate = null;
            if (!empty($birthStr)) {
                $parts = explode(',', $birthStr);
                $birthPlace = trim($parts[0]);
                if (isset($parts[1])) {
                    $birthDate = $this->parseIndonesianDate(trim($parts[1]));
                }
            }

            // 3. Resolve Department
            if (empty($deptName)) {
                $deptName = 'Umum';
            }
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

            // 4. Resolve Position
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

            // 5. Gender
            $gender = 'L';
            $genderStrLower = strtolower($genderStr);
            if ($genderStrLower === 'perempuan') {
                $gender = 'P';
            }

            // 6. Marital Status
            $maritalStatus = 'belum_menikah';
            $maritalStrLower = strtolower($maritalStr);
            if (str_contains($maritalStrLower, 'kawin') && !str_contains($maritalStrLower, 'belum')) {
                $maritalStatus = 'menikah';
            }

            // 7. Extract image URL if exists
            $photoPath = null;
            if (!empty($imageHtml) && preg_match('/src="([^"]+)"/', $imageHtml, $imgMatches)) {
                // We can save the raw URL or just store it. Since we want a robust seeder, we save the full URL
                $photoPath = $imgMatches[1];
            }

            // 8. Join Date
            $joinDate = $this->parseJoinDate($joinDateStr);

            // Determine employment status based on NIP presence in CSV
            $employmentStatus = empty(trim($row[0])) ? 'kontrak' : 'tetap';

            // Create Employee
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
                'status' => 'active',
            ]);

            // 9. Add Spouse (Keluarga) if married and spouse name provided
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

            // 10. Add Educations
            if (!empty($d3) && $d3 !== '-') {
                $this->createEducationRecord($employee->id, 'D3', $d3);
            }
            if (!empty($s1) && $s1 !== '-') {
                $this->createEducationRecord($employee->id, 'S1', $s1);
            }
            if (!empty($profesi) && $profesi !== '-') {
                // If contains Ners or Apoteker
                $this->createEducationRecord($employee->id, 'S1', $profesi);
            }
            if (!empty($s2) && $s2 !== '-') {
                $this->createEducationRecord($employee->id, 'S2', $s2);
            }
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

        // Try standard formats like 01-Nov-90
        try {
            // E.g. 01-Nov-90
            $carbon = Carbon::parse($dateStr);
            return $carbon->format('Y-m-d');
        } catch (\Exception $e) {
            // Check for Indonesian months (e.g. 01 AGUSTUS 1987)
            $parsed = $this->parseIndonesianDate($dateStr);
            if ($parsed) return $parsed;

            // If only year (e.g. 2022)
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
