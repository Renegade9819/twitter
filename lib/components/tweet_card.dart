import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweetCard extends StatefulWidget {
  const TweetCard({Key? key}) : super(key: key);

  @override
  _TweetCardState createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  bool isLiked = false;
  bool isRetweeted = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Card(
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: const <Widget>[
                            Text(
                              'Name',
                            ),
                            SizedBox(width: 5),
                            Text(
                              '@Handle',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '•',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '4d',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Tweet Body',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              iconSize: 16,
                              padding: EdgeInsets.zero,
                              splashRadius: 20,
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(CupertinoIcons.chat_bubble),
                            ),
                            IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              iconSize: 16,
                              padding: EdgeInsets.zero,
                              splashRadius: 20,
                              constraints: BoxConstraints(),
                              color: isRetweeted ? Colors.green : Colors.black,
                              onPressed: () {
                                setState(() {
                                  isRetweeted = !isRetweeted;
                                });
                              },
                              icon: Icon(CupertinoIcons.arrow_2_squarepath),
                            ),
                            IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              iconSize: 16,
                              padding: EdgeInsets.zero,
                              splashRadius: 20,
                              constraints: BoxConstraints(),
                              color: isLiked ? Colors.red : Colors.black,
                              onPressed: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                              },
                              icon: isLiked
                                  ? Icon(CupertinoIcons.heart_fill)
                                  : Icon(CupertinoIcons.heart),
                            ),
                            IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              iconSize: 16,
                              padding: EdgeInsets.zero,
                              splashRadius: 20,
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(Icons.share_outlined),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  iconSize: 20,
                  splashRadius: 20,
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
