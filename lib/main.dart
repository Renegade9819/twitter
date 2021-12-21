import 'package:flutter/material.dart';
import 'package:twitter/signin_screen.dart';
import 'package:twitter/signup_screen.dart';
import 'package:twitter/terms/cookie_screen.dart';
import 'package:twitter/terms/privacy_screen.dart';
import 'package:twitter/terms/terms_screen.dart';
import 'package:twitter/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Fwitter',
    routes: {
      '/welcome': (context) => const WelcomeScreen(),
      '/terms': (context) => const TermsScreen(),
      '/privacyPolicy': (context) => const PrivacyScreen(),
      '/cookies': (context) => const CookieScreen(),
      '/signup': (context) => const SignUpScreen(),
      '/signin': (context) => const SignInScreen(),
    },
    initialRoute: '/welcome',
  ));
}
