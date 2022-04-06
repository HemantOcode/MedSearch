import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/register.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

import '../api.dart';

class Auth with ChangeNotifier {
  final storage = LocalStorage('medSearch');

  var currentUser;

  loginUser({required String email, required String password}) async {
    final url = '$webApi${endPoints['login']}';
    final body = json.encode({'email': email, 'password': password});
    try {
      final response = await http.post(Uri.parse(url),
          body: body, headers: {"Content-Type": "application/json"});
      final responseData = json.decode(response.body);

      if (responseData['success']) {
        currentUser = responseData['result'];

        await storage.setItem('med-user', json.encode(currentUser));
        final existingUser = await storage.getItem('med-user');
        print(existingUser);

        notifyListeners();

        return responseData;
      } else {
        currentUser = null;
        return responseData;
      }
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  registerUser(
      {required String email,
      required String name,
      required String password}) async {
    final url = '$webApi${endPoints['register']}';
    final body =
        json.encode({'email': email, 'name': name, 'password': password});
    try {
      final response = await http.post(Uri.parse(url),
          body: body, headers: {"Content-Type": "application/json"});
      final responseData = json.decode(response.body);

      if (responseData['success']) {
        return responseData;
      } else {
        currentUser = null;
        return responseData;
      }
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  setLastUser(userDetails) {
    currentUser = json.decode(userDetails);
    notifyListeners();
  }
}
