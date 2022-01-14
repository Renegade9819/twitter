import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/providers/user_provider.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/user_service.dart';
import 'package:twitter/utils/form_util.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FormUtility formUtility = FormUtility();

  UserService userService = serviceLocator<UserService>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _signInFormKey,
      child: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              width: screenWidth - 60,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                controller: userNameController,
                validator: formUtility.loginValidateUsername,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              width: screenWidth - 60,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                controller: passwordController,
                obscureText: true,
                validator: formUtility.loginValidatePassword,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: screenWidth - 60,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_signInFormKey.currentState!.validate()) {
                  String userName = userNameController.text;
                  String password = passwordController.text;
                  if (userService.checkCredentials(userName, password)) {
                    User? user = userService.loginUser(userName, password);
                    Provider.of<UserProvider>(context, listen: false)
                        .setLoggedInUser(user!);
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    const snackBar = SnackBar(
                      content: Text("Wrong Username or Password."),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn(String userName, String password) {
    print(userName + ' ' + password);
  }
}
