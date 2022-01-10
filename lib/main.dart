import 'package:flutter/material.dart';
import 'package:twitter/another_profile_screen.dart';
import 'package:twitter/chat_screen.dart';
import 'package:twitter/components/message_tile.dart';
import 'package:twitter/components/tweet_card.dart';
import 'package:twitter/home_screen.dart';
import 'package:twitter/profile_screen.dart';
import 'package:twitter/signin_screen.dart';
import 'package:twitter/signup_screen.dart';
import 'package:twitter/terms/cookie_screen.dart';
import 'package:twitter/terms/privacy_screen.dart';
import 'package:twitter/terms/terms_screen.dart';
import 'package:twitter/tweet_screen.dart';
import 'package:twitter/welcome_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fwitter',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/terms': (context) => const TermsScreen(),
        '/privacyPolicy': (context) => const PrivacyScreen(),
        '/cookies': (context) => const CookieScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/signin': (context) => const SignInScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const AnotherProfileScreen(),
        '/tweetCard': (context) => const TweetCard(),
        '/messageTile': (context) => const MessageTile(),
        '/tweetScreen': (context) => const TweetScreen(),
        '/chatScreen': (context) => const ChatScreen(),
      },
      initialRoute: '/signup',
    ),
  );
}
