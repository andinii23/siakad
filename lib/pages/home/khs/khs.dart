import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../api/model/khs_model.dart';
import '../../../utilites/constants.dart';

class KhsMhs extends StatefulWidget {
  const KhsMhs({super.key});

  @override
  State<KhsMhs> createState() => _KhsMhsState();
}

class _KhsMhsState extends State<KhsMhs> {
  Future<KhsModel> getKhsData() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(khs, headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return KhsModel.fromJson(data);
    } else {
      return KhsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "KHS Mahasiswa",
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
            child: FutureBuilder<KhsModel>(
                future: getKhsData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Daftar KHS Mahasiswa",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: mainBlueColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
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
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
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
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(snapshot
                                                .data!.data.list[index].semester
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: mainWhiteColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                        ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemCount: snapshot
                                                .data!
                                                .data
                                                .list[index]
                                                .listMataKuliah
                                                .length,
                                            itemBuilder: (context, mk) {
                                              return Center(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: SizedBox(
                                                            width: 200,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data
                                                                      .list[
                                                                          index]
                                                                      .listMataKuliah[
                                                                          mk]
                                                                      .kodeMatakuliah,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      color:
                                                                          mainBlueColor,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data
                                                                      .list[
                                                                          index]
                                                                      .listMataKuliah[
                                                                          mk]
                                                                      .namaMatakuliah
                                                                      .toUpperCase(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      color:
                                                                          mainOrange2Color,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  "Total SKS : ${snapshot.data!.data.list[index].listMataKuliah[mk].sksTotal}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      color:
                                                                          mainOrange2Color,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  "Status",
                                                                  style: TextStyle(
                                                                      color:
                                                                          mainOrange2Color,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight.bold),
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data
                                                                      .list[
                                                                          index]
                                                                      .listMataKuliah[
                                                                          mk]
                                                                      .status
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        mainOrange2Color,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              width: 12,
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                  "Nilai Huruf",
                                                                  style: TextStyle(
                                                                      color:
                                                                          mainOrange2Color,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight.bold),
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data
                                                                      .list[
                                                                          index]
                                                                      .listMataKuliah[
                                                                          mk]
                                                                      .nilai
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        mainOrange2Color,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      color: mainBlackColor,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            })
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
                }),
          ),
        ],
      ),
    );
  }
}
