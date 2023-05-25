import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

import '../../utilites/config.dart';
import '../../utilites/constants.dart';
import 'card_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70, left: 30),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "SuperApps",
                    style: TextStyle(
                        fontSize: 28,
                        color: Color(0xFF1E3B78),
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  // const Text(
                  //   "Logout",
                  //   style: TextStyle(
                  //       fontSize: 14,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.w700),
                  // ),
                  IconButton(
                    onPressed: () {
                      SpUtil.clear();
                      Navigator.pushNamed(context, 'Login');
                    },
                    icon: const Icon(Icons.logout),
                    color: const Color(0xFF1E3B78),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Text(
                    "Halaman Utama",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF1E3B78),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffE9561B),
                      const Color(0xffFF7D05).withOpacity(0.9),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(5, 10),
                      blurRadius: 20,
                      color: const Color(0xffFF964A).withOpacity(0.2),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Selamat Datang,",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        SpUtil.getString("name"),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        SpUtil.getString("username"),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.account_circle,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                SpUtil.getString("usertype"),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, 'GantiPassword');
                                },
                                child: Text(
                                  "Ganti Password?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: mainWhiteColor,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          )
                          // Expanded(child: Container()),
                          // SizedBox(
                          //   child: Row(
                          //     children: const [
                          //       Text(
                          //         "Ganti Password",
                          //         style: TextStyle(color: Colors.white),
                          //       ),
                          //       Icon(
                          //         Icons.lock,
                          //         color: Colors.white,
                          //       )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "Aplikasi Akademik",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1E3B78)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 500,
                height: SizeConfig.screenHeight,
                color: mainWhiteColor,
                child: SingleChildScrollView(
                  // padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          runSpacing: 20.0,
                          spacing: 10.0,
                          alignment: WrapAlignment.start,
                          children: [
                            cardApp(
                              icon: 'assets/img/unja.png',
                              label: 'Siakad UNJA',
                              onTap: () {
                                if (SpUtil.getString("usertype") ==
                                    "mahasiswa") {
                                  Navigator.pushNamed(context, 'Navbar');
                                } else {
                                  Navigator.pushNamed(context, 'HomeDosen');
                                }
                              },
                            ),
                            cardApp(
                              icon: 'assets/img/unja.png',
                              label: 'Siakad UNJA',
                              onTap: () {
                                Navigator.pushNamed(context, 'Navbar');
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
