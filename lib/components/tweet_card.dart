import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twitter/models/tweet.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/screens/image_fullscreen.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/tweet_service.dart';
import 'package:twitter/services/tweet_service_api.dart';
import 'package:twitter/services/user_service.dart';
import 'package:twitter/services/user_service_api.dart';
import 'package:twitter/api/api_constants.dart' as api;

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
  final TweetServiceAPI tweetServiceWeb = serviceLocator<TweetServiceAPI>();
  final UserServiceAPI userServiceWeb = serviceLocator<UserServiceAPI>();

  late Tweet tweet;
  @override
  void initState() {
    tweet = widget.tweet;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: userServiceWeb.getUser(tweet.userName),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container();
            default:
              if (snapshot.hasError || snapshot.data == null) {
                return Container();
              } else {
                return Card(
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/profile',
                              arguments: snapshot.data),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  buildAvatar(snapshot.data!.avatarId),
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
                                      snapshot.data!.name,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '@' + snapshot.data!.userName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      getTweetPostDate(tweet.postDate),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  tweet.tweetBody,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                ),
                                tweet.containsMedia
                                    ? Center(
                                        child:
                                            buildMedia(tweet.mediaId!, context))
                                    : Container(),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      highlightColor: Colors.transparent,
                                      iconSize: 16,
                                      padding: EdgeInsets.zero,
                                      splashRadius: 20,
                                      constraints: const BoxConstraints(),
                                      onPressed: () {},
                                      icon: const Icon(
                                          CupertinoIcons.chat_bubble),
                                    ),
                                    IconButton(
                                      highlightColor: Colors.transparent,
                                      iconSize: 16,
                                      padding: EdgeInsets.zero,
                                      splashRadius: 20,
                                      constraints: const BoxConstraints(),
                                      color: Colors.green,
                                      onPressed: () {},
                                      icon: const Icon(
                                          CupertinoIcons.arrow_2_squarepath),
                                    ),
                                    IconButton(
                                      highlightColor: Colors.transparent,
                                      iconSize: 16,
                                      padding: EdgeInsets.zero,
                                      splashRadius: 20,
                                      constraints: const BoxConstraints(),
                                      color: tweet.isLiked!
                                          ? Colors.red
                                          : Colors.black,
                                      onPressed: () {},
                                      icon: tweet.isLiked!
                                          ? const Icon(
                                              CupertinoIcons.heart_fill)
                                          : const Icon(CupertinoIcons.heart),
                                    ),
                                    IconButton(
                                      highlightColor: Colors.transparent,
                                      iconSize: 16,
                                      padding: EdgeInsets.zero,
                                      splashRadius: 20,
                                      constraints: const BoxConstraints(),
                                      onPressed: () {},
                                      icon: const Icon(Icons.share_outlined),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          highlightColor: Colors.transparent,
                          iconSize: 20,
                          splashRadius: 20,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded),
                        ),
                      ],
                    ),
                  ),
                );
              }
          }
        });
  }

  ImageProvider buildAvatar(int? avatarId) {
    ImageProvider imageWidget;
    if (avatarId == null) {
      imageWidget = const AssetImage("assets/avatars/default_avatar.png");
      return imageWidget;
    } else {
      imageWidget = NetworkImage(api.avatarUrl + "$avatarId");
      return imageWidget;
    }
  }

  String getTweetPostDate(DateTime postDate) {
    String formattedPostDate = DateFormat.d().format(postDate);
    print(formattedPostDate);
    return formattedPostDate;
  }

  Widget buildMedia(int mediaId, context) {
    return GestureDetector(
      child: Hero(
        tag: 'imageHeroSmall' + mediaId.toString(),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          constraints: const BoxConstraints(maxHeight: 200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              api.mediaUrl + "$mediaId",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return ImageFullScreen(mediaId: mediaId);
          }),
        ),
      },
    );
  }
}
