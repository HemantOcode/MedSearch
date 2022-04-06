import 'package:flutter/material.dart';
import 'package:flutter_application_7/content.dart';
import 'package:flutter_application_7/resetpass.dart';
import 'us.dart';
import 'package:url_launcher/url_launcher.dart';

class notify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("NOTIFICATION")),
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
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _launchURL();
                },
                child: Text("Click Here"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  onPrimary: Colors.purple.shade500,
                  onSurface: Colors.green,
                ),
              ),
            ),
          ],
        ));
  }

  _launchURL() async {
    const url = 'https://www.google.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
