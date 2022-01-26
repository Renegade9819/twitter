import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twitter/core/models/tweet.dart';
import 'package:twitter/core/models/user.dart';
import 'package:twitter/core/providers/user_provider.dart';
import 'package:twitter/core/services/service_locator.dart';
import 'package:twitter/constants/api_constants.dart' as api;
import 'package:twitter/core/services/tweet_service.dart';
import 'package:twitter/core/services/user_service.dart';
import 'package:twitter/core/viewstate.dart';
import 'package:twitter/ui/screens/image_fullscreen.dart';
import 'package:twitter/ui/widgets/shimmer_widget.dart';

class TweetCard extends StatefulWidget {
  final Tweet tweet;
  const TweetCard({
    Key? key,
    required this.tweet,
  }) : super(key: key);

  @override
  _TweetCardState createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  final TweetService tweetServiceWeb = serviceLocator<TweetService>();
  final UserService userServiceWeb = serviceLocator<UserService>();
  final UserProvider userProvider = serviceLocator<UserProvider>();

  late Tweet tweet;

  bool isRetweeted = false;
  @override
  void initState() {
    tweet = widget.tweet;
    super.initState();
  }

  fetchUser(String userName) async {
    return await userProvider.getUserDetails(userName);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, '/profile', arguments: tweet.user),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: tweet.user.avatarId == null
                    ? const AssetImage("assets/avatars/default_avatar.png")
                    : NetworkImage(api.avatarUrl + "${tweet.user.avatarId}")
                        as ImageProvider,
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
                        tweet.user.name,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '@' + tweet.user.userName,
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '•',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        getTweetPostDate(tweet.postDate),
                        style: const TextStyle(fontWeight: FontWeight.w300),
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
                          child: GestureDetector(
                            child: Hero(
                              tag: 'imageHeroSmall' + tweet.mediaId.toString(),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 0),
                                constraints:
                                    const BoxConstraints(maxHeight: 200),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(
                                      api.mediaUrl + "${tweet.mediaId}",
                                    ),
                                    frameBuilder: (context, child, frame,
                                        wasSynchronouslyLoaded) {
                                      if (wasSynchronouslyLoaded) {
                                        return child;
                                      } else {
                                        return AnimatedSwitcher(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          child: frame != null
                                              ? child
                                              : Container(
                                                  width: double.infinity,
                                                  color: Colors.grey,
                                                ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) {
                                  return ImageFullScreen(
                                      mediaId: tweet.mediaId!);
                                }),
                              ),
                            },
                          ),
                        )
                      : Container(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        highlightColor: Colors.transparent,
                        iconSize: 16,
                        padding: EdgeInsets.zero,
                        splashRadius: 20,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.chat_bubble),
                      ),
                      IconButton(
                        highlightColor: Colors.transparent,
                        iconSize: 16,
                        padding: EdgeInsets.zero,
                        splashRadius: 20,
                        constraints: const BoxConstraints(),
                        color: isRetweeted ? Colors.green : Colors.black,
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.arrow_2_squarepath),
                      ),
                      IconButton(
                        highlightColor: Colors.transparent,
                        iconSize: 16,
                        padding: EdgeInsets.zero,
                        splashRadius: 20,
                        constraints: const BoxConstraints(),
                        color: tweet.isLiked ? Colors.red : Colors.black,
                        onPressed: () {},
                        icon: tweet.isLiked
                            ? const Icon(CupertinoIcons.heart_fill)
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
    );
  }
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
  String formattedPostDate = DateFormat.MEd().format(postDate);
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
