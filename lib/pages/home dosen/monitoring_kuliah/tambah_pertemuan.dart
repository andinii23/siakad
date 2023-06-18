import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../api/model/dosen_monitor_model.dart';
import '../../../utilites/constants.dart';

class TambahPertemuan extends StatefulWidget {
  const TambahPertemuan({super.key});

  @override
  State<TambahPertemuan> createState() => _TambahPertemuanState();
}

class _TambahPertemuanState extends State<TambahPertemuan> {
  Future<DosenMonitorModel> getDosen() async {
    var header = {"Authorization": "Bearer ${SpUtil.getString("token")}"};
    var response = await http.get(
        "$monitorkuliah${SpUtil.getString("id_sem")}&id_kelas=${SpUtil.getString("id_kelass")}",
        headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return DosenMonitorModel.fromJson(data);
    } else {
      return DosenMonitorModel.fromJson(data);
    }
  }

  bool onTap = false;
  String dsn = "";
  String idDosen = "";

  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _mulaiController = TextEditingController();
  TextEditingController _selesaiController = TextEditingController();
  TextEditingController _materiController = TextEditingController();
  // TextEditingController _ketController = TextEditingController();

  @override
  void dispose() {
    _tanggalController.dispose();
    _mulaiController.dispose();
    _selesaiController.dispose();
    _materiController.dispose();
    // _ketController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tambah Pertemuan",
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
      body: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
                child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tanggal",
                        style: TextStyle(
                          color: mainBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _tanggalController,
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickeddate != null) {
                            setState(() {
                              _tanggalController.text =
                                  DateFormat('yyyy-MM-dd').format(pickeddate);
                            });
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: "Tanggal",
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.calendar_month))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jam Perkuliahan",
                        style: TextStyle(
                          color: mainBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: _mulaiController,
                              decoration: const InputDecoration(
                                hintText: "Mulai",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: _selesaiController,
                              decoration: const InputDecoration(
                                hintText: "Selesai",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Dosen Hadir",
                    style: TextStyle(
                      color: mainBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      dsn,
                      style: TextStyle(color: mainBlackColor),
                    ),
                  ),
                  // Text(
                  //   idDosen,
                  //   style: TextStyle(color: mainBlackColor),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pilih Dosen Hadir",
                    style: TextStyle(
                      color: mainBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  FutureBuilder(
                      future: getDosen(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount:
                                  snapshot.data!.data.list.listKelas.length,
                              itemBuilder: (context, index) {
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.data.list
                                        .listKelas[index].dosen.length,
                                    itemBuilder: (context, dosen) {
                                      return Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  dsn = snapshot
                                                      .data!
                                                      .data
                                                      .list
                                                      .listKelas[index]
                                                      .dosen[dosen]
                                                      .namaPegawai;
                                                  idDosen = snapshot
                                                      .data!
                                                      .data
                                                      .list
                                                      .listKelas[index]
                                                      .dosen[dosen]
                                                      .idDosen
                                                      .toString();
                                                  onTap = true;
                                                });
                                              },
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  color: onTap
                                                      ? mainWhiteColor
                                                      : mainWhiteColor,
                                                  child: Text(snapshot
                                                      .data!
                                                      .data
                                                      .list
                                                      .listKelas[index]
                                                      .dosen[dosen]
                                                      .namaPegawai)),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              });
                        } else {
                          return const Text("");
                        }
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Materi",
                        style: TextStyle(
                          color: mainBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _materiController,
                        decoration: const InputDecoration(
                          hintText: "Materi",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "Keterangan",
                  //       style: TextStyle(
                  //         color: mainBlackColor,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     TextFormField(
                  //       controller: _ketController,
                  //       decoration: const InputDecoration(
                  //         hintText: "Keterangan",
                  //         border: OutlineInputBorder(),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        postData();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(mainBlueColor),
                      ),
                      child: const Text(
                        "Simpan",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
        ),
      )),
    );
  }

  Future<void> postData() async {
  
  Map<String, dynamic> data = {
    'tanggal': _tanggalController.text,
    'jam_mulai': _mulaiController.text,
    'jam_selesai': _selesaiController.text,
    'dosen': [idDosen],
    'materi': _materiController.text,
  };
  
  final response = await http.post(
    Uri.parse(tambah + SpUtil.getString("id_kelass")),
    headers: <String, String>{
      'Authorization': 'Bearer ${SpUtil.getString("token")}',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );
  
  if (response.statusCode == 200) {
    // Data berhasil terkirim
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, 'monitorperkelas');
    print('Data berhasil terkirim');
    print(response.body);
  } else {
    // Terjadi kesalahan saat mengirim data
    print('Error: ${response.statusCode}');
  }
}
}
