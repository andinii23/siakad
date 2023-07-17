// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_final_fields, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../../api/model/login_model.dart';
import '../../utilites/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formState = GlobalKey<FormState>();
  String? _usernameError;
  String? _passwordError;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        centerTitle: true,
        title: Text(
          "",
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
            Navigator.pushNamed(context, 'gerbang');
          },
        ),
      ),
        body: SingleChildScrollView(
          child: Container(
            // margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                        image: const AssetImage("assets/img/mobile.png"),
                        height: size.height * 0.2),
                    const Text(
                      "Selamat Datang,",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'sans',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Silahkan login untuk masuk ke dalam sistem",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'sans',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Form(
                    key: _formState,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _usernameController,
                            validator: (value) {
                              if (value == '') {
                                return "username tidak boleh kosong";
                              }
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: "Username",
                              hintText: "Username",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (_usernameError != null)
                            Text(
                              _usernameError!,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == '') {
                                return "password tidak boleh kosong";
                              }
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              labelText: "Password",
                              hintText: "Password",
                              border: OutlineInputBorder(),
                              // suffixIcon: IconButton(
                              //   onPressed: null,
                              //   icon: Icon(Icons.remove_red_eye_sharp),
                              // ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (_passwordError != null)
                            Text(
                              _passwordError!,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formState.currentState!.validate()) {
                                  _loginToApp();
                                } else {
                                  print("validasi gagal");
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(mainOrange2Color),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _loginToApp() async {
    var response = await http.post(login_url, body: {
      "username": _usernameController.text,
      "password": _passwordController.text,
    });

    if (response.statusCode == 200) {
      // print(response.body);
      final loginModel = loginModelFromJson(response.body);
      var token = loginModel.data.list.token;
      SpUtil.putString("token", token);
      SpUtil.putString("name", loginModel.data.list.user.name);
      SpUtil.putString("username", loginModel.data.list.user.username);
      SpUtil.putString("usertype", loginModel.data.list.user.usertype);
      SpUtil.putBool("isLogin", true);
      Navigator.pushNamed(context, 'HomePage');
    } else {
      print("login gagal");
      var body = jsonDecode(response.body);
      if (body.containsKey("error_message")) {
        String errorMessage = body["error_message"];
        if (errorMessage.toLowerCase().contains("username")) {
          // Menyimpan pesan kesalahan username
          setState(() {
            _usernameError = "username salah!!";
            _passwordError = null; // Menghapus pesan kesalahan password
          });
        } else if (errorMessage.toLowerCase().contains("password")) {
          // Menyimpan pesan kesalahan password
          setState(() {
            _passwordError = "password salah!!";
            _usernameError = null; // Menghapus pesan kesalahan username
          });
        } else {
          // Menampilkan pesan kesalahan umum jika bukan kesalahan username atau password
          print("Terjadi kesalahan: $errorMessage");
        }
        print(body["error_message"]);
      }
    }
  }
}
