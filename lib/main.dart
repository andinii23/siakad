import 'dart:io';
import 'package:flutter/material.dart';
import 'package:siakad/navbar/nav.dart';
import 'package:siakad/navbar/navbar_dosen.dart';
import 'package:siakad/pages/cetak/cetak.dart';
import 'package:siakad/pages/home%20dosen/home_dosen.dart';
import 'package:siakad/pages/home%20dosen/mhs_bimbingan/mhs_bimbingan.dart';
import 'package:siakad/pages/home%20dosen/mhs_bimbingan/mhs_krs.dart';
import 'package:siakad/pages/home%20dosen/mk_pengampu/mkajar.dart';
import 'package:siakad/pages/home%20dosen/mk_pengampu/semester_mk.dart';
import 'package:siakad/pages/home%20dosen/monitoring_kuliah/detail.dart';
import 'package:siakad/pages/home%20dosen/monitoring_kuliah/monitoring_kuliah.dart';
import 'package:siakad/pages/home%20dosen/monitoring_kuliah/sem_monitoring.dart';
import 'package:siakad/pages/home/chat/chat_mhs.dart';
import 'package:siakad/pages/home/chat/chat_page_dosen.dart';
import 'package:siakad/pages/home/chat/chat_page_mhs.dart';
import 'package:siakad/pages/home/ganti_password.dart';
import 'package:siakad/pages/home/home_mhs.dart';
import 'package:siakad/pages/home/home_page.dart';
import 'package:siakad/pages/home/khs/detail_khs.dart';
import 'package:siakad/pages/home/khs/khs.dart';
import 'package:siakad/pages/home/krs/detail_krs_kelas.dart';
import 'package:siakad/pages/home/krs/krs.dart';
import 'package:siakad/pages/home/krs/krs_dafkelas.dart';
import 'package:siakad/pages/home/krs/krs_inbound.dart';
import 'package:siakad/pages/home/krs/krs_kelas.dart';
import 'package:siakad/pages/home/kurikulum/kurikulum.dart';
import 'package:siakad/pages/home/kurikulum/kurikulum_detail.dart';
import 'package:siakad/pages/home/register_page.dart';
import 'package:siakad/pages/home%20dosen/home_app.dart';
import 'package:siakad/pages/login/login_page.dart';
import 'package:siakad/pages/presensi/detail_presensi.dart';
import 'package:siakad/pages/presensi/presensi_page.dart';
import 'package:siakad/pages/splashscreen.dart';
import 'package:siakad/pages/tagihan/tagihan.dart';
import 'package:sp_util/sp_util.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Siakad Unja',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: (SpUtil.getBool('isLogin')) ? 'HomePage' : 'Splashscreen',
      routes: {
        // 'StartPage': (context) => const StartPage(),
        'Splashscreen': (context) => const MySplash(),
        'Login': (context) => const LoginPage(),
        'HomePage': (context) => const HomePage(),
        'RegisterPage': (context) => const RegisterPage(),
        'HomeMhsPage': (context) => const HomeMhs(),
        'Navbar': (context) => const Navbar(),
        'PresensiMhs': (context) => const PresensiMhs(),
        'DetailPresensi': (context) => const DetailPresensiMhs(),
        'KurikulumMhs': (context) => const KurikulumMhs(),
        'DetailKur': (context) => const DetailKurikulumMhs(),
        'KhsMhs': (context) => const KhsMhs(),
        'Dkhs' :(context) => const KhsDetailMhs(),
        'KrsMhs': (context) => const KrsMhs(),
        'DaftarKelas': (context) => const KelasKontrak(),
        'TagihanMhs': (context) => const Tagihan(),
        'Cetak': (context) => const CetakPage(),
        'HomePageDosen': (context) => const HomeAppDosen(),
        'NavbarDosen': (context) => const NavbarDosen(),
        'MahasiswaBimbingan': (context) => const MhsBimbingan(),
        'DetailMonitor': (context) => const DetailMonitor(),
        'SemAjar': (context) => const SemesterMk(),
        'HomeDosen': (context) => const HomeDosen(),
        'MkAjar': (context) => const MkAjar(),
        'SemMonitor': (context) => const SemMonitoring(),
        'Monitoring': (context) => const MonitoringKuliah(),
        'detailruangkelas': (context) => const DetailKelasKrs(),
        'KrsMhsDosen': (context) => const MhsKrsDosen(),
        'ChatMhs': (context) => const ChatPageMhs(),
        'ChatDosen': (context) => const ChatPageDosen(),
        'GantiPassword': (context) => const GantiPassword(),
        'krsinbound': (context) => const KrsInbound(),
        'detailkelas': (context) => const DaftarKelasKrs(),
      },
    );
  }
}
