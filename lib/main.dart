import 'package:flutter/material.dart';
import 'package:twitter/welcome_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Fwitter',
    home: WelcomeScreen(),
  ));
}
