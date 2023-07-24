import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:siakad/elista/develop.dart';
import 'package:siakad/elista/home_dosen.dart';
import 'package:siakad/elista/mhsbimbingan.dart';
import 'package:siakad/navbar/nav.dart';
import 'package:siakad/navbar/navbar_dosen.dart';
import 'package:siakad/pages/berita/berita.dart';
import 'package:siakad/pages/berita/detailberita.dart';
import 'package:siakad/pages/cetak/cetak.dart';
import 'package:siakad/pages/gerbang.dart';
import 'package:siakad/pages/home%20dosen/home_dosen.dart';
import 'package:siakad/pages/home%20dosen/mhs_bimbingan/chat_mhs_bimbingan.dart';
import 'package:siakad/pages/home%20dosen/mhs_bimbingan/mhs_bimbingan.dart';
import 'package:siakad/pages/home%20dosen/mhs_bimbingan/mhs_krs.dart';
import 'package:siakad/pages/home%20dosen/mk_pengampu/detail_mkajar.dart';
import 'package:siakad/pages/home%20dosen/mk_pengampu/mkajar.dart';
import 'package:siakad/pages/home%20dosen/mk_pengampu/semester_mk.dart';
import 'package:siakad/pages/home%20dosen/monitoring_kuliah/detailmonitor_kuliah.dart';
import 'package:siakad/pages/home%20dosen/monitoring_kuliah/editmonitor.dart';
import 'package:siakad/pages/home%20dosen/monitoring_kuliah/monitor_kelas.dart';
import 'package:siakad/pages/home%20dosen/monitoring_kuliah/monitoring_kuliah.dart';
import 'package:siakad/pages/home%20dosen/monitoring_kuliah/sem_monitoring.dart';
import 'package:siakad/pages/home%20dosen/monitoring_kuliah/tambah_pertemuan.dart';
import 'package:siakad/pages/home/chat/chat_dosen.dart';
import 'package:siakad/pages/home/chat/chat_page_dosen.dart';
import 'package:siakad/pages/home/chat/chat_page_mhs.dart';
import 'package:siakad/pages/home/ganti_password.dart';
import 'package:siakad/pages/home/home_mhs.dart';
import 'package:siakad/pages/home/home_page.dart';
import 'package:siakad/pages/home/khs/detail_khs.dart';
import 'package:siakad/pages/home/khs/khs.dart';
import 'package:siakad/pages/home/krs/detail_krs_kelas.dart';
import 'package:siakad/pages/home/krs/detail_krs_kelasoutbound.dart';
import 'package:siakad/pages/home/krs/krs.dart';
import 'package:siakad/pages/home/krs/krs_dafkelas.dart';
import 'package:siakad/pages/home/krs/krs_inbound.dart';
import 'package:siakad/pages/home/krs/krs_kelas.dart';
import 'package:siakad/pages/home/krs/krs_outbound.dart';
import 'package:siakad/pages/home/krs/kurikulum_outbound_konf.dart';
import 'package:siakad/pages/home/kurikulum/kurikulum.dart';
import 'package:siakad/pages/home/kurikulum/kurikulum_detail.dart';
import 'package:siakad/pages/home/register_page.dart';
import 'package:siakad/pages/home%20dosen/home_app.dart';
import 'package:siakad/pages/login/login_page.dart';
import 'package:siakad/pages/presensi/detail_presensi.dart';
import 'package:siakad/pages/presensi/presensi_page.dart';
import 'package:siakad/pages/splashscreen.dart';
import 'package:siakad/pages/tagihan/tagihan.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sp_util/sp_util.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/home/krs/krs_inboundkelas.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // ignore: avoid_print
  print('Handling a background message ${message.messageId}');
}

AndroidNotificationChannel? channel;

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                channel!.description,
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // ignore: avoid_print
      print('A new onMessageOpenedApp event was published!');
      // Navigation to page
    });
    super.initState();
  }

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
        'Dkhs': (context) => const KhsDetailMhs(),
        'KrsMhs': (context) => const KrsMhs(),
        'DaftarKelas': (context) => const KelasKontrak(),
        'TagihanMhs': (context) => const Tagihan(),
        'Cetak': (context) => const CetakPage(),
        'HomePageDosen': (context) => const HomeAppDosen(),
        'NavbarDosen': (context) => const NavbarDosen(),
        'MahasiswaBimbingan': (context) => const MhsBimbingan(),
        'monitorperkelas': (context) => const MonitorPerkelas(),
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
        'dafkrskelasinbound': (context) => const DaftarKelasKrsInbound(),
        'krsoutbound': (context) => const KrsOutbound(),
        'detailkrsoutbound': (context) => const DetailKrsKlsOutbound(),
        'kurikulumkonf': (context) => const KurikulumOutboundKonf(),
        'chtdosen': (context) => const ChatDosen(),
        'chtmhsdosen': (context) => const ChatMhsBimbingan(),
        'detailmonitorkuliah': (context) => const DetailMonitorKuliah(),
        'tambahpertemuan': (context) => const TambahPertemuan(),
        'detailmkajar': (context) => const DetailMkAjar(),
        'gerbang': (context) => const Gerbang(),
        'homedosenelista': (context) => const HomeDosenElista(),
        'mhsbimbinganelista': (context) => const MhsBimbinganElista(),
        'detailberita': (context) => const DetailBerita(),
        'berita': (context) => const BeritaPage(),
        'develop': (context) => const DevelopPage(),
        'editpertemuan': (context) => const EditMonitoKulian(),
      },
    );
  }
}
