import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../api/model/kurikulum_model.dart';
import '../../../utilites/constants.dart';

class KurikulumMhs extends StatefulWidget {
  const KurikulumMhs({super.key});

  @override
  State<KurikulumMhs> createState() => _KurikulumMhsState();
}

class _KurikulumMhsState extends State<KurikulumMhs> {
  Future<KurikulumModel> getKurikulumData() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(kurikulum, headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return KurikulumModel.fromJson(data);
    } else {
      return KurikulumModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Kurikulum Mahasiswa",
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
              child: FutureBuilder<KurikulumModel>(
            future: getKurikulumData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      // color: Colors.amber,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Detail Kurikulum",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: mainBlueColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data!.data.list.namaKurikulum
                                .toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: mainBlueColor,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Total SKS",
                                    style: TextStyle(
                                        color: mainOrange2Color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.data.list.totalSks,
                                    style: TextStyle(
                                      color: mainOrange2Color,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "SKS Wajib",
                                    style: TextStyle(
                                        color: mainOrange2Color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.data.list.jumlahSksWajib,
                                    style: TextStyle(
                                      color: mainOrange2Color,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "SKS Pilihan",
                                    style: TextStyle(
                                        color: mainOrange2Color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.data.list.jumlahSksPilihan,
                                    style: TextStyle(
                                      color: mainOrange2Color,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount:
                              snapshot.data!.data.list.listMataKuliah.length,
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
                                    Text(
                                      "SEMESTER : ${snapshot.data!.data.list.listMataKuliah[index].semester}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: mainBlueColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5,),
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
                                      child: Column(
                                        children: [
                                          Text(
                                            snapshot
                                                .data!
                                                .data
                                                .list
                                                .listMataKuliah[index]
                                                .kodeMatakuliah,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: mainWhiteColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot
                                                .data!
                                                .data
                                                .list
                                                .listMataKuliah[index]
                                                .namaMatakuliah,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: mainWhiteColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
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
                                                "Total SKS",
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
                                                    .listMataKuliah[index]
                                                    .sksTotal,
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
                                                "SKS\nTatap Muka",
                                                textAlign: TextAlign.center,
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
                                                    .listMataKuliah[index]
                                                    .sksTatapMuka,
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
                                                "SKS Praktek",
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
                                                    .listMataKuliah[index]
                                                    .sksPraktek
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
                                    Divider(
                                      color: mainBlackColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "SKS Lapangan",
                                              style: TextStyle(
                                                  color: mainOrange2Color,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot
                                                  .data!
                                                  .data
                                                  .list
                                                  .listMataKuliah[index]
                                                  .sksLapangan
                                                  .toString(),
                                              style: TextStyle(
                                                color: mainOrange2Color,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "SKS Simulasi",
                                              style: TextStyle(
                                                  color: mainOrange2Color,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot
                                                  .data!
                                                  .data
                                                  .list
                                                  .listMataKuliah[index]
                                                  .sksSimulasi
                                                  .toString(),
                                              style: TextStyle(
                                                color: mainOrange2Color,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    //semester
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //         "Semester : ${snapshot.data!.data.list.listMataKuliah[index].semester}"),
                                    //     Text(snapshot.data!.data.list
                                    //         .listMataKuliah[index].wajib),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                );
              } else {
                return const Text("Loading");
              }
            },
          )),
        ],
      ),
    );
  }
}
