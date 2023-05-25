import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:siakad/api/model/detail_monitor.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../utilites/constants.dart';

class DetailMonitor extends StatefulWidget {
  const DetailMonitor({super.key});

  @override
  State<DetailMonitor> createState() => _DetailMonitorState();
}

class _DetailMonitorState extends State<DetailMonitor> {
  Future<DetailMonitoringModel> getDetailData() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(detailmonitor + SpUtil.getString("id_kelas"),
        headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return DetailMonitoringModel.fromJson(data);
    } else {
      return DetailMonitoringModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Monitoring",
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
            child: FutureBuilder<DetailMonitoringModel>(
                future: getDetailData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
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
                              color: const Color(0xFF1E3B78).withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                // margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 15),
                                decoration: BoxDecoration(
                                  color: mainBlueColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                ),
                                child: Text(
                                  snapshot.data!.data.list.materi,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: mainWhiteColor,
                                      fontSize: 16),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount:
                                      snapshot.data!.data.list.mahasiswa.length,
                                  itemBuilder: (context, mhs) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.5,
                                              padding: const EdgeInsets.only(
                                                  left: 10, bottom: 5),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot
                                                        .data!
                                                        .data
                                                        .list
                                                        .mahasiswa[mhs]
                                                        .namaMahasiswa,
                                                    style: TextStyle(
                                                        color: mainOrange2Color,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(snapshot.data!.data.list
                                                      .mahasiswa[mhs].noMhs,
                                                    style: TextStyle(
                                                        color: mainBlueColor,
                                                        fontWeight:
                                                            FontWeight.bold),),
                                                  Text(snapshot.data!.data.list
                                                      .mahasiswa[mhs].angkatan,
                                                    style: TextStyle(
                                                        color: mainBlueColor,
                                                        fontWeight:
                                                            FontWeight.bold),),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7,
                                              padding: const EdgeInsets.only(
                                                  right: 10, bottom: 5),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Ket.",
                                                    style: TextStyle(
                                                        color: mainOrange2Color,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  if (snapshot
                                                          .data!
                                                          .data
                                                          .list
                                                          .mahasiswa[mhs]
                                                          .kehadiran
                                                          .toString() ==
                                                      "0")
                                                    (Text("Alfa",
                                                    style: TextStyle(
                                                        color: mainBlueColor,
                                                        fontWeight:
                                                            FontWeight.bold),)),
                                                  if (snapshot
                                                          .data!
                                                          .data
                                                          .list
                                                          .mahasiswa[mhs]
                                                          .kehadiran
                                                          .toString() ==
                                                      "1")
                                                    ( Text("Hadir",
                                                    style: TextStyle(
                                                        color: mainBlueColor,
                                                        fontWeight:
                                                            FontWeight.bold),)),
                                                  if (snapshot
                                                          .data!
                                                          .data
                                                          .list
                                                          .mahasiswa[mhs]
                                                          .kehadiran
                                                          .toString() ==
                                                      "2")
                                                    (Text("Izin",
                                                    style: TextStyle(
                                                        color: mainBlueColor,
                                                        fontWeight:
                                                            FontWeight.bold),)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: mainBlackColor,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
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
}
