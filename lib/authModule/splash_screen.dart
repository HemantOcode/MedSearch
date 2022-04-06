import 'package:flutter/material.dart';
import 'package:flutter_application_7/authModule/auth_provider.dart';
import 'package:flutter_application_7/authModule/register_screen.dart';
import 'package:flutter_application_7/homeModule/home_screen.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = LocalStorage('medSearch');

  myInit() async {
    final data = await storage.ready;
    print(data);

    final existingUser = await storage.getItem('med-user');

    if (existingUser != null) {
      Provider.of<Auth>(context, listen: false).setLastUser(existingUser);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen()),
          (route) => false);
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
      myInit();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage("assets/kgf.png"),
        ),
        Text('Med Search')
      ],
    ));
  }
}
