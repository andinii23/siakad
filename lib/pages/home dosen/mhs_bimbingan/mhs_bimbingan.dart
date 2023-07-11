import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../api/model/home_dosen_model.dart';
import '../../../api/model/mhs_bimbingan_dosen_model.dart';
import '../../../utilites/constants.dart';

class MhsBimbingan extends StatefulWidget {
  const MhsBimbingan({super.key});

  @override
  State<MhsBimbingan> createState() => _MhsBimbinganState();
}

class _MhsBimbinganState extends State<MhsBimbingan> {
  Future<MhsBimbinganModel> getHomeDosenData() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(mhs_bimbingan, headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return MhsBimbinganModel.fromJson(data);
    } else {
      return MhsBimbinganModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Mahasiswa Bimbingan",
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
             Navigator.pushNamed(context, 'HomeDosen');
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getHomeDosenData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(16),
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
                        child: ListView.builder(
                            itemCount: snapshot.data!.data.list.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.data.list[index]
                                                  .namaMahasiswa,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: mainOrange2Color),
                                            ),
                                            Text(
                                              snapshot.data!.data.list[index]
                                                  .noMahasiswa,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: mainBlueColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Status Mahasiswa",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: mainOrange2Color),
                                            ),
                                            if (snapshot.data!.data.list[index]
                                                    .idStatusMahasiswa
                                                    .toString() ==
                                                "A")
                                              (Text(
                                                "Aktif",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: mainBlueColor),
                                              )),
                                          ],
                                        ),
                                      ),
                                      if (snapshot
                                              .data!.data.list[index].statusKrs
                                              .toString() ==
                                          "1")
                                        (InkWell(
                                          onTap: () {
                                            _krsMhs(snapshot
                                                .data!.data.list[index].idMhsPt
                                                .toString());
                                          },
                                          child: Container(
                                            width: 60,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              "Menunggu Persetujuan",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: mainBlackColor),
                                            ),
                                          ),
                                        )),
                                      if (snapshot
                                              .data!.data.list[index].statusKrs
                                              .toString() ==
                                          "2")
                                        (InkWell(
                                          onTap: () {
                                            _krsMhs(snapshot
                                                .data!.data.list[index].idMhsPt
                                                .toString());
                                          },
                                          child: Container(
                                            width: 60,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              "Telah ACC",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: mainWhiteColor),
                                            ),
                                          ),
                                        )),
                                      if (snapshot
                                              .data!.data.list[index].statusKrs
                                              .toString() ==
                                          "3")
                                        (InkWell(
                                          onTap: () {
                                            _krsMhs(snapshot
                                                .data!.data.list[index].idMhsPt
                                                .toString());
                                          },
                                          child: Container(
                                            width: 60,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              "Ditolak",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: mainWhiteColor),
                                            ),
                                          ),
                                        )),
                                        if (snapshot
                                              .data!.data.list[index].statusKrs
                                               ==
                                          null)
                                        (InkWell(
                                          onTap: () {
                                            _krsMhs(snapshot
                                                .data!.data.list[index].idMhsPt
                                                .toString());
                                          },
                                          child: Container(
                                            width: 60,
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              "-",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: mainWhiteColor
                                                  , fontSize: 24),
                                            ),
                                          ),
                                        )),
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
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
        ],
      ),
    );
  }

  Future _krsMhs(String id_mhs_pt) async {
    SpUtil.putString("id_mhs_pt", id_mhs_pt);
    Navigator.pushNamed(context, 'KrsMhsDosen');
  }
}
