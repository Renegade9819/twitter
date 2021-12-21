import 'package:flutter/material.dart';

class CookieScreen extends StatelessWidget {
  const CookieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 22.0,
        ),
        title: const Text(
          'Cookies',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            'Not exactly cookies but login session will be stored on the local device.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
