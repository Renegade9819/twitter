import 'package:flutter/cupertino.dart';
import 'package:twitter/core/models/user.dart';

class UserProvider with ChangeNotifier {
  late User loggedInUser;

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
