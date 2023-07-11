import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../api/model/dosen_monitor_model.dart';
import '../../../api/model/mhsmonitormodel.dart';
import '../../../utilites/constants.dart';

class TambahPertemuan extends StatefulWidget {
  const TambahPertemuan({super.key});

  @override
  State<TambahPertemuan> createState() => _TambahPertemuanState();
}

class _TambahPertemuanState extends State<TambahPertemuan> {
  final _formState = GlobalKey<FormState>();
  Future<DsnMonitorModel> getDosen() async {
    var header = {"Authorization": "Bearer ${SpUtil.getString("token")}"};
    var response = await http.get(
        "$monitorkuliah${SpUtil.getString("id_sem")}&id_kelas=${SpUtil.getString("id_kelass")}",
        headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return DsnMonitorModel.fromJson(data);
    } else {
      return DsnMonitorModel.fromJson(data);
    }
  }

  Future<MahasiswaMonitor> getMhsMonitor() async {
    var header = {"Authorization": "Bearer ${SpUtil.getString("token")}"};
    var response = await http.get(mhsmonitor, headers: header);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return MahasiswaMonitor.fromJson(data);
    } else {
      return MahasiswaMonitor.fromJson(data);
    }
  }

  final selectedIndex = [];
  final selectedIndex2 = [];

  bool selectAllMahasiswa = false;
  String dsn = "";
  String idDosenn = "";

  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _mulaiController = TextEditingController();
  TextEditingController _selesaiController = TextEditingController();
  TextEditingController _materiController = TextEditingController();
  TextEditingController _ketController = TextEditingController();

  @override
  void dispose() {
    _tanggalController.dispose();
    _mulaiController.dispose();
    _selesaiController.dispose();
    _materiController.dispose();
    // _ketController.dispose();
    super.dispose();
  }

  void selectIndexWithID(int id) {
    if (selectedIndex.contains(id)) {
      selectedIndex.remove(id); // Unselect
    } else {
      selectedIndex.add(id); // Select
    }
  }

  void selectIndexWithID2(int id) {
    if (selectedIndex2.contains(id)) {
      selectedIndex2.remove(id); // Unselect
    } else {
      selectedIndex2.add(id); // Select
    }
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
                key: _formState,
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
                          TextFormField(
                            controller: _tanggalController,
                            validator: (value) {
                              if (value == '') {
                                return "tanggal harus diisi!!";
                              }
                            },
                            onTap: () async {
                              DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));

                              if (pickeddate != null) {
                                setState(() {
                                  _tanggalController.text =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickeddate);
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
                                  validator: (value) {
                                    if (value == '') {
                                      return "jam mulai harus diisi!!";
                                    }
                                  },
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
                                  validator: (value) {
                                    if (value == '') {
                                      return "jam selesai harus diisi!!";
                                    }
                                  },
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
                          fontSize: 14,
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
                                        itemBuilder: (context, dsn) {
                                          final idDosen = snapshot.data!.data
                                              .list.listKelas[index].dosen[dsn];
                                          return CheckboxListTile(
                                            title: Text(
                                                "${idDosen.namaPegawai.toString()} ${idDosen.gelarBelakang.toString()}"),
                                            value: selectedIndex
                                                .contains(idDosen.idDosen),
                                            onChanged: (val) {
                                              setState(() {
                                                selectIndexWithID(
                                                    idDosen.idDosen);
                                                print(selectedIndex);
                                              });
                                            },
                                          );
                                        });
                                  });
                            } else {
                              return const Text("");
                            }
                          }),
                      const SizedBox(
                        height: 10,
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
                            validator: (value) {
                              if (value == '') {
                                return "materi harus diisi!!";
                              }
                            },
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Keterangan",
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
                            controller: _ketController,
                            decoration: const InputDecoration(
                              hintText: "Keterangan",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Daftar Mahasiswa",
                        style: TextStyle(
                          color: mainBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      FutureBuilder(
                          future: getMhsMonitor(),
                          builder: (context, snapshot) {
                            return CheckboxListTile(
                              title: const Text("Select All"),
                              value: selectAllMahasiswa,
                              onChanged: (value) {
                                setState(() {
                                  selectAllMahasiswa = value!;
                                  if (selectAllMahasiswa) {
                                    selectedIndex2.clear();
                                    // Tambahkan semua ID mahasiswa ke dalam selectedIndex2
                                    final mhsList =
                                        snapshot.data!.data.list.mahasiswa;
                                    for (var i = 0; i < mhsList.length; i++) {
                                      selectedIndex2.add(mhsList[i].idMhsPt);
                                    }
                                  } else {
                                    selectedIndex2.clear();
                                  }
                                  print(selectedIndex2);
                                });
                              },
                            );
                          }),

                      FutureBuilder(
                          future: getMhsMonitor(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount:
                                      snapshot.data!.data.list.mahasiswa.length,
                                  itemBuilder: (context, mhs) {
                                    final idMhs =
                                        snapshot.data!.data.list.mahasiswa[mhs];
                                    return Column(
                                      children: [
                                        CheckboxListTile(
                                            title: Text(snapshot.data!.data.list
                                                .mahasiswa[mhs].namaMahasiswa
                                                .toString()),
                                            value: selectAllMahasiswa
                                                ? selectAllMahasiswa
                                                : selectedIndex2
                                                    .contains(idMhs.idMhsPt),
                                            onChanged: (valmhs) {
                                              setState(() {
                                                selectIndexWithID2(
                                                    idMhs.idMhsPt);
                                                print(selectedIndex2);
                                              });
                                            }),
                                      ],
                                    );
                                  });
                            } else {
                              return const Text("");
                            }
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formState.currentState!.validate()) {
                              postData();
                            } else {
                              print("validasi gagal");
                            }
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
      'dosen': selectedIndex,
      'materi': _materiController.text,
      'keterangan': _ketController.text,
      'mahasiswa': selectedIndex2,
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
