import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:siakad/utilites/constants.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;
import '../../../api/model/chat_model.dart';

class ChatMhs extends StatefulWidget {
  const ChatMhs({super.key});

  @override
  State<ChatMhs> createState() => _ChatMhsState();
}

class _ChatMhsState extends State<ChatMhs> {
   Future<ChatModel> getDetailPresensi() async {
    var header = {"Authorization": "Bearer " + SpUtil.getString("token")};
    var response = await http.get(chat + SpUtil.getString("id_dosen"),
        headers: header);
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print(response.body);
      return ChatModel.fromJson(data);
    } else {
      return ChatModel.fromJson(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chat",
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(color: mainWhiteColor),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _itemChats(
                avatar: "assets/img/user.png",
                name: "Dini",
                chat:
                    "hban janja jnaja najna inaja jnaja anan iana anna ana ikmak abha aba bhban ua",
                time: "20.00"),
            _itemChats(
                avatar: "assets/img/user.png",
                name: "Dini",
                chat:
                    "hban janja jnaja najna inaja jnaja anan iana anna ana ikmak abha aba bhban ua",
                time: "20.00"),
            _itemChats(
                avatar: "assets/img/user.png",
                name: "Dini",
                chat:
                    "hban janja jnaja najna inaja jnaja anan iana anna ana ikmak abha aba bhban ua",
                time: "20.00"),
            _itemChats(
                avatar: "assets/img/user.png",
                name: "Dini",
                chat:
                    "hban janja jnaja najna inaja jnaja anan iana anna ana ikmak abha aba bhban ua",
                time: "20.00"),
            _itemChats(
                avatar: "assets/img/user.png",
                name: "Dini",
                chat:
                    "hban janja jnaja najna inaja jnaja anan iana anna ana ikmak abha aba bhban ua",
                time: "20.00"),
            _itemChats(
                avatar: "assets/img/user.png",
                name: "Dini",
                chat:
                    "hban janja jnaja najna inaja jnaja anan iana anna ana ikmak abha aba bhban ua",
                time: "20.00"),
            _itemChats(
                avatar: "assets/img/user.png",
                name: "Dini",
                chat:
                    "hban janja jnaja najna inaja jnaja anan iana anna ana ikmak abha aba bhban ua",
                time: "20.00"),
            _itemChats(
                avatar: "assets/img/user.png",
                name: "Dini",
                chat:
                    "hban janja jnaja najna inaja jnaja anan iana anna ana ikmak abha aba bhban ua",
                time: "20.00"),
            _itemChats(
                avatar: "assets/img/user.png",
                name: "Dini",
                chat:
                    "hban janja jnaja najna inaja jnaja anan iana anna ana ikmak abha aba bhban ua",
                time: "20.00"),
          ],
        ),
      ),
    );
  }

  Widget _itemChats({String avatar = "", name = "", chat = "", time: ""}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChatPage()));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 20),
        elevation: 0,
        child: Row(
          children: [
            Avatar(
              margin: EdgeInsets.only(right: 20),
              size: 60,
              image: avatar,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$name",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$time",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "$chat",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainBlueColor,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  _topChat(),
                  _bodyChat(),
                ],
              ),
              _formChat(),
            ],
          ),
        ));
  }

  Widget _topChat() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: mainWhiteColor,
                ),
              ),
              Text(
                "Dini",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: mainWhiteColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _bodyChat() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            color: mainWhiteColor),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _itemChat(
                avatar: "assets/img/user.png",
                chat: 1,
                message: "nnnn ssn snjsnjs jnss sksk",
                time: "20.00"),
            _itemChat(
                avatar: "assets/img/user.png",
                chat: 0,
                message: "nnnn ssn snjsnjs jnss sksk",
                time: "20.00"),
            _itemChat(
                avatar: "assets/img/user.png",
                chat: 0,
                message: "nnnn ssn snjsnjs jnss sksk",
                time: "20.00"),
            _itemChat(
                avatar: "assets/img/user.png",
                chat: 1,
                message: "nnnn ssn snjsnjs jnss sksk",
                time: "20.00"),
          ],
        ),
      ),
    );
  }

  //chat = 0 : send
  //chat = 1 : recieved
  Widget _itemChat({required int chat, required String avatar, message, time}) {
    return Row(
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        chat == 1
            ? Avatar(
                image: avatar,
                size: 50,
              )
            : Text(
                "$time",
                style: TextStyle(color: Colors.grey.shade500),
              ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 10, top: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color:
                    chat == 0 ? Colors.indigo.shade100 : Colors.indigo.shade50,
                borderRadius: chat == 0
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
            child: Text(
              "$message",
              style: TextStyle(color: mainBlackColor),
            ),
          ),
        ),
        chat == 1
            ? Text(
                "$time",
                style: TextStyle(color: Colors.grey.shade500),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _formChat() {
    return Positioned(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: TextField(
          decoration: InputDecoration(
              hintText: "Ketik pesan...",
              filled: true,
              fillColor: Colors.indigo.shade100,
              labelStyle: const TextStyle(
                fontSize: 12,
              ),
              contentPadding: const EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo.shade100),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo.shade100),
                borderRadius: BorderRadius.circular(25),
              ),
              suffixIcon: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.indigo,
                ),
                child: Icon(
                  Icons.send_rounded,
                  color: mainWhiteColor,
                  size: 28,
                ),
              )),
        ),
      ),
    ));
  }
}

class Avatar extends StatelessWidget {
  final double size;
  final image;
  final EdgeInsets margin;
  Avatar({this.image, this.size = 20, this.margin = const EdgeInsets.all(0)});
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(image),
            )),
      ),
    );
  }
}
