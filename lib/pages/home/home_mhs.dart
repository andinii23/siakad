import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:siakad/api/model/home_model.dart';
import 'package:siakad/utilites/constants.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class HomeMhs extends StatefulWidget {
  const HomeMhs({super.key});

  @override
  State<HomeMhs> createState() => _HomeMhsState();
}

class _HomeMhsState extends State<HomeMhs> {
  Future<HomeModel> getHomeData() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(home, headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return HomeModel.fromJson(data);
    } else {
      return HomeModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: RichText(text: const TextSpan(text: "Hi, ",style: TextStyle(fontSize: 18), children: [
        //     TextSpan(
        //       text: "Nurandini. P",
        //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //     ),
        //   ]), ),
        //   automaticallyImplyLeading: false,
        //   elevation: 0,
        //   centerTitle:false,
        //   backgroundColor: const Color(0xffE9561B),
        // ),
        body: FutureBuilder<HomeModel>(
            future: getHomeData(),
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
                                    text:
                                        snapshot.data!.data.list.namaMahasiswa,
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 25),
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
                                        const Color(0xff005689)
                                            .withOpacity(0.9),
                                        const Color(0xFF1E3B78),
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data!.data.list
                                                    .noMahasiswa,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: mainWhiteColor),
                                              ),
                                              Text(
                                                snapshot.data!.data.list.prodi
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
                                                snapshot
                                                    .data!.data.list.angkatan,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: mainWhiteColor),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              width: 100,
                                              height: 100,
                                              child: Image(
                                                  image: NetworkImage(snapshot
                                                      .data!.data.list.foto)))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Divider(
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Dosen Pembimbing Akademik",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: mainWhiteColor),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${snapshot.data!.data.list.dosenPa.gelarDepan} ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: mainWhiteColor),
                                          ),
                                          Text(
                                            "${snapshot.data!.data.list.dosenPa.namaPegawai} ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: mainWhiteColor),
                                          ),
                                          Text(
                                            snapshot.data!.data.list.dosenPa
                                                .gelarBelakang,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: mainWhiteColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    StatusCard(
                                      title: "IP\nSebelumnya",
                                      data: snapshot
                                          .data!.data.list.ipSebelumnya
                                          .toString(),
                                    ),
                                    StatusCard(
                                      title: "Semester",
                                      data: snapshot.data!.data.list.semester
                                          .toString(),
                                    ),
                                    StatusCard(
                                      title: "IPK\nSementara",
                                      data: snapshot.data!.data.list.ipk
                                          .toString(),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                          Container(
                            height: 7,
                            color: Colors.grey[300],
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.blue,
                              child: Column(children: [
                                //body
                                Expanded(
                                    child: ListView(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Akademik",
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
                                                context, 'RegisterPage');
                                          },
                                          child: const menuAkademik(
                                            image: "assets/img/transaction-history.png",
                                            title: "Riwayat\nRegistrasi",
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, 'PresensiMhs');
                                          },
                                          child: const menuAkademik(
                                            image: "assets/img/kehadiran.png",
                                            title: "Presensi",
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, 'KurikulumMhs');
                                          },
                                          child: const menuAkademik(
                                            image: "assets/img/resume.png",
                                            title: "Kurikulum",
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, 'KhsMhs');
                                          },
                                          child: const menuAkademik(
                                            image: "assets/img/academy.png",
                                            title: "KHS",
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        menuAkademik(
                                          image: "assets/img/transaction-history.png",
                                          title: "Riwayat\nRegistrasi",
                                        ),
                                        menuAkademik(
                                          image: "assets/img/transaction-history.png",
                                          title: "Riwayat\nRegistrasi",
                                        ),
                                        menuAkademik(
                                          image: "assets/img/transaction-history.png",
                                          title: "Riwayat\nRegistrasi",
                                        ),
                                        menuAkademik(
                                          image: "assets/img/transaction-history.png",
                                          title: "Riwayat\nRegistrasi",
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                                //Navigation
                              ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Text("Loading");
              }
            }));
  }
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

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.27,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF1E3B78),
              ),
            ),
            RichText(
                text: TextSpan(
              text: data,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xffE9561B),
              ),
            ))
          ],
        ),
      ),
    );
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