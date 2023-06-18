import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;
import '../../../api/model/krs_mhs_dosen_model.dart';
import '../../../utilites/constants.dart';

class MhsKrsDosen extends StatefulWidget {
  const MhsKrsDosen({super.key});

  @override
  State<MhsKrsDosen> createState() => _MhsKrsDosenState();
}

class _MhsKrsDosenState extends State<MhsKrsDosen> {
  TextEditingController _pesanController = TextEditingController();

  @override
  void dispose() {
    _pesanController.dispose();
    super.dispose();
  }

  Future<KrsMhsDosenModel> getDetailKrsMhs() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(
        krs_mhs_bimbingan + SpUtil.getString("id_mhs_pt"),
        headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return KrsMhsDosenModel.fromJson(data);
    } else {
      return KrsMhsDosenModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "KRS Mahasiswa Bimbingan",
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
                  future: getDetailKrsMhs(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xFF1E3B78).withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 4,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 140,
                                        child: Text(
                                          "Nama Mahasiswa",
                                          style: TextStyle(
                                              color: mainBlueColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    SizedBox(
                                      width: 15,
                                      child: Text(
                                        ":",
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 170,
                                      child: Text(
                                        snapshot.data!.data.list.namaMahasiswa,
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        "NIM Mahasiswa",
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                      child: Text(
                                        ":",
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 170,
                                      child: Text(
                                        snapshot.data!.data.list.noMahasiswa,
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        "Program Studi",
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                      child: Text(
                                        ":",
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 170,
                                      child: Text(
                                        snapshot
                                            .data!.data.list.prodi.namaProdi,
                                        style: TextStyle(
                                          color: mainBlueColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        "Angkatan",
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                      child: Text(
                                        ":",
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 170,
                                      child: Text(
                                        snapshot.data!.data.list.angkatan,
                                        style: TextStyle(
                                          color: mainBlueColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 140,
                                      child: Text(
                                        "Status",
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                      child: Text(
                                        ":",
                                        style: TextStyle(
                                            color: mainBlueColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 170,
                                      child: Text(
                                        snapshot.data!.data.list.statusText,
                                        style: TextStyle(
                                          color: mainBlueColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (snapshot.data!.data.list.krs.statusKrs
                                  .toString() ==
                              "1")
                            (Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: mainWhiteColor,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                snapshot.data!.data.list.krs.statusKrsText,
                                style: TextStyle(
                                  color: mainBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                          if (snapshot.data!.data.list.krs.statusKrs
                                  .toString() ==
                              "2")
                            (Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: mainWhiteColor,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                snapshot.data!.data.list.krs.statusKrsText,
                                style: TextStyle(
                                  color: mainWhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                          if (snapshot.data!.data.list.krs.statusKrs
                                  .toString() ==
                              "3")
                            (Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: mainWhiteColor,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                snapshot.data!.data.list.krs.statusKrsText,
                                style: TextStyle(
                                  color: mainWhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                            if(snapshot.data!.data.list.krs.statusKrs
                                  .toString() !=
                              "3")
                          (Expanded(
                            child: Padding(
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
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: mainWhiteColor,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color: mainOrange2Color,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(16),
                                                  topRight: Radius.circular(16),
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                "List Matakuliah",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: mainWhiteColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  shrinkWrap: true,
                                                  itemCount: snapshot.data!.data
                                                      .list.krs.listKrs.length,
                                                  itemBuilder: (context, mk) {
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 8),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: const Color(
                                                                          0xFF1E3B78)
                                                                      .withOpacity(
                                                                          0.1),
                                                                  spreadRadius:
                                                                      5,
                                                                  blurRadius: 4,
                                                                  offset: const Offset(
                                                                      0,
                                                                      3), // changes position of shadow
                                                                ),
                                                              ],
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "${snapshot.data!.data.list.krs.listKrs[mk].matakuliah.kodeMatakuliah} : ${snapshot.data!.data.list.krs.listKrs[mk].matakuliah.namaMatakuliah}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      color:
                                                                          mainBlackColor,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  "Ruang ${snapshot.data!.data.list.krs.listKrs[mk].kelas.kodeKelas}",
                                                                  style: TextStyle(
                                                                      color:
                                                                          mainBlackColor),
                                                                ),
                                                                Text(
                                                                  "Semester ${snapshot.data!.data.list.krs.listKrs[mk].kelas.semester}",
                                                                  style: TextStyle(
                                                                      color:
                                                                          mainBlackColor),
                                                                ),
                                                                Text(
                                                                  "${snapshot.data!.data.list.krs.listKrs[mk].matakuliah.sksTotal} SKS",
                                                                  style: TextStyle(
                                                                      color:
                                                                          mainBlackColor),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                          if (snapshot.data!.data.list.krs.statusKrs
                                  .toString() ==
                              "1")
                            (Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: SizedBox(
                                                child: TextFormField(
                                                  controller: _pesanController,
                                                  decoration: const InputDecoration(
                                                      labelText: "Pesan",
                                                      hintText: "Pesan",
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                              ),
                                              actions: [
                                                MaterialButton(
                                                  onPressed: () {
                                                    _tolakMk();
                                                  },
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                        color: mainBlueColor),
                                                  ),
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    child: Container(
                                        width: 80,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "Refisi",
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: mainBlackColor),
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _terimaMk();
                                    },
                                    child: Container(
                                        width: 80,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: mainBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "Terima",
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: mainWhiteColor),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                          if (snapshot.data!.data.list.krs.statusKrs
                                  .toString() ==
                              "2")
                            (Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: SizedBox(
                                                child: TextFormField(
                                                  controller: _pesanController,
                                                  decoration: const InputDecoration(
                                                      labelText: "Pesan",
                                                      hintText: "Pesan",
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                              ),
                                              actions: [
                                                MaterialButton(
                                                  onPressed: () {
                                                    _tolakMk();
                                                  },
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                        color: mainBlueColor),
                                                  ),
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    child: Container(
                                        width: 80,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "Refisi",
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: mainBlackColor),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                          if (snapshot.data!.data.list.krs.statusKrs
                                  .toString() ==
                              "3")
                            (Text(""))
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

  Future _terimaMk() async {
    var header = {"Authorization": "Bearer ${SpUtil.getString("token")}"};
    var response = await http.post(terima_krs, headers: header, body: {
      "id_mhs_pt": SpUtil.getString("id_mhs_pt"),
      "status": "2",
    });
    if (response.statusCode == 200) {
      print(response.body);
      Navigator.pushNamed(context, 'KrsMhsDosen');
    } else {
      print("gagal menambahkan kelas");
      var body = jsonDecode(response.body);
      print(body["error_message"]);
    }
  }

  Future _tolakMk() async {
    var header = {"Authorization": "Bearer ${SpUtil.getString("token")}"};
    var response = await http.post(terima_krs, headers: header, body: {
      "id_mhs_pt": SpUtil.getString("id_mhs_pt"),
      "status": "3",
      "pesan": _pesanController.text,
    });
    if (response.statusCode == 200) {
      print(response.body);
      Navigator.pushNamed(context, 'KrsMhsDosen');
    } else {
      print("gagal menambahkan kelas");
      var body = jsonDecode(response.body);
      print(body["error_message"]);
    }
  }
}
