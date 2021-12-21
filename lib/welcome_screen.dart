import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
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
          const SizedBox(height: 110),
          const Text(
            "See what's happening \nin the world right now.",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 140),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: SizedBox(
              width: double.infinity,
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
          ),
          Row(
            children: const <Widget>[
              Expanded(
                child: Divider(
                  color: Colors.black38,
                  indent: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'or',
                  style: TextStyle(color: Colors.black38),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black38,
                  endIndent: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Sign Up',
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
          ),
          const SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  const TextSpan(text: 'By signing up, you agree to our '),
                  TextSpan(
                      text: 'Terms',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/terms');
                        }),
                  const TextSpan(text: ', '),
                  TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/privacyPolicy');
                        }),
                  const TextSpan(text: ', and '),
                  TextSpan(
                      text: 'Cookie use',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/cookies');
                        }),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
