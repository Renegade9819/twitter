import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter/ui/widgets/SignUpForm.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 40.0),
                    child: Image.asset(
                      'assets/images/twitterlogo.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      'Make a Twitter account',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  const SignUpForm(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          const TextSpan(text: 'Have an account already? '),
                          TextSpan(
                              text: 'Sign In',
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, '/signin');
                                }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
