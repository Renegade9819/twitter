import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/components/tweet_card.dart';
import 'package:twitter/models/tweet.dart';
import 'package:twitter/providers/tweet_provider.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/tweet_service.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  TweetService tweetService = serviceLocator<TweetService>();
  Set<Tweet>? tweets;

  @override
  void initState() {
    Provider.of<TweetProvider>(context, listen: false).loadAllTweets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TweetProvider>(builder: (context, tweets, child) {
      return tweets.allTweets!.isNotEmpty
          ? ListView.builder(
              itemCount: tweets.allTweets!.length,
              itemBuilder: (context, index) {
                return TweetCard(
                  tweet: tweets.allTweets!.elementAt(index),
                );
              },
            )
          : Container();
    });
  }

  //   return tweets!.isNotEmpty
  //       ? ListView.builder(
  //           itemCount: tweets!.length,
  //           itemBuilder: (context, index) {
  //             return TweetCard(
  //               tweet: tweets!.elementAt(index),
  //             );
  //           },
  //         )
  //       : Container();
  // }
}
