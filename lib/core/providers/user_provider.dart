import 'package:flutter/cupertino.dart';
import 'package:twitter/core/models/user.dart';
import 'package:twitter/core/services/service_locator.dart';
import 'package:twitter/core/services/user_service.dart';
import 'package:twitter/core/viewstate.dart';

class UserProvider with ChangeNotifier {
  UserService userService = serviceLocator<UserService>();

  late User _loggedInUser;

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  User get loggedInUser => _loggedInUser;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<bool> checkIfUserExists(String userName) async {
    bool ifExists = await userService.checkIfUserExists(userName);
    return ifExists;
  }

  Future<bool> loginUser(String userName, String password) async {
    setState(ViewState.busy);
    bool isCorrect = await userService.loginUser(userName, password);
    if (isCorrect) {
      setState(ViewState.idle);
      return false;
    } else {
      User user = await userService.getUser(userName);
      setLoggedInUser(user);
      setState(ViewState.idle);
      return true;
    }
  }

  Future<bool> signUpUser(User user) async {
    setState(ViewState.busy);
    bool isRegisteredSuccessfully = await userService.registerUser(user);

    if (isRegisteredSuccessfully) {
      User newUser = await userService.getUser(user.userName);
      setLoggedInUser(newUser);
      setState(ViewState.idle);
      return true;
    } else {
      setState(ViewState.idle);
      return false;
    }
  }

  void setLoggedInUser(User user) {
    _loggedInUser = user;
    print(_loggedInUser.userName);
  }
}
