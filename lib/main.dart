import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/core/providers/tweet_provider.dart';
import 'package:twitter/core/providers/user_provider.dart';
import 'package:twitter/core/services/service_locator.dart';
import 'package:twitter/ui/router.dart';

void main() {
  setupServiceLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => TweetProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Twitter',
        initialRoute: '/welcome',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    ),
  );
}
