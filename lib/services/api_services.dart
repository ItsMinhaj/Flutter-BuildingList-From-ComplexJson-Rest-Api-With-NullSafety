import 'dart:convert';

import 'package:complex_json_rest_api/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  List<UserModel> userList = [];

  Future<List<UserModel>> fetchUserData() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }
}
