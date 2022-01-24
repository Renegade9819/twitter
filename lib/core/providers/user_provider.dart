import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:twitter/core/models/user.dart';
import 'package:twitter/core/services/service_locator.dart';
import 'package:twitter/core/services/user_service.dart';
import 'package:twitter/core/viewstate.dart';

class UserProvider with ChangeNotifier {
  UserService userService = serviceLocator<UserService>();

  late User loggedInUser;

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<User> getUserDetails(String userName) async {
    setState(ViewState.busy);
    User user = await userService.getUser(userName);
    setState(ViewState.idle);
    return user;
  }

  Future<bool> checkIfUserExists(String userName) async {
    bool ifExists = await userService.checkIfUserExists(userName);
    return ifExists;
  }

  Future<bool> loginUser(String userName, String password) async {
    setState(ViewState.busy);
    bool isCorrect = await userService.loginUser(userName, password);
    if (isCorrect) {
      User user = await userService.getUser(userName);
      setLoggedInUser(user);
      setState(ViewState.idle);
      return true;
    } else {
      setState(ViewState.idle);
      return false;
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

  Future<bool> updateUserDetails(User user) async {
    setState(ViewState.busy);
    User updatedUser = await userService.updateUser(user);
    setLoggedInUser(updatedUser);
    setState(ViewState.idle);
    return true;
  }

  Future<bool> changeAvatar(File avatarFile, String userName) async {
    setState(ViewState.busy);
    bool isAvatarUploaded =
        await userService.uploadUserAvatar(avatarFile, userName);

    if (isAvatarUploaded) {
      User updatedUser = await userService.getUser(userName);
      setLoggedInUser(updatedUser);
      setState(ViewState.idle);
      return true;
    } else {
      setState(ViewState.idle);
      return false;
    }
  }

  Future<bool> changeBackground(File bgFile, String userName) async {
    setState(ViewState.busy);
    bool isBgUploaded =
        await userService.uploadUserBackground(bgFile, userName);
    if (isBgUploaded) {
      User updatedUser = await userService.getUser(userName);
      setLoggedInUser(updatedUser);
      setState(ViewState.idle);
      return true;
    } else {
      setState(ViewState.idle);
      return false;
    }
  }

  void setLoggedInUser(User user) {
    loggedInUser = user;
    print(loggedInUser.userName);
    notifyListeners();
  }
}
