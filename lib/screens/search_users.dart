import 'package:flutter/material.dart';

class SearchUsers extends StatefulWidget {
  const SearchUsers({Key? key}) : super(key: key);

  @override
  _SearchUsersState createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(color: Colors.black12),
        ),
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
