import 'dart:io';

import 'package:twitter/models/user.dart';

abstract class UserServiceAPI {
  Future<User> getUser(String userName);
  Future<User> updateUser(User user);
  Future<List<User>> getUserBySearchTerm(String searchTerm);
  Future<bool> loginUser(String userName, String password);
  Future<bool> registerUser(User user);
  Future<bool> checkIfUserExists(String userName);
}
