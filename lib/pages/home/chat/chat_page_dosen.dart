import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../../api/model/chat_model.dart';
import '../../../utilites/constants.dart';

class ChatPageDosen extends StatefulWidget {
  const ChatPageDosen({super.key});

  @override
  State<ChatPageDosen> createState() => _ChatPageDosenState();
}

class _ChatPageDosenState extends State<ChatPageDosen> {
  TextEditingController _chatController = TextEditingController();

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<ChatModel> getChatData() async {
      var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
      var response =
          await http.get(chat_dosen , headers: header);
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        // print(response.body);
        return ChatModel.fromJson(data);
      } else {
        return ChatModel.fromJson(data);
      }
    }

    return Scaffold(
        backgroundColor: mainBlueColor,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                child: Align(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'HomeMhsPage');
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 25,
                                    color: mainWhiteColor,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Text(
                                    SpUtil.getString("nama_pegawai"),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: mainWhiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(45),
                                  topRight: Radius.circular(45)),
                              color: mainWhiteColor),
                          child: FutureBuilder<ChatModel>(
                              future: getChatData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      itemCount:
                                          snapshot.data!.data.list.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment: snapshot.data!.data
                                                      .list[index].dariSaya ==
                                                  true
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                    width: 210,
                                                    margin: const EdgeInsets.only(
                                                        top: 10, bottom: 10),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    decoration: BoxDecoration(
                                                        color: snapshot
                                                                    .data!
                                                                    .data
                                                                    .list[index]
                                                                    .dariSaya ==
                                                                true
                                                            ? Colors
                                                                .indigo.shade100
                                                            : Colors
                                                                .indigo.shade50,
                                                        borderRadius:
                                                            snapshot
                                                                        .data!
                                                                        .data
                                                                        .list[
                                                                            index]
                                                                        .dariSaya ==
                                                                    true
                                                                ? const BorderRadius
                                                                    .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            30),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            30),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            30),
                                                                  )
                                                                : const BorderRadius
                                                                    .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            30),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            30),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            30),
                                                                  )),
                                                    child: Text(snapshot
                                                        .data!
                                                        .data
                                                        .list[index]
                                                        .pesan)),
                                              ],
                                            ),
                                          ],
                                        );
                                      });
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        color: mainWhiteColor,
                        child: Container(
                          height: 120,
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: TextField(
                            controller: _chatController,
                            decoration: InputDecoration(
                                hintText: "Ketik pesan...",
                                filled: true,
                                fillColor: Colors.indigo.shade100,
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                ),
                                contentPadding: const EdgeInsets.all(20),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.indigo.shade100),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.indigo.shade100),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                suffixIcon: Container(
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.indigo,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      _sendChat();
                                      _chatController.clear();
                                    },
                                    child: Icon(
                                      Icons.send_rounded,
                                      color: mainWhiteColor,
                                      size: 28,
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future _sendChat() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http
        .post(chat_dosen, headers: header, body: {
      "pesan": _chatController.text,
    });
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("gagal menambahkan kelas");
      var body = jsonDecode(response.body);
      print(body["error_message"]);
    }
  }
}
   