import 'package:flutter/material.dart';
import 'package:flutter_application_7/content.dart';
import 'package:flutter_application_7/resetpass.dart';

class us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ABOUT US")),
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
      body: Column(
        children: [
          Image(
            image: AssetImage("assets/kgf.png"),
          ),
          Text("Develoved by Hemant Pal & Mukesh mistree...")
        ],
      ),
    );
  }
}
