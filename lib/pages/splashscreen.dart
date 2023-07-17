import 'package:flutter/material.dart';
import 'package:siakad/pages/welcome_page.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: const WelcomePage(),
      imageBackground: Image.asset(
        "assets/img/Logo.png",
      ).image,
      useLoader: false,
      // loaderColor: Colors.black,
      // loadingText: const Text(
      //   "loading..",
      //   style: TextStyle(color: Colors.black),
      // ),
    );
  }
}