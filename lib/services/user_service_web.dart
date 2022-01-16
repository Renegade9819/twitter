import 'dart:convert';

import 'package:twitter/models/user.dart';

import 'package:twitter/api/api_constants.dart' as API;
import 'package:twitter/services/user_service_api.dart';
import 'package:http/http.dart' as http;

class UserServiceWeb implements UserServiceAPI {
  String api = API.baseUrl;

  @override
  Future<bool> checkIfUserExists(String userName) async {
    final response = await http.get(Uri.parse(api + "/user/exists/$userName"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<User> getUser(String userName) async {
    final response = await http.get(Uri.parse(api + "/user/$userName"));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error fetching User Details");
    }
  }

  @override
  Future<bool> loginUser(String userName, String password) async {
    final response =
        await http.get(Uri.parse(api + "/user/login/$userName/$password"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> registerUser(User user) async {
    final response = await http.post(
      Uri.parse(api + "/user/signup"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<User> updateUser(User user) async {
    final response = await http.put(
      Uri.parse(api + "/user/profile/update"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update User Details");
    }
  }

  @override
  Future<List<User>> getUserBySearchTerm(String searchTerm) async {
    List<User> searchResults;
    final response =
        await http.get(Uri.parse(api + "/user/search/$searchTerm"));

    Iterable results = jsonDecode(response.body);
    searchResults =
        List<User>.from(results.map((model) => User.fromJson(model)));

    return searchResults;
  }
}
