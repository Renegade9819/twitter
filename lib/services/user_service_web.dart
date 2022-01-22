import 'dart:convert';
import 'dart:io';

import 'package:twitter/models/user.dart';

import 'package:twitter/constants/api_constants.dart' as api;
import 'package:twitter/services/user_service_api.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class UserServiceWeb implements UserServiceAPI {
  String apiUrl = api.baseUrl;

  @override
  Future<bool> checkIfUserExists(String userName) async {
    final response =
        await http.get(Uri.parse(apiUrl + "/user/exists/$userName"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<User> getUser(String userName) async {
    final response = await http.get(Uri.parse(apiUrl + "/user/$userName"));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error fetching User Details");
    }
  }

  @override
  Future<bool> loginUser(String userName, String password) async {
    final response =
        await http.get(Uri.parse(apiUrl + "/user/login/$userName/$password"));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> registerUser(User user) async {
    final response = await http.post(
      Uri.parse(apiUrl + "/user/signup"),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
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
      Uri.parse(apiUrl + "/user/profile/update"),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(user),
    );

    print("update called");

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
        await http.get(Uri.parse(apiUrl + "/user/search/$searchTerm"));

    Iterable results = jsonDecode(response.body);
    searchResults =
        List<User>.from(results.map((model) => User.fromJson(model)));

    return searchResults;
  }

  @override
  Future<bool> uploadUserAvatar(File avatarFile, String userName) async {
    var avatarUploadURI = Uri.parse(apiUrl + "/user/set/avatar/$userName");
    var avatarRequest = http.MultipartRequest("POST", avatarUploadURI);

    var multipartFile = await http.MultipartFile.fromPath(
        'image', avatarFile.path,
        contentType: MediaType.parse("multipart/form-data"));
    avatarRequest.files.add(multipartFile);
    var response = await avatarRequest.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> uploadUserBackground(File bgFile, String userName) async {
    var bgUploadURI = Uri.parse(apiUrl + "/user/set/background/$userName");
    var bgRequest = http.MultipartRequest("POST", bgUploadURI);

    var multipartFile = await http.MultipartFile.fromPath('image', bgFile.path,
        contentType: MediaType.parse("multipart/form-data"));
    bgRequest.files.add(multipartFile);
    var response = await bgRequest.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
