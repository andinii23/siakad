import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:siakad/api/model/semester_model.dart';
import 'package:sp_util/sp_util.dart';
import '../../../api/model/khs_model.dart';
import '../../../utilites/constants.dart';

class SemMonitoring extends StatefulWidget {
  const SemMonitoring({super.key});

  @override
  State<SemMonitoring> createState() => _SemMonitoringState();
}

class _SemMonitoringState extends State<SemMonitoring> {
  Future<SemesterModel> getKhsData() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(semester, headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return SemesterModel.fromJson(data);
    } else {
      return SemesterModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Semester Monitoring Kuliah",
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
            child: FutureBuilder<SemesterModel>(
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
                                "Daftar Semester",
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
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
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
                                    child: InkWell(
                                      onTap: () {
                                        _detailMonitor(snapshot.data!.data.list[index].idSemester.toString());
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: mainWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Semester : ${snapshot.data!.data.list[index].idSemester.toString()}",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: mainBlueColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold
                                                    ),
                                              ),
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  } else {
                     return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

   Future _detailMonitor(String id_semester) async {
    SpUtil.putString("id_semester", id_semester);
    Navigator.pushNamed(context, 'Monitoring');
  }
}
