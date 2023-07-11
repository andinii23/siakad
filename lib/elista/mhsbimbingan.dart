import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../api/model/elista/mhsbimbinganmodel.dart';
import '../utilites/constants.dart';

class MhsBimbinganElista extends StatefulWidget {
  const MhsBimbinganElista({super.key});

  @override
  State<MhsBimbinganElista> createState() => _MhsBimbinganElistaState();
}

class _MhsBimbinganElistaState extends State<MhsBimbinganElista> {
  Future<MahasiswaBimbinganElista> getMhsBimbinganElista() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(mhsbimelista, headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return MahasiswaBimbinganElista.fromJson(data);
    } else {
      return MahasiswaBimbinganElista.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Mahasiswa Bimbingan Elista",
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
          Expanded(
              child: FutureBuilder(
                  future: getMhsBimbinganElista(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text("data");
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
