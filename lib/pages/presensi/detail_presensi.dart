import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../api/model/detail_presensi_model.dart';
import '../../utilites/constants.dart';

class DetailPresensiMhs extends StatefulWidget {
  const DetailPresensiMhs({super.key});

  @override
  State<DetailPresensiMhs> createState() => _DetailPresensiMhsState();
}

class _DetailPresensiMhsState extends State<DetailPresensiMhs> {
  Future<DetailPresensiModel> getDetailPresensi() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(detailpresensi + SpUtil.getString("id_kelas"),
        headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return DetailPresensiModel.fromJson(data);
    } else {
      return DetailPresensiModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Presensi Mahasiswa",
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
              child: FutureBuilder<DetailPresensiModel>(
                  future: getDetailPresensi(),
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
                                  children: [
                                    Column(
                                      children: [
                                        //dosen
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: mainBlueColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Dosen",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: mainWhiteColor,
                                                    fontSize: 18,
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
                                                    return Column(
                                                      children: [
                                                        Text(
                                                          "${snapshot.data!.data.list[index].dosen[dosen].namaPegawai} ${snapshot.data!.data.list[index].dosen[dosen].gelarBelakang}",
                                                          style: TextStyle(
                                                            color:
                                                                mainWhiteColor,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          snapshot.data!.data.list[index].materi
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: mainBlueColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),

                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Jam Mulai",
                                                  style: TextStyle(
                                                    color: mainOrange2Color,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  snapshot.data!.data
                                                      .list[index].jamMulai
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: mainOrange2Color,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Jam Selesai",
                                                  style: TextStyle(
                                                    color: mainOrange2Color,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  snapshot.data!.data
                                                      .list[index].jamSelesai
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: mainOrange2Color,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: mainBlackColor,
                                    ),
                                    // mahasiswa
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        // Text(
                                        //   "Daftar Mahasiswa",
                                        //   textAlign: TextAlign.center,
                                        // style: TextStyle(
                                        //     color: mainOrange2Color,
                                        //     fontSize: 18,
                                        //     fontWeight: FontWeight.bold),
                                        // ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Nama",
                                                  style: TextStyle(
                                                      color: mainOrange2Color,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  snapshot
                                                      .data!
                                                      .data
                                                      .list[index]
                                                      .mahasiswa[8]
                                                      .namaMahasiswa,
                                                  style: TextStyle(
                                                    color: mainBlueColor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Ket",
                                                  style: TextStyle(
                                                      color: mainOrange2Color,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                if(snapshot
                                                      .data!
                                                      .data
                                                      .list[index]
                                                      .mahasiswa[8]
                                                      .kehadiran
                                                      .toString() == "0")(
                                                        Text("Alfa",
                                                  style: TextStyle(
                                                    color: mainBlueColor,
                                                    fontSize: 14,
                                                  ),)
                                                      ),
                                                      if(snapshot
                                                      .data!
                                                      .data
                                                      .list[index]
                                                      .mahasiswa[8]
                                                      .kehadiran
                                                      .toString() == "1")(
                                                        Text("Hadir",
                                                  style: TextStyle(
                                                    color: mainBlueColor,
                                                    fontSize: 14,
                                                  ),)
                                                      ),
                                                      if(snapshot
                                                      .data!
                                                      .data
                                                      .list[index]
                                                      .mahasiswa[8]
                                                      .kehadiran
                                                      .toString() == "0")(
                                                        Text("Izin",
                                                  style: TextStyle(
                                                    color: mainBlueColor,
                                                    fontSize: 14,
                                                  ),)
                                                      ),
                                                
                                              ],
                                            ),
                                          ],
                                        )
                                        // ListView.builder(
                                        //     scrollDirection: Axis.vertical,
                                        //     shrinkWrap: true,
                                        //     itemCount: snapshot.data!.data
                                        //         .list[index].mahasiswa.length,
                                        //     itemBuilder: (context, mhs) {
                                        //       return Column(
                                        //         children: [
                                        //           Row(
                                        //             children: [
                                        //               SizedBox(
                                        //                 width: MediaQuery.of(
                                        //                             context)
                                        //                         .size
                                        //                         .width /
                                        //                     1.5,
                                        //                 child: Column(
                                        //                   mainAxisAlignment:
                                        //                       MainAxisAlignment
                                        //                           .start,
                                        //                   crossAxisAlignment:
                                        //                       CrossAxisAlignment
                                        //                           .start,
                                        //                   children: [
                                        //                     Text(snapshot
                                        //                         .data!
                                        //                         .data
                                        //                         .list[index]
                                        //                         .mahasiswa[mhs]
                                        //                         .noMhs,
                                        //       style: TextStyle(
                                        //         color: mainBlueColor,
                                        //         fontWeight: FontWeight.bold,
                                        //         fontSize: 14,
                                        //       ),),
                                        //                     Text(snapshot
                                        //                         .data!
                                        //                         .data
                                        //                         .list[index]
                                        //                         .mahasiswa[mhs]
                                        //                         .namaMahasiswa,
                                        //       style: TextStyle(
                                        //         color: mainOrange2Color,
                                        //         fontSize: 14,
                                        //       ),),
                                        //                   ],
                                        //                 ),
                                        //               ),
                                        //               Column(
                                        //                 children: [
                                        //                   Text("Status",
                                        //       style: TextStyle(
                                        //          color: mainBlueColor,
                                        //         fontWeight: FontWeight.bold,
                                        //         fontSize: 14,
                                        //       ),),
                                        //                   Text(snapshot
                                        //                       .data!
                                        //                       .data
                                        //                       .list[index]
                                        //                       .mahasiswa[mhs]
                                        //                       .kehadiran
                                        //                       .toString(),
                                        //       style: TextStyle(
                                        //         color: mainOrange2Color,
                                        //         fontSize: 14,
                                        //       ),),
                                        //                 ],
                                        //               ),
                                        //             ],
                                        //           ),
                                        //           const SizedBox(
                                        //             height: 10,
                                        //           ),
                                        //         ],
                                        //       );
                                        //     }),
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
                  }))
        ],
      ),
    );
    ;
  }
}
