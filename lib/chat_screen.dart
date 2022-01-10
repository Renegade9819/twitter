import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List chatSim = [
    true,
    false,
    true,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          shape: const Border(
            bottom: BorderSide(color: Colors.black12),
          ),
          leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Person',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 53),
            child: ListView.builder(
              reverse: true,
              itemCount: chatSim.length,
              itemBuilder: (context, index) {
                return buildChat(chatSim[index]);
              },
            ),
          ),
        ),
        bottomSheet: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
              color: Colors.black12,
            )),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    splashRadius: 24,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_photo_alternate_rounded,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxHeight: 50),
                      child: const TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                        ),
                        textInputAction: TextInputAction.newline,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const VerticalDivider(
                    color: Colors.black26,
                  ),
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    splashRadius: 24,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChat(bool chat) {
    var deviceSize = MediaQuery.of(context).size.width;
    if (chat) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Bruh',
                style: TextStyle(color: Colors.white),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14)),
            ),
            constraints: BoxConstraints(maxWidth: deviceSize * 0.7),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Bruh wapifjapw japfja opwjf apow a;on aopwfna waofinaw oinf of nwoi fnowi nfoiw nowan awl kfn a nalwkfn a ina lak n',
                style: TextStyle(color: Colors.white),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14)),
            ),
            constraints: BoxConstraints(maxWidth: deviceSize * 0.7),
          ),
        ),
      );
    }
  }
}
