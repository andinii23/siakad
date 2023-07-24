// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_final_fields, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sp_util/sp_util.dart';
import '../../api/model/login_model.dart';
import '../../api/model/versimodel.dart';
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
  // String expectedAppVersion = "1.0.0";

  String urlVersi = "";

  @override
  void initState() {
    super.initState();
    // Check the app version before showing the login page
    _checkAppVersion();
  }


  Future<VersiModel> _checkAppVersion() async {
    var response = await http.get(Uri.parse(versi));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print(response.body);
      final versiModel = versiModelFromJson(response.body);
      urlVersi = versiModel.data.list.version;
      // Retrieve the stored app version from SpUtil
      String storedAppVersion = urlVersi;

      // Retrieve the current app version from the device
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String currentVersion = packageInfo.version;
      print("Current Version : $currentVersion");

      if (storedAppVersion == currentVersion) {
        // The stored app version matches the expected version, proceed with login
        print("Versions match! Proceeding with login.");
      } else {
        // The stored app version does not match the expected version
        // Show a dialog prompting the user to update the app
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text("Update Required"),
            content: const Text(
                "Please update the app to the latest version to continue."),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the dialog and redirect the user to the app store for update
                  Navigator.pop(context);
                  _redirectToAppStore();
                },
                child: const Text("Update"),
              ),
            ],
          ),
        );
      }
      return VersiModel.fromJson(data);
    } else {
      return VersiModel.fromJson(data);
    }
  }

  void _redirectToAppStore() {
    // Implement the logic to redirect the user to the app store for update
    // For Android, you can use the URL_launcher package to open the Google Play Store
    // For iOS, you can use the iOS-specific method to open the App Store.
    // Example: launch('https://play.google.com/store/apps/details?id=your_app_id');
  }

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
    var response = await http.post(Uri.parse(login_url), body: {
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
