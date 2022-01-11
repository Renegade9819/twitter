import 'package:flutter/material.dart';
import 'package:twitter/utils/form_util.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FormUtility formUtility = FormUtility();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
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
                if (_formKey.currentState!.validate()) {
                  String userName = userNameController.text;
                  String password = passwordController.text;
                  signIn(userName, password);
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

  void signIn(String userName, String password) {
    print(userName + ' ' + password);
  }
}
