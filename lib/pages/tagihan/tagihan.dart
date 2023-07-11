import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../api/model/tagihan_model.dart';
import '../../utilites/constants.dart';

class Tagihan extends StatefulWidget {
  const Tagihan({super.key});

  @override
  State<Tagihan> createState() => _TagihanState();
}

class _TagihanState extends State<Tagihan> {
  Future<TagihanModel> getTagihanData() async {
    var header = {"Authorization": "Bearer ${SpUtil.getString("token")}"};
    var response = await http.get(tagihan, headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return TagihanModel.fromJson(data);
    } else {
      return TagihanModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tagihan Mahasiswa",
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
              child: FutureBuilder<TagihanModel>(
                  future: getTagihanData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.data.list.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  const BorderRadius.only(
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
                                              children: <Widget>[
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: mainBlueColor,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(5),
                                                      topRight:
                                                          Radius.circular(5),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      snapshot
                                                          .data!
                                                          .data
                                                          .list[index]
                                                          .keterangan
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: mainWhiteColor,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: const <
                                                            Widget>[
                                                          Text(
                                                            "Bank",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xffE9561B)),
                                                          ),
                                                          Text(
                                                            "No. Ref",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xffE9561B)),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .data
                                                                .list[index]
                                                                .bank.toString(),
                                                            style: const TextStyle(
                                                                color: Color(
                                                                    0xFF1E3B78)),
                                                          ),
                                                          Text(
                                                              snapshot
                                                                  .data!
                                                                  .data
                                                                  .list[index]
                                                                  .bankRef.toString(),
                                                              style: const TextStyle(
                                                                  color: Color(
                                                                      0xFF1E3B78))),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: const <
                                                            Widget>[
                                                          Text(
                                                            "No Tagihan",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xffE9561B)),
                                                          ),
                                                          Text(
                                                            "Nominal",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xffE9561B)),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .data
                                                                .list[index]
                                                                .idTagihan.toString(),
                                                            style: const TextStyle(
                                                                color: Color(
                                                                    0xFF1E3B78)),
                                                          ),
                                                          Text(
                                                              "Rp. ${snapshot.data!.data.list[index].nominal.toString()}",
                                                              style: const TextStyle(
                                                                  color: Color(
                                                                      0xFF1E3B78))),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
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
                                                            "Mulai Bayar",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    mainOrange2Color),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .data
                                                                .list[index]
                                                                .waktuOpen
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color:
                                                                    mainBlueColor),
                                                          ),
                                                          Text(
                                                            "Batas Akhir Pembayaran",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    mainOrange2Color),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .data
                                                                .list[index]
                                                                .waktuClose
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color:
                                                                    mainBlueColor),
                                                          ),
                                                          Text(
                                                            "Tanggal Bayar",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    mainOrange2Color),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .data
                                                                .list[index]
                                                                .waktuBayar
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color:
                                                                    mainBlueColor),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          // Column(
                                                          //   children: [
                                                          //     const Text(
                                                          //       "Keterangan Cicilan UKT",
                                                          //       style: TextStyle(
                                                          //           fontSize:
                                                          //               18,
                                                          //           fontWeight:
                                                          //               FontWeight
                                                          //                   .bold,
                                                          //           color: Color(
                                                          //               0xffE9561B)),
                                                          //     ),
                                                          //     const SizedBox(
                                                          //       height: 5,
                                                          //     ),
                                                          //     Text(
                                                          //         snapshot
                                                          //             .data!
                                                          //             .data
                                                          //             .list[
                                                          //                 index]
                                                          //             .keteranganCicilanUkt
                                                          //             .toString(),
                                                          //         style: const TextStyle(
                                                          //             color: Color(
                                                          //                 0xFF1E3B78))),
                                                          //   ],
                                                          // ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }))
                        ],
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
