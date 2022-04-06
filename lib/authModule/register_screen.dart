import 'package:flutter/material.dart';
import 'package:flutter_application_7/authModule/login_screen.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;
  TextEditingController name = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confmpass = TextEditingController();

  register() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await Provider.of<Auth>(context, listen: false)
          .registerUser(
              email: email.text, password: pass.text, name: name.text);
      if (response['success']) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response['message']),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 100,
              right: 20,
              left: 20),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response['message']),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 100,
              right: 20,
              left: 20),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 100,
            right: 20,
            left: 20),
      ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("REGISTER")),
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
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 17.0),
          child: Column(
            children: [
              SizedBox(height: 15.0),
              TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                      labelText: "Full Name",
                      icon: Icon(
                        Icons.text_format,
                        color: Colors.green.shade600,
                      ))),
              // SizedBox(height: 15.0),
              // TextFormField(
              //   controller: contact,
              //   decoration: InputDecoration(
              //       labelText: "Contact",
              //       icon: Icon(
              //         Icons.phone,
              //         color: Colors.blue.shade600,
              //       )),
              //   keyboardType: TextInputType.number,
              // ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      icon: Icon(
                        Icons.mail,
                        color: Colors.red,
                      ))),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "password", icon: Icon(Icons.lock))),
              SizedBox(
                height: 15.0,
              ),
              // TextFormField(
              //     controller: confmpass,
              //     decoration: InputDecoration(
              //         labelText: "Confirm Password", icon: Icon(Icons.lock))),
              // SizedBox(
              //   height: 25.0,
              // ),
              ElevatedButton(
                onPressed: isLoading
                    ? () {}
                    : () {
                        register();
                      },
                child: Text("Register"),
                style:
                    ElevatedButton.styleFrom(primary: Colors.purple.shade600),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  },
                  child: Text('Already Member Log-In'))
            ],
          ),
        ));
  }
}
