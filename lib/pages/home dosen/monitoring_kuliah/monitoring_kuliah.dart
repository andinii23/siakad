// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:siakad/api/model/monitor_kuliah_model.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../utilites/constants.dart';

class MonitoringKuliah extends StatefulWidget {
  const MonitoringKuliah({super.key});

  @override
  State<MonitoringKuliah> createState() => _MonitoringKuliahState();
}

class _MonitoringKuliahState extends State<MonitoringKuliah> {
  Future<MonitoringKuliahModel> getMonitor() async {
    var header = {"Authorization": "Bearer ${SpUtil.getString("token")}"};
    var response = await http
        .get(monitorkuliah + SpUtil.getString("id_semester"), headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return MonitoringKuliahModel.fromJson(data);
    } else {
      return MonitoringKuliahModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Monitoring Kuliah",
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
            child: FutureBuilder<MonitoringKuliahModel>(
                future: getMonitor(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   padding: const EdgeInsets.symmetric(horizontal: 10),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         "Monitoring Perkuliahan Semester ${snapshot.data!.data.list.idSemester}",
                        //         textAlign: TextAlign.center,
                        //         style: TextStyle(
                        //             color: mainBlueColor,
                        //             fontSize: 16,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount:
                                  snapshot.data!.data.list.listKelas.length,
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
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: mainBlueColor,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5),
                                                  ),
                                                ),
                                                child: Text(
                                                  "${snapshot.data!.data.list.listKelas[index].matakuliah.kodeMatakuliah.toString()} : ${snapshot.data!.data.list.listKelas[index].matakuliah.namaMatakuliah.toString()}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: mainWhiteColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                itemCount: snapshot
                                                    .data!
                                                    .data
                                                    .list
                                                    .listKelas[index]
                                                    .dosen
                                                    .length,
                                                itemBuilder: (context, dosen) {
                                                  if (snapshot
                                                          .data!
                                                          .data
                                                          .list
                                                          .listKelas[index]
                                                          .dosen[dosen]
                                                          .gelarDepan !=
                                                      null) {
                                                    return Center(
                                                      child: Text(
                                                        "${snapshot.data!.data.list.listKelas[index].dosen[dosen].gelarDepan.toString()} ${snapshot.data!.data.list.listKelas[index].dosen[dosen].namaPegawai.toString()} ${snapshot.data!.data.list.listKelas[index].dosen[dosen].gelarBelakang.toString()}",
                                                        style: TextStyle(
                                                          color: mainBlueColor,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Center(
                                                      child: Text(
                                                        "${snapshot.data!.data.list.listKelas[index].dosen[dosen].namaPegawai.toString()} ${snapshot.data!.data.list.listKelas[index].dosen[dosen].gelarBelakang.toString()}",
                                                        style: TextStyle(
                                                          color: mainBlueColor,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                }),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Ruang ${snapshot.data!.data.list.listKelas[index].kodeKelas.toString()} ${snapshot.data!.data.list.listKelas[index].kelasProdi.namaKelasProdi.toString()}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: mainBlueColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot
                                                  .data!
                                                  .data
                                                  .list
                                                  .listKelas[index]
                                                  .ruangKuliah
                                                  .namaRuang
                                                  .toString(),
                                              style: TextStyle(
                                                color: mainBlueColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              "Jumlah SKS : ${snapshot.data!.data.list.listKelas[index].matakuliah.sksTotal.toString()}",
                                              style: TextStyle(
                                                color: mainBlueColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              "Jumlah Mahasiswa : ${snapshot.data!.data.list.listKelas[index].jumlahMahasiswa.toString()}",
                                              style: TextStyle(
                                                  color: mainBlueColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
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
                                                    snapshot.data!.data.list
                                                        .listKelas[index].hari
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
                                                    "Jam Mulai",
                                                    style: TextStyle(
                                                        color: mainOrange2Color,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    snapshot
                                                        .data!
                                                        .data
                                                        .list
                                                        .listKelas[index]
                                                        .jamMulai
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
                                                    "Jam Selesai",
                                                    style: TextStyle(
                                                        color: mainOrange2Color,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    snapshot
                                                        .data!
                                                        .data
                                                        .list
                                                        .listKelas[index]
                                                        .jamSelesai
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: mainOrange2Color,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                  ),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    _detailMonitor(snapshot
                                                        .data!
                                                        .data
                                                        .list
                                                        .listKelas[index]
                                                        .idKelas
                                                        .toString());
                                                  },
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Detail",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color:
                                                                mainWhiteColor,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: mainWhiteColor,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
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

  Future _detailMonitor(String idKelas) async {
    SpUtil.putString("id_kelas", idKelas);
    Navigator.pushNamed(context, 'monitorperkelas');
  }
}
