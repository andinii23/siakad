import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utilites/constants.dart';

class HomeDosenElista extends StatefulWidget {
  const HomeDosenElista({super.key});

  @override
  State<HomeDosenElista> createState() => _HomeDosenElistaState();
}

class _HomeDosenElistaState extends State<HomeDosenElista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home Dosen Elista",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 20, color: mainBlackColor, fontWeight: FontWeight.w700),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'mhsbimbinganelista');
            },
            child: Text("Daftar Mahasiswa Bimbingan")),
        ],
      ),
    );
  }
}