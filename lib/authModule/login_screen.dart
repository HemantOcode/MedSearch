import 'package:flutter/material.dart';
import 'package:flutter_application_7/authModule/auth_provider.dart';
import 'package:flutter_application_7/authModule/register_screen.dart';
import 'package:flutter_application_7/homeModule/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  login()async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await Provider.of<Auth>(context, listen: false)
          .loginUser(email: email.text, password: pass.text);
      if (response['success']) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
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
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 210, horizontal: 15),
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          icon: Icon(
                            Icons.email,
                            color: Colors.red,
                          )),
                    ),
                    SizedBox(height: 19.0),
                    TextFormField(
                      controller: pass,
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
                      onPressed: isLoading?(){}:() {
                        login();
                      },
                      child: Text("     Login      "),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple.shade600),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()),
                              (route) => false);
                        },
                        child: Text('New User Register'))
                  ],
                ),
              ));
  }
}
