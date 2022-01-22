import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/tweet_provider.dart';
import 'package:twitter/providers/user_provider.dart';
import 'package:twitter/screens/another_profile_screen.dart';
import 'package:twitter/screens/chat_screen.dart';
import 'package:twitter/screens/edit_profile_screen.dart';
import 'package:twitter/screens/home_screen.dart';
import 'package:twitter/screens/search_users.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:twitter/screens/signup_screen.dart';
import 'package:twitter/screens/tweet_screen.dart';
import 'package:twitter/screens/welcome_screen.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/terms/cookie_screen.dart';
import 'package:twitter/terms/privacy_screen.dart';
import 'package:twitter/terms/terms_screen.dart';
import 'package:twitter/widgets/message_tile.dart';

void main() {
  setupServiceLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => TweetProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Twitter',
        routes: {
          '/welcome': (context) => const WelcomeScreen(),
          '/terms': (context) => const TermsScreen(),
          '/privacyPolicy': (context) => const PrivacyScreen(),
          '/cookies': (context) => const CookieScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/signin': (context) => const SignInScreen(),
          '/home': (context) => const HomeScreen(),
          '/profile': (context) => const AnotherProfileScreen(),
          //'/tweetCard': (context) =>  TweetCard(),
          '/searchUsers': (context) => const SearchUsers(),
          '/messageTile': (context) => const MessageTile(),
          '/tweetScreen': (context) => const TweetScreen(),
          '/chatScreen': (context) => const ChatScreen(),
          '/editProfile': (context) => const EditProfileScreen(),
        },
        initialRoute: '/welcome',
      ),
    ),
  );
}
