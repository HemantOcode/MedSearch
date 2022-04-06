import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/authModule/auth_provider.dart';
import 'package:flutter_application_7/authModule/splash_screen.dart';
import 'package:flutter_application_7/homeModule/home_provider.dart';
import 'package:flutter_application_7/homeModule/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Medsearch());
}

class Medsearch extends StatefulWidget {
  const Medsearch({Key? key}) : super(key: key);

  @override
  State<Medsearch> createState() => _MedsearchState();
}

class _MedsearchState extends State<Medsearch> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => HomeProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => Auth(),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: HomeScreen(),
          title: 'Medsearch',

          home: SplashScreen(),
        ));
  }
}
