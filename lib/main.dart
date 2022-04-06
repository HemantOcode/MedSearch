import 'package:flutter/material.dart';
import 'package:flutter_application_7/login.dart';
import 'package:flutter_application_7/resetpass.dart';
import 'package:flutter_application_7/us.dart';
import 'register.dart';
import 'content.dart';
import 'notify.dart';

void main() {
  runApp(Medsearch());
}

class Medsearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: content());
  }
}
