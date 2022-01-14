import 'package:flutter/material.dart';
import 'package:twitter/components/tweet_card.dart';
import 'package:twitter/models/tweet.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  //TweetService tweetService = TweetService.instance;
  @override
  Widget build(BuildContext context) {
    return Container(); // Set<Tweet> tweets = tweetService.getAllTweets();
    // return ListView.builder(
    //   itemCount: tweets.length,
    //   itemBuilder: (context, index) {
    //     return TweetCard(
    //       tweet: tweets.elementAt(index),
    //       likedTweetsList: false,
    //     );
    //   },
    // );
  }
}
