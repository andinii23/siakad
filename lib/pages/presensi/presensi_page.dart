import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;
import '../../api/model/presensi_model.dart';
import '../../utilites/constants.dart';

class PresensiMhs extends StatefulWidget {
  const PresensiMhs({super.key});

  @override
  State<PresensiMhs> createState() => _PresensiMhsState();
}

class _PresensiMhsState extends State<PresensiMhs> {
  Future<PresensiModel> getPresensiData() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(presensi, headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return PresensiModel.fromJson(data);
    } else {
      return PresensiModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
        title:  Text(
          "Presensi Mahasiswa",
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
              child: FutureBuilder<PresensiModel>(
                  future: getPresensiData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.data.list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF1E3B78)
                                          .withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 4,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: mainBlueColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                              ),
                                            ),
                                            child: Text(
                                              "${snapshot.data!.data.list[index].kodeMatakuliah} : ${snapshot.data!.data.list[index].namaMatakuliah.toUpperCase()}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: mainWhiteColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Dosen Pengampu",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: mainBlueColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemCount: snapshot.data!.data
                                                .list[index].dosen.length,
                                            itemBuilder: (context, dosen) {
                                              return Center(
                                                child: Text(
                                                  "${snapshot.data!.data.list[index].dosen[dosen].namaPegawai} ${snapshot.data!.data.list[index].dosen[dosen].gelarBelakang}",
                                                  style: TextStyle(
                                                    color: mainBlueColor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Ruang ${snapshot.data!.data.list[index].kelas.kodeKelas}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: mainBlueColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data!.data.list[index].kelas
                                              .namaRuang,
                                          style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          "Jumlah SKS : ${snapshot.data!.data.list[index].sksTotal}",
                                          style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      color: mainBlackColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 106,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Hari",
                                                style: TextStyle(
                                                    color: mainOrange2Color,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                snapshot.data!.data.list[index]
                                                    .kelas.hari,
                                                style: TextStyle(
                                                  color: mainOrange2Color,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 106,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Jam Mulai",
                                                style: TextStyle(
                                                    color: mainOrange2Color,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                snapshot.data!.data.list[index]
                                                    .kelas.jamMulai,
                                                style: TextStyle(
                                                  color: mainOrange2Color,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 106,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Jam Selesai",
                                                style: TextStyle(
                                                    color: mainOrange2Color,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                snapshot.data!.data.list[index]
                                                    .kelas.jamSelesai,
                                                style: TextStyle(
                                                  color: mainOrange2Color,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 106,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Jumlah Masuk",
                                                style: TextStyle(
                                                    color: mainOrange2Color,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                snapshot.data!.data.list[index]
                                                    .jumlahMasuk
                                                    .toString(),
                                                style: TextStyle(
                                                  color: mainOrange2Color,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 106,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Jumlah Izin",
                                                style: TextStyle(
                                                    color: mainOrange2Color,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                snapshot.data!.data.list[index]
                                                    .jumlahIzin
                                                    .toString(),
                                                style: TextStyle(
                                                  color: mainOrange2Color,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 106,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Jumlah Absen",
                                                style: TextStyle(
                                                    color: mainOrange2Color,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                snapshot.data!.data.list[index]
                                                    .jumlahAbsen
                                                    .toString(),
                                                style: TextStyle(
                                                  color: mainOrange2Color,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: mainOrange2Color,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft: Radius.circular(5),
                                                    bottomRight: Radius.circular(5),
                                                  ),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Detail",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: mainWhiteColor,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    Icon(Icons.arrow_forward_ios, color: mainWhiteColor,),
                                                  ],
                                                ),
                                                
                                              ),
                                            ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Text("Loading");
                    }
                  })),
        ],
      ),
    );
  }
}
