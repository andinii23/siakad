import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../api/model/detail_monitor.dart';
import '../../../utilites/constants.dart';

class DetailMonitorKuliah extends StatefulWidget {
  const DetailMonitorKuliah({super.key});

  @override
  State<DetailMonitorKuliah> createState() => _DetailMonitorKuliahState();
}

class _DetailMonitorKuliahState extends State<DetailMonitorKuliah> {
  Future<DetailMonitoringKuliahModel> getDetailMonitor() async {
    var header = {"Authorization": "Bearer ${SpUtil.getString("token")}"};
    var response = await http.get(
        monitorperkelasdetail + SpUtil.getString("id_monitoring_perkuliahan"),
        headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return DetailMonitoringKuliahModel.fromJson(data);
    } else {
      return DetailMonitoringKuliahModel.fromJson(data);
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
              child: FutureBuilder(
                  future: getDetailMonitor(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data!.data.list.materi,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: mainOrange2Color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              color: mainWhiteColor,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: mainBlueColor,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      "Mahasiswa",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: mainWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListView.builder(
                                      physics: const ScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: snapshot
                                          .data!.data.list.mahasiswa.length,
                                      itemBuilder: (context, mhs) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:10.0),
                                                    child: SizedBox(
                                                      width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .data
                                                                .list
                                                                .mahasiswa[mhs]
                                                                .namaMahasiswa,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                                color:
                                                                    mainOrange2Color),
                                                          ),
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .data
                                                                .list
                                                                .mahasiswa[mhs]
                                                                .noMhs,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                                color:
                                                                    mainBlueColor),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        3,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          "Ket.",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              color:
                                                                  mainOrange2Color),
                                                        ),
                                                        if (snapshot
                                                                .data!
                                                                .data
                                                                .list
                                                                .mahasiswa[mhs]
                                                                .kehadiran
                                                                .toString() ==
                                                            "1")
                                                          (Text(
                                                            "Hadir",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    mainBlueColor),
                                                          )),
                                                          if (snapshot
                                                                .data!
                                                                .data
                                                                .list
                                                                .mahasiswa[mhs]
                                                                .kehadiran
                                                                .toString() ==
                                                            "0")
                                                          (Text(
                                                            "Alfa",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    mainBlueColor),
                                                          )),
                                                          if (snapshot
                                                                .data!
                                                                .data
                                                                .list
                                                                .mahasiswa[mhs]
                                                                .kehadiran
                                                                .toString() ==
                                                            "2")
                                                          (Text(
                                                            "Izin",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    mainBlueColor),
                                                          )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      })
                                ],
                              ),
                            )
                          ],
                        ),
                      );
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
