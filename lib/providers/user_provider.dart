import 'package:flutter/cupertino.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/user_service.dart';

class UserProvider with ChangeNotifier {
  late User loggedInUser;

  final UserService userService = serviceLocator<UserService>();

  void setLoggedInUser(User user) {
    loggedInUser = user;
    print(loggedInUser.userName);
    notifyListeners();
  }

  void updateLoggedInUser(User updatedUser) {
    loggedInUser = updatedUser;
    notifyListeners();
  }

  void registerUser(User user) {
    notifyListeners();
  }
}
