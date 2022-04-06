import 'package:flutter/material.dart';
import 'package:flutter_application_7/homeModule/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  myInit() async {
    setState(() {
      isLoading = true;
    });

    try {
      await Provider.of<HomeProvider>(context, listen: false).fetchAllDrungs();
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    myInit();
  }

  @override
  Widget build(BuildContext context) {
    final drugs = Provider.of<HomeProvider>(context).drugs;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medsearch'),
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : SafeArea(
              child: Column(
              children: [
                // ignore: avoid_unnecessary_containers
                ...drugs.map((e) => Container(
                      child: Text(e['name']),
                    ))
              ],
            )),
    );
  }
}
