import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/components/tweet_card.dart';
import 'package:twitter/models/tweet.dart';
import 'package:twitter/providers/tweet_provider.dart';
import 'package:twitter/providers/tweet_provider_new.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/tweet_service.dart';
import 'package:twitter/services/tweet_service_api.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  TweetService tweetService = serviceLocator<TweetService>();
  final TweetServiceAPI tweetServiceWeb = serviceLocator<TweetServiceAPI>();

  @override
  void initState() {
    getAllTweets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TweetProvider>(builder: (context, tweets, child) {
      return tweets.allTweets.isNotEmpty
          ? RefreshIndicator(
              child: ListView.builder(
                itemCount: tweets.allTweets.length,
                itemBuilder: (context, index) {
                  int key = tweets.allTweets.keys.elementAt(index);
                  return TweetCard(
                    tweet: tweets.allTweets[key]!,
                  );
                },
              ),
              onRefresh: pullRefreshTweets,
            )
          : const Center(child: CircularProgressIndicator());
    });
  }

  getAllTweets() async {
    List<Tweet> allTweets = await tweetServiceWeb.getAllTweets();
    Provider.of<TweetProvider>(context, listen: false)
        .updateLatestTweetList(allTweets);
  }

  Future<void> pullRefreshTweets() async {
    List<Tweet> allTweets = await tweetServiceWeb.getAllTweets();
    Provider.of<TweetProvider>(context, listen: false)
        .updateLatestTweetList(allTweets);
  }
}
