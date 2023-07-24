// ignore_for_file: unused_field, import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:siakad/api/model/detailberitamodel.dart';
import 'package:sp_util/sp_util.dart';
import '../../utilites/constants.dart';

class DetailBerita extends StatefulWidget {
  const DetailBerita({super.key});

  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  // ignore: prefer_final_fields
  List _data = [];

  Future<DetailBeritaModel> getDetailBerita() async {
    var response = await http.get(
        Uri.parse("https://unja.ac.id/wp-json/wp/v2/posts/${SpUtil.getString("id_berita")}"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);
      return DetailBeritaModel.fromJson(data);
    } else {
      return DetailBeritaModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 20,
                color: mainBlackColor,
                fontWeight: FontWeight.w700),
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
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: FutureBuilder(
              future: getDetailBerita(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 10, bottom: 10, right: 10),
                        child: Text(
                          snapshot.data!.title.rendered.toString(),
                          style: TextStyle(
                            color: mainBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                          left: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "Written By : ${snapshot.data!.yoastHeadJson.twitterMisc.writtenBy}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   margin: const EdgeInsets.symmetric(horizontal: 10),
                      //   height: 300,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     image: DecorationImage(
                      //         image: NetworkImage(snapshot
                      //             .data!.yoastHeadJson.ogImage[0].url
                      //             .toString()),
                      //         fit: BoxFit.cover),
                      //     color: Colors.black,
                      //     // borderRadius: BorderRadius.circular(30),
                      //   ),
                      // ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(left: 10, bottom: 10),
                          child: Html(
                              data:
                                  snapshot.data!.content.rendered.toString())),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
