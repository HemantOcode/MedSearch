import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../api.dart';

class HomeProvider with ChangeNotifier {
 


   static const header =   {"Content-Type": "application/json"};
   List<dynamic> drugs = [];


   fetchAllDrungs() async{

     final url = '$webApi${endPoints['fetchDrugs']}';
     final body = json.encode({});
       try {
      final response = await http.post(Uri.parse(url),
          body:body , headers: {"Content-Type": "application/json"});
      final responseData = json.decode(response.body);

      if(responseData['success']){
        drugs= responseData['result'];
        print(drugs);
        notifyListeners();
      }else{
        drugs =[];
      }
    } catch (error) {
      debugPrint(error.toString());
      throw error;
    }

       

    
    
       }



 

}