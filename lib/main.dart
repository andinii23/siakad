import 'package:flutter/material.dart';
import 'package:siakad/navbar/nav.dart';
import 'package:siakad/pages/home/home_mhs.dart';
import 'package:siakad/pages/home/home_page.dart';
import 'package:siakad/pages/home/khs/khs.dart';
import 'package:siakad/pages/home/kurikulum/kurikulum.dart';
import 'package:siakad/pages/home/register_page.dart';
import 'package:siakad/pages/login/login_page.dart';
import 'package:siakad/pages/presensi/presensi_page.dart';
import 'package:siakad/pages/splashscreen.dart';
import 'package:sp_util/sp_util.dart';

void main() async{
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
        'KurikulumMhs': (context) => const KurikulumMhs(),
        'KhsMhs': (context) => const KhsMhs(),
      },
    );
  }
}