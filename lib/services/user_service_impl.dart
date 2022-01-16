import 'package:twitter/data/data_store.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/services/user_service.dart';

class UserServiceFakeImpl implements UserService {
  DataStore dataStore = DataStore.instance;

  @override
  User? getUser(String userName) {
    for (User user in dataStore.users) {
      if (user.userName == userName) {
        return user;
      } else {
        continue;
      }
    }
    return null;
  }

  @override
  User? loginUser(String userName, String password) {
    User? user = getUser(userName);
    if (user != null) {
      if (user.userName == userName && user.password == password) {
        //print(user.userName);
        return user;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  User? registerUser(User user) {
    dataStore.users.add(user);
    return user;
  }

  @override
  bool checkCredentials(String userName, String password) {
    if (checkIfUserExists(userName)) {
      User? user = getUser(userName);
      if (user!.userName == userName && user.password == password) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Set<User> getAllUsers() {
    return dataStore.users;
  }

  @override
  bool checkIfUserExists(String userName) {
    User? user = getUser(userName);
    return user != null;
  }
}
