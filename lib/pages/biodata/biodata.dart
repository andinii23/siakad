import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BiodataMhs extends StatefulWidget {
  const BiodataMhs({super.key});

  @override
  State<BiodataMhs> createState() => _BiodataMhsState();
}

class _BiodataMhsState extends State<BiodataMhs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biodata Mahasiswa"),
      ),
    );
  }
}