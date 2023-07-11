import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:siakad/pages/tagihan/slideimage.dart';
import 'package:siakad/utilites/constants.dart';

import '../api/model/cardwelcomemodel.dart';

class Gerbang extends StatefulWidget {
  const Gerbang({super.key});

  @override
  State<Gerbang> createState() => _GerbangState();
}

class _GerbangState extends State<Gerbang> {
  List<CardInfo> infocard = CardInfoList;
  final List<String> imgList = [
    'https://correcto.id/content/images/th1_2020112302384838982.jpg',
    'https://correcto.id/content/images/th1_2020112302384838982.jpg',
    'https://correcto.id/content/images/th1_2020112302384838982.jpg',
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhiteColor,
      appBar: AppBar(
        backgroundColor: mainBlueColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'Login');
              },
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 14),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'Login');
              },
              child: Icon(
                Icons.login,
                color: mainWhiteColor,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 2.7,
                    width: double.maxFinite,
                    decoration: BoxDecoration(color: mainBlueColor),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CarouselSlider.builder(
                      itemCount: infocard.length,
                      itemBuilder: (context, itemIndex, realIndex) {
                        CardInfo listcard = CardInfoList[itemIndex];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)
                                            .withOpacity(0.1),
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: const Color.fromARGB(255, 61, 185, 243)
                                    .withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                              
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 200,
                                      child: Text(
                                        listcard.judul,
                                        style: TextStyle(
                                            color: mainWhiteColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                      width: 110,
                                      height: 90,
                                      child: Image.asset(
                                          "assets/img/${listcard.gambar}")),
                                ),
                                
                              ],
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
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
                        child: TextField(
                          cursorHeight: 20,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: "Cari..",
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: mainBlueColor, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Berita Terkini UNJA",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Lihat lainnya >",
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //bagian selanjutnya
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          departmentCard(
                            "Development",
                            "assets/img/coding.jpg",
                          ),
                          departmentCard(
                            "Development",
                            "assets/img/coding.jpg",
                          ),
                          departmentCard(
                            "Development",
                            "assets/img/coding.jpg",
                          ),
                          departmentCard(
                            "Development",
                            "assets/img/coding.jpg",
                          ),
                          departmentCard(
                            "Development",
                            "assets/img/coding.jpg",
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget departmentCard(String name, String Img) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Img), fit: BoxFit.cover),
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
