import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter/ui/widgets/SignInForm.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            child: SizedBox(
              height: deviceSize.height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      'Sign in to Twitter',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  const SignInForm(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          const TextSpan(
                              text: "Don't have a twitter account? "),
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/signup',
                                );
                              },
                          ),
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
