import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/content.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  Future login(BuildContext cont) async {
    var url = "http://localhost/Localconnect/login.php";

    // var response = await http.post(Uri.parse(url, body: {
    //   "username": _email.text,
    //   "password": _pass.text,
    // }));

    final response =
        await http.post(Uri.parse("uri"), body: json.encode({}), headers: {});

    var data = json.decode(response.body);

    if (data == "success") {
      Navigator.push(cont, MaterialPageRoute(builder: (context) => content()));
    } else {
      Fluttertoast.showToast(
          msg: "The user and password combination does not exist!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("LOGIN")),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                  Colors.purple.shade600,
                  Colors.deepPurple.shade900
                ])),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 210, horizontal: 15),
          child: Column(
            children: [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                    labelText: "E-mail",
                    icon: Icon(
                      Icons.email,
                      color: Colors.red,
                    )),
              ),
              SizedBox(height: 19.0),
              TextFormField(
                controller: _pass,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    icon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    )),
              ),
              SizedBox(height: 10.0),
              TextButton(onPressed: () {}, child: Text("Reset Password")),
              ElevatedButton(
                onPressed: () {},
                child: Text("     Login      "),
                style:
                    ElevatedButton.styleFrom(primary: Colors.purple.shade600),
              )
            ],
          ),
        ));
  }
}
