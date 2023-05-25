import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:siakad/api/model/home_dosen_model.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

import '../../utilites/constants.dart';

class HomeDosen extends StatefulWidget {
  const HomeDosen({super.key});

  @override
  State<HomeDosen> createState() => _HomeDosenState();
}

class _HomeDosenState extends State<HomeDosen> {
  Future<HomeDosenModel> getHomeDosenData() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(home, headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return HomeDosenModel.fromJson(data);
    } else {
      return HomeDosenModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Dosen"),),
      body: FutureBuilder<HomeDosenModel>(
          future: getHomeDosenData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  ClipPath(
                    clipper: ClipPathClass(),
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xffE9561B),
                      child: Container(
                        margin: const EdgeInsets.only(top: 70, left: 29),
                        child: RichText(
                          text: TextSpan(
                              text: "Hi, ",
                              style: const TextStyle(fontSize: 18),
                              children: [
                                TextSpan(
                                  text: snapshot.data!.data.list.namaDosen,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 110),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ClipPath(
                              clipper: ClipInfoClass(),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                // height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xff005689).withOpacity(0.9),
                                      const Color(0xFF1E3B78),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${snapshot.data!.data.list.namaDosen} ${snapshot.data!.data.list.gelarBelakang}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: mainWhiteColor),
                                              ),
                                              Text(
                                                snapshot.data!.data.list
                                                    .fakultas.namaFakultas,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: mainWhiteColor),
                                              ),
                                              Text(
                                                snapshot.data!.data.list.prodi
                                                    .namaProdi,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: mainWhiteColor),
                                              ),
                                              Text(
                                                snapshot.data!.data.list
                                                    .lokasiPresensi,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: mainWhiteColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: Image.network(
                                                snapshot.data!.data.list.foto)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    // const SizedBox(
                                    //   height: 20,
                                    // ),
                                    // const Divider(
                                    //   color: Colors.white,
                                    // ),
                                    // Text(
                                    //   "Dosen Pembimbing Akademik",
                                    //   style: TextStyle(
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.bold,
                                    //       color: mainWhiteColor),
                                    // ),
                                    // const SizedBox(
                                    //   height: 5,
                                    // ),
                                    // Text(
                                    //   "${snapshot.data!.data.list.dosenPa.namaPegawai} ${snapshot.data!.data.list.dosenPa.gelarBelakang} ",
                                    //   style: TextStyle(
                                    //       fontSize: 16,
                                    //       color: mainWhiteColor),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 85,
                            ),
                            Container(
                              height: 7,
                              color: Colors.grey[300],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const SizedBox(
                                  //   height: 20,
                                  // ),
                                  Text(
                                    "Akademik Dosen",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: mainOrange2Color),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, 'MahasiswaBimbingan');
                                        },
                                        child: const menuAkademik(
                                          image: "assets/img/group.png",
                                          title: "Mahasiswa\nBimbingan",
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, 'SemMonitor');
                                        },
                                        child: const menuAkademik(
                                          image:
                                              "assets/img/transaction-history.png",
                                          title: "Monitoring\nPerkuliahan",
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, 'SemAjar');
                                        },
                                        child: const menuAkademik(
                                          image:
                                              "assets/img/transaction-history.png",
                                          title: "Matakuliah\nPengampu",
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, 'ChatDosen');
                                        },
                                         child: const menuAkademik(
                                            image: "assets/img/chat.png",
                                            title: "Chat",
                                          ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else {
               return const Center(
                      child: CircularProgressIndicator(),
                    );
            }
          }),
    );
  }

   Future _chatDosen(String id_dosen, String nama_pegawai) async {
    SpUtil.putString("id_dosen", id_dosen);
    SpUtil.putString("nama_pegawai", nama_pegawai);
    Navigator.pushNamed(context, 'ChatMhs');
  }
}

class ClipInfoClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width - 80, size.height);
    path.lineTo(size.width, size.height - 80);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class menuAkademik extends StatelessWidget {
  const menuAkademik({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          width: 30,
          height: 30,
          // color: Colors.blue,
          child: Image.asset(image),
        ),
        Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Color(0xFF1E3B78))),
      ],
    );
  }
}
