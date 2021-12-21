import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 50.0),
                  child: Image.asset(
                    'assets/images/twitterlogo.png',
                    height: 30,
                    width: 30,
                  ),
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
              Center(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  width: screenWidth - 60,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    controller: userNameController,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  width: screenWidth - 60,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    controller: passwordController,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: screenWidth - 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(250, 50),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      const TextSpan(text: "Don't have a twitter account? "),
                      TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                  context, '/signup');
                            }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
