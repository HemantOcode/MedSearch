import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_7/authModule/auth_provider.dart';
import 'package:flutter_application_7/authModule/login_screen.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import '../../us.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final storage = LocalStorage('medSearch');

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<Auth>(context).currentUser;
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userDetails['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,letterSpacing: 1.2),),
            accountEmail: Text(userDetails['email'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,letterSpacing: 1.2)),
            decoration: BoxDecoration(
                image: const DecorationImage(
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
          // InkWell(
          //   onTap: () {},
          //   child: ListTile(
          //     title: Text("Home"),
          //     leading: Icon(Icons.home),
          //     iconColor: Colors.blue,
          //   ),
          // ),
          // InkWell(
          //   onTap: () {
          //     // Navigator.push(context,
          //     //     MaterialPageRoute(builder: (context) => resetpass()));
          //   },
          //   child: ListTile(
          //     title: Text("Reset Password"),
          //     leading: Icon(Icons.lock_open),
          //     iconColor: Colors.green,
          //   ),
          // ),

          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => us()));
            },
            child: const ListTile(
              title: Text("About US"),
              leading: Icon(Icons.group),
            ),
          ),

          InkWell(
            onTap: () async {
              await storage.deleteItem('med-user');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
            child: const ListTile(
              title: Text("Log-Out"),
              leading: Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
    );
  }
}
