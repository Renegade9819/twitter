import 'package:twitter/models/user.dart';

abstract class UserService {
  User? getUser(String userName);
  User? loginUser(String userName, String password);
  User? registerUser(User user);
  bool checkCredentials(String userName, String password);
  bool checkIfUserExists(String userName);
}
