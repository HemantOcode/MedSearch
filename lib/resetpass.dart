import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/content.dart';
import 'package:flutter_application_7/us.dart';
import 'package:http/http.dart' as http;

class resetpass extends StatelessWidget {
  const resetpass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("RESET PASSWORD")),
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("HemantOO"),
                accountEmail: Text("Palh8684@gmail.com"),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/kgf.png"),
                      alignment: Alignment.topCenter,
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.purple.shade600,
                          Colors.deepPurple.shade900
                        ])),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => content()));
                },
                child: ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  iconColor: Colors.blue,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => resetpass()));
                },
                child: ListTile(
                  title: Text("Reset Password"),
                  leading: Icon(Icons.lock_open),
                  iconColor: Colors.green,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => us()));
                },
                child: ListTile(
                  title: Text("About US"),
                  leading: Icon(Icons.group),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 15),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: "OLD PASSWORD",
                    icon: Icon(
                      Icons.lock_open,
                      color: Colors.green.shade600,
                    )),
              ),
              SizedBox(height: 19.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "New PASSWORD",
                    icon: Icon(
                      Icons.vpn_key_rounded,
                      color: Colors.grey,
                    )),
              ),
              SizedBox(height: 19.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "CONFIRM PASSWORD",
                    icon: Icon(
                      Icons.vpn_key,
                      color: Colors.blue,
                    )),
              ),
              SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {},
                child: Text("    Login    "),
                style:
                    ElevatedButton.styleFrom(primary: Colors.purple.shade600),
              )
            ],
          ),
        ));
  }
}
