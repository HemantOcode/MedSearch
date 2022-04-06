import 'dart:ffi';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/resetpass.dart';
import 'package:flutter_application_7/us.dart';
import 'package:http/http.dart';

var query;

class content extends StatefulWidget {
  @override
  State<content> createState() => _contentState();
}

class _contentState extends State<content> {
  TextEditingController query = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: search_data());
            },
            icon: Icon(Icons.search_outlined),
            color: Colors.white,
          )
        ],
        title: Center(child: Text("MEDSEARCH")),
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
              onTap: () {},
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
    );
  }
}

class search_data extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return (IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back)));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return TextField(obscureText: false, controller: query);
  }
}
