import 'package:flutter/material.dart';
import 'package:flutter_application_7/homeModule/home_provider.dart';
import 'package:flutter_application_7/homeModule/widgets/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool isSeaching = false;
  TextEditingController  searchQuery =  TextEditingController();

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

  getSearchedMed(String query){


   return Provider.of<HomeProvider>(context,listen: false).getSearchResult(query);
   
    
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    List<dynamic> drugs;
    if (isSeaching) {
      drugs = getSearchedMed(searchQuery.text);
    }else{
      drugs = Provider.of<HomeProvider>(context).drugs;
    }
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Container(
            height: isSeaching ? deviceWidth * 0.12 : null,
            // padding: EdgeInsets.only(top:deviceWidth*0.01),
            // margin: EdgeInsets.symmetric(vertical: deviceWidth),
            child: isSeaching
                ? TextField(
                  controller: searchQuery,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white, letterSpacing: .56),
                    decoration: InputDecoration(
                      hintText: 'Search Medicine',
                      hintStyle: TextStyle(color: Colors.grey[300]),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        
                      });
                    },
                  )
                : Text('Medsearch')),
        actions: isLoading?[]:[
          IconButton(
              onPressed: () {
                if (isSeaching) {
                  setState(() {
                    isSeaching = false;
                    drugs =
                        Provider.of<HomeProvider>(context, listen: false).drugs;
                  });
                } else {
                  setState(() {
                    isSeaching = true;
                  });
                }
              },
              icon: Icon(isSeaching ? Icons.clear : Icons.search))
        ],
      ),
      drawer: AppDrawer(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: drugs.length,
              itemBuilder: (BuildContext context, int index) {
                final e = drugs[index];
                return Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.purple.shade600,
                            Colors.deepPurple.shade900
                          ]),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(
                            2.0,
                            2.0,
                          ),
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                        ),
                      ]),
                  margin: EdgeInsets.symmetric(
                      vertical: deviceWidth * 0.02,
                      horizontal: deviceWidth * .04),
                  padding: EdgeInsets.all(deviceWidth * 0.02),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['medName'],
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: deviceWidth * 0.02,
                          ),
                          Text(
                            e['MRP'],
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Container(
                            width: deviceWidth * 0.7,
                            child: Text(
                              e['Uses'],
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            width: deviceWidth * 0.8,
                            child: Text(
                              e['altMed'] ?? '',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
      //  SafeArea(
      //     child: SingleChildScrollView(
      //     padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.04),
      //     child: Column(
      //       children: [

      //         // ignore: avoid_unnecessary_containers
      //         // ...drugs.map((e) => Container(
      //         //       decoration: BoxDecoration(
      //         //           gradient: LinearGradient(
      //         //               begin: Alignment.centerLeft,
      //         //               end: Alignment.centerRight,
      //         //               colors: <Color>[
      //         //                 Colors.purple.shade600,
      //         //                 Colors.deepPurple.shade900
      //         //               ]),
      //         //           borderRadius: BorderRadius.circular(12),
      //         //           border: Border.all(color: Colors.black),
      //         //           boxShadow: const [
      //         //             BoxShadow(
      //         //               color: Colors.black26,
      //         //               offset: Offset(
      //         //                 2.0,
      //         //                 2.0,
      //         //               ),
      //         //               blurRadius: 3.0,
      //         //               spreadRadius: 1.0,
      //         //             ),
      //         //           ]),
      //         //       margin:
      //         //           EdgeInsets.symmetric(vertical: deviceWidth * 0.02),
      //         //       padding: EdgeInsets.all(deviceWidth * 0.02),
      //         //       width: double.infinity,
      //         //       child: Row(
      //         //         children: [
      //         //           Column(
      //         //             crossAxisAlignment: CrossAxisAlignment.start,
      //         //             children: [
      //         //               Text(
      //         //                 e['medName'],
      //         //                 style: TextStyle(
      //         //                     color: Theme.of(context).primaryColor,
      //         //                     fontSize: 16,
      //         //                     fontWeight: FontWeight.w600),
      //         //               ),
      //         //               SizedBox(
      //         //                 height: deviceWidth * 0.02,
      //         //               ),
      //         //               Text(
      //         //                 e['MRP'],
      //         //                 style: const TextStyle(
      //         //                     fontSize: 16,
      //         //                     fontWeight: FontWeight.w600,
      //         //                     color: Colors.white),
      //         //               ),
      //         //               Container(
      //         //                 width: deviceWidth * 0.7,
      //         //                 child: Text(
      //         //                   e['Uses'],
      //         //                   style: const TextStyle(
      //         //                       fontSize: 16,
      //         //                       fontWeight: FontWeight.w600,
      //         //                       color: Colors.white),
      //         //                 ),
      //         //               ),
      //         //               Container(
      //         //                 width: deviceWidth * 0.8,
      //         //                 child: Text(
      //         //                   e['altMed'] ?? '',
      //         //                   style: const TextStyle(
      //         //                       fontSize: 16,
      //         //                       fontWeight: FontWeight.w600,
      //         //                       color: Colors.white),
      //         //                 ),
      //         //               ),
      //         //             ],
      //         //           ),
      //         //         ],
      //         //       ),
      //         //     ))
      //       ],
      //     ),
      //   )),
    );
  }
}
