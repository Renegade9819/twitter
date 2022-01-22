import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  const MessageTile({Key? key}) : super(key: key);

  @override
  _MessageTileState createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ListTile(
          tileColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 0, 0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
            ),
          ),
          title: Text(
            'Name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Last Message',
            style: TextStyle(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          trailing: Text(
            '8m',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
