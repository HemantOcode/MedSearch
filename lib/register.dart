import 'package:flutter/material.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController _name = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _confmpass = TextEditingController();
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
                  controller: _name,
                  decoration: InputDecoration(
                      labelText: "Full Name",
                      icon: Icon(
                        Icons.text_format,
                        color: Colors.green.shade600,
                      ))),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _contact,
                decoration: InputDecoration(
                    labelText: "Contact",
                    icon: Icon(
                      Icons.phone,
                      color: Colors.blue.shade600,
                    )),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                  controller: _email,
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
                  controller: _pass,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "password", icon: Icon(Icons.lock))),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                  controller: _confmpass,
                  decoration: InputDecoration(
                      labelText: "Confirm Password", icon: Icon(Icons.lock))),
              SizedBox(
                height: 25.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Register"),
                style:
                    ElevatedButton.styleFrom(primary: Colors.purple.shade600),
              )
            ],
          ),
        ));
    ;
  }
}
