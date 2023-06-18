import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:siakad/api/model/detail_monitor.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../api/model/monitorkuliah_perkelas_model.dart';
import '../../../utilites/constants.dart';

class MonitorPerkelas extends StatefulWidget {
  const MonitorPerkelas({super.key});

  @override
  State<MonitorPerkelas> createState() => _MonitorPerkelasState();
}

class _MonitorPerkelasState extends State<MonitorPerkelas> {
  Future<MonitorKuliahPerkelasModel> getDetailData() async {
    var header = {"Authorization": "Bearer ${SpUtil.getString("token")}"};
    var response = await http
        .get(monitorperkelas + SpUtil.getString("id_kelass"), headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return MonitorKuliahPerkelasModel.fromJson(data);
    } else {
      return MonitorKuliahPerkelasModel.fromJson(data);
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
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Text(SpUtil.getString("id_sem"), style: TextStyle(color: mainBlackColor),),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'tambahpertemuan');
            },
            child: Container(
              decoration: BoxDecoration(
                color: mainOrange2Color,
                borderRadius: BorderRadius.circular(5)
              ),
              padding: const EdgeInsets.all(5),
              width: 170,
              margin: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: mainWhiteColor,
                  ),
                  Text(
                    "Tambah Pertemuan",
                    style: TextStyle(color: mainWhiteColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<MonitorKuliahPerkelasModel>(
                future: getDetailData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
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
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                              snapshot.data!.data.list[index]
                                                  .materi,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: mainWhiteColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              ListView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  shrinkWrap: true,
                                                  itemCount: snapshot.data!.data
                                                      .list[index].dosen.length,
                                                  itemBuilder:
                                                      (context, dosen) {
                                                    if (snapshot
                                                            .data!
                                                            .data
                                                            .list[index]
                                                            .dosen[dosen]
                                                            .gelarDepan !=
                                                        null) {
                                                      return Center(
                                                        child: Text(
                                                          "${snapshot.data!.data.list[index].dosen[dosen].gelarDepan.toString()} ${snapshot.data!.data.list[index].dosen[dosen].namaPegawai.toString()} ${snapshot.data!.data.list[index].dosen[dosen].gelarBelakang.toString()}",
                                                          style: TextStyle(
                                                            color:
                                                                mainBlueColor,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return Center(
                                                        child: Text(
                                                          "${snapshot.data!.data.list[index].dosen[dosen].namaPegawai.toString()} ${snapshot.data!.data.list[index].dosen[dosen].gelarBelakang.toString()}",
                                                          style: TextStyle(
                                                            color:
                                                                mainBlueColor,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  })
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
                                                      "Hadir",
                                                      style: TextStyle(
                                                          color: mainBlueColor,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data!
                                                          .data
                                                          .list[index]
                                                          .kehadiran
                                                          .hadir
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: mainBlueColor,
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
                                                      "Absen",
                                                      style: TextStyle(
                                                          color: mainBlueColor,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data!
                                                          .data
                                                          .list[index]
                                                          .kehadiran
                                                          .absen
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: mainBlueColor,
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
                                                      "Izin",
                                                      style: TextStyle(
                                                          color: mainBlueColor,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data!
                                                          .data
                                                          .list[index]
                                                          .kehadiran
                                                          .izin
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: mainBlueColor,
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
                                                      _idMonitor(snapshot
                                                          .data!
                                                          .data
                                                          .list[index]
                                                          .idMonitoringPerkuliahan
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
                                                          Icons
                                                              .arrow_forward_ios,
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
                                      )),
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

  Future _idMonitor(String idMonitoringPerkuliahan) async {
    SpUtil.putString("id_monitoring_perkuliahan", idMonitoringPerkuliahan);
    Navigator.pushNamed(context, 'detailmonitorkuliah');
  }
}