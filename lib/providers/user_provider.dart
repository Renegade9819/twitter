import 'package:flutter/cupertino.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/user_service.dart';

class UserProvider with ChangeNotifier {
  User? loggedInUser;

  final UserService userService = serviceLocator<UserService>();

  void setLoggedInUser(User user) {
    loggedInUser = userService.loginUser(user.userName, user.password);
    notifyListeners();
  }

  void updateLoggedInUser(User updatedUser) {
    loggedInUser = updatedUser;
    notifyListeners();
  }

  void registerUser(User user) {
    loggedInUser = userService.registerUser(user);
    notifyListeners();
  }
}
