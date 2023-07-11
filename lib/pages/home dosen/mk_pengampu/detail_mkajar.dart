import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../api/model/mkajardetailmodel.dart';
import '../../../utilites/constants.dart';

class DetailMkAjar extends StatefulWidget {
  const DetailMkAjar({super.key});

  @override
  State<DetailMkAjar> createState() => _DetailMkAjarState();
}

class _DetailMkAjarState extends State<DetailMkAjar> {
  Future<MkAjarDetailModel> getDetailMkAjar() async {
    var header = {"Authorization": "Bearer ${SpUtil.getString("token")}"};
    var response = await http.get(detailmkajar + SpUtil.getString("id_kelas"),
        headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return MkAjarDetailModel.fromJson(data);
    } else {
      return MkAjarDetailModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Detail Matakuliah Ajar",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 20,
                color: mainBlackColor,
                fontWeight: FontWeight.w700),
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
                    future: getDetailMkAjar(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "PROGRAM STUDI ${snapshot.data!.data.list.prodi.namaProdi.toUpperCase()}",
                                        style: TextStyle(
                                          color: mainBlueColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Row(
                                      //   children: [
                                      //     SizedBox(
                                      //       width: MediaQuery.of(context)
                                      //               .size
                                      //               .width /
                                      //           3,
                                      //       child: Text(
                                      //         "Kelas",
                                      //         style: TextStyle(
                                      //           color: mainBlackColor,
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.bold,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       child: Text(
                                      //         ":",
                                      //         style: TextStyle(
                                      //           color: mainBlackColor,
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.bold,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       width: MediaQuery.of(context)
                                      //               .size
                                      //               .width /
                                      //           3,
                                      //       child: Text(
                                      //         snapshot.data!.data.list.kodeKelas,
                                      //         style: TextStyle(
                                      //           color: mainBlackColor,
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.bold,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        // color: Colors.amber,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  child: Text(
                                                    "Matakuliah",
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                  child: Text(
                                                    ":",
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: Text(
                                                    snapshot
                                                        .data!
                                                        .data
                                                        .list
                                                        .matakuliah
                                                        .namaMatakuliah,
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  child: Text(
                                                    "Jumlah SKS",
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                  child: Text(
                                                    ":",
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  child: Text(
                                                    snapshot.data!.data.list
                                                        .matakuliah.sksTotal,
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  child: Text(
                                                    "Jadwal",
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                  child: Text(
                                                    ":",
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: Text(
                                                    "${snapshot.data!.data.list.hari}, ${snapshot.data!.data.list.jamMulai} - ${snapshot.data!.data.list.jamSelesai}",
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  child: Text(
                                                    "Ruang",
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                  child: Text(
                                                    ":",
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: Text(
                                                    snapshot.data!.data.list
                                                        .ruangKuliah.namaRuang,
                                                    style: TextStyle(
                                                      color: mainBlackColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            )
                                          ],
                                        ),
                                      ),

                                      // Row(
                                      //   children: [
                                      //     SizedBox(
                                      //       width: MediaQuery.of(context)
                                      //               .size
                                      //               .width /
                                      //           3,
                                      //       child: Text(
                                      //         "PROGRAM STUDI",
                                      //         style: TextStyle(
                                      //           color: mainBlackColor,
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.bold,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       width: 10,
                                      //       child: Text(
                                      //         ":",
                                      //         style: TextStyle(
                                      //           color: mainBlackColor,
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.bold,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       width: MediaQuery.of(context)
                                      //               .size
                                      //               .width /
                                      //           3,
                                      //       child: Text(
                                      //         snapshot.data!.data.list.prodi
                                      //             .namaProdi
                                      //             .toUpperCase(),
                                      //         style: TextStyle(
                                      //           color: mainBlackColor,
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.bold,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
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
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      decoration: BoxDecoration(
                                        color: mainWhiteColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                        ),
                                      ),
                                      child: Text(
                                        "Daftar Mahasiswa",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2,
                                      color: mainBlueColor,
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
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                          child: Text(
                                                            snapshot
                                                                .data!
                                                                .data
                                                                .list
                                                                .mahasiswa[mhs]
                                                                .namaMahasiswa
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .grey
                                                                    .shade800),
                                                          )),
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
                                                            color: Colors
                                                                .grey.shade800),
                                                      )
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
        ));
  }
}