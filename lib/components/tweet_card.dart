import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter/models/tweet.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/providers/tweet_provider.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/tweet_service.dart';
import 'package:twitter/services/user_service.dart';

class TweetCard extends StatefulWidget {
  Tweet tweet;
  TweetCard({
    Key? key,
    required this.tweet,
  }) : super(key: key);

  @override
  _TweetCardState createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  UserService userService = serviceLocator<UserService>();
  TweetService tweetService = serviceLocator<TweetService>();

  @override
  Widget build(BuildContext context) {
    User? tweetUser = userService.getUser(widget.tweet.userName);
    Tweet tweet = widget.tweet;
    return Card(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/profile',
                  arguments: tweetUser!.userName),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  backgroundImage: tweetUser!.avatarURL == null
                      ? const AssetImage("assets/avatars/default_avatar.png")
                      : AssetImage(tweetUser.avatarURL!),
                ),
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
                      children: <Widget>[
                        Text(
                          tweetUser.name,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '@' + tweetUser.userName,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '•',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '4d',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      tweet.tweetBody,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                    tweet.containsMedia!
                        ? buildMedia(tweet.mediaURL)
                        : Container(),
                    const SizedBox(height: 10),
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
                          color: Colors.green,
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.arrow_2_squarepath),
                        ),
                        IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          iconSize: 16,
                          padding: EdgeInsets.zero,
                          splashRadius: 20,
                          constraints: BoxConstraints(),
                          color: tweet.isLiked! ? Colors.red : Colors.black,
                          onPressed: () {},
                          icon: tweet.isLiked!
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
    );
  }

  Widget buildMedia(String? mediaURL) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          mediaURL!,
          fit: BoxFit.contain,
        ),
        // child: Image.network(
        //   "https://images.unsplash.com/photo-1641113994135-a9f230b1f9b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        //   fit: BoxFit.contain,
        // ),
      ),
    );
  }
}
