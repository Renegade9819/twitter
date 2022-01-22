import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

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
          'Terms',
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
            'There are no terms. This is just a project I made to practice Flutter.',
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
