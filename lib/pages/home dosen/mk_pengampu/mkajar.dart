import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:siakad/api/model/mkajar_model.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../utilites/constants.dart';

class MkAjar extends StatefulWidget {
  const MkAjar({super.key});

  @override
  State<MkAjar> createState() => _MkAjarState();
}

class _MkAjarState extends State<MkAjar> {
  Future<MkAjarModel> getMkAjar() async {
    var header = {"Authorization": "Bearer ${SpUtil.getString("token")}"};
    var response = await http
        .get(matakuliahajar + SpUtil.getString("id_semester"), headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return MkAjarModel.fromJson(data);
    } else {
      return MkAjarModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Matakuliah Ajar",
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
            child: FutureBuilder<MkAjarModel>(
                future: getMkAjar(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.data.list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: mainOrange2Color,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      "JUMLAH KELAS : ${snapshot.data!.data.list[index].jumlahKelas}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: mainWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Text(
                                      //   "Daftar Kelas",
                                      //   textAlign: TextAlign.start,
                                      //   style: TextStyle(
                                      //       color: mainBlueColor,
                                      //       fontSize: 16,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.data
                                              .list[index].listKelas.length,
                                          itemBuilder: (context, kls) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    topRight:
                                                        Radius.circular(16),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(
                                                              0xFF1E3B78)
                                                          .withOpacity(0.1),
                                                      spreadRadius: 5,
                                                      blurRadius: 4,
                                                      offset: const Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  mainBlueColor,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                topRight: Radius
                                                                    .circular(
                                                                        5),
                                                              ),
                                                            ),
                                                            child: Text(
                                                              "${snapshot.data!.data.list[index].listKelas[kls].matakuliah.kodeMatakuliah.toString()} : ${snapshot.data!.data.list[index].listKelas[kls].matakuliah.namaMatakuliah.toString()}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color:
                                                                      mainWhiteColor,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
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
                                                          "Ruang ${snapshot.data!.data.list[index].listKelas[kls].kodeKelas.toString()} ${snapshot.data!.data.list[index].listKelas[kls].kelasProdi.namaKelasProdi.toString()}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  mainBlueColor,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "Jumlah Mahasiswa : ${snapshot.data!.data.list[index].listKelas[kls].jumlahMahasiswa.toString()}",
                                                          style: TextStyle(
                                                            color:
                                                                mainBlueColor,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Jumlah SKS : ${snapshot.data!.data.list[index].listKelas[kls].matakuliah.sksTotal.toString()}",
                                                          style: TextStyle(
                                                            color:
                                                                mainBlueColor,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Program Studi : ${snapshot.data!.data.list[index].listKelas[kls].prodi.namaProdi.toString()}",
                                                          style: TextStyle(
                                                            color:
                                                                mainBlueColor,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Divider(
                                                      color: mainBlackColor,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "Jadwal",
                                                          style: TextStyle(
                                                              color:
                                                                  mainOrange2Color,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .data
                                                              .list[index]
                                                              .listKelas[kls]
                                                              .ruangKuliah
                                                              .namaRuang
                                                              .toString(),
                                                          style: TextStyle(
                                                            color:
                                                                mainOrange2Color,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${snapshot.data!.data.list[index].listKelas[kls].jamMulai.toString()} - ${snapshot.data!.data.list[index].listKelas[kls].jamSelesai.toString()}",
                                                          style: TextStyle(
                                                            color:
                                                                mainOrange2Color,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          })
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
