import 'package:flutter/material.dart';
import 'package:twitter/core/models/user.dart';
import 'package:twitter/ui/screens/profile_screen.dart';
import 'package:twitter/ui/screens/chat_screen.dart';
import 'package:twitter/ui/screens/edit_profile_screen.dart';
import 'package:twitter/ui/screens/home_screen.dart';
import 'package:twitter/ui/screens/signin_screen.dart';
import 'package:twitter/ui/screens/signup_screen.dart';
import 'package:twitter/ui/screens/terms/cookie_screen.dart';
import 'package:twitter/ui/screens/terms/privacy_screen.dart';
import 'package:twitter/ui/screens/terms/terms_screen.dart';
import 'package:twitter/ui/screens/tweet_screen.dart';
import 'package:twitter/ui/screens/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/terms':
        return MaterialPageRoute(builder: (_) => const TermsScreen());
      case '/privacyPolicy':
        return MaterialPageRoute(builder: (_) => const PrivacyScreen());
      case '/cookies':
        return MaterialPageRoute(builder: (_) => const CookieScreen());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/profile":
        var user = settings.arguments as User;
        return MaterialPageRoute(
            builder: (_) => ProfileScreen(
                  passedUser: user,
                ));
      case '/tweetScreen':
        return MaterialPageRoute(builder: (_) => const TweetScreen());
      case '/chatScreen':
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case '/editProfile':
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
