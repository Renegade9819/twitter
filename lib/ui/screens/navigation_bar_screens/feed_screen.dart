import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/core/models/tweet.dart';
import 'package:twitter/core/providers/tweet_provider.dart';
import 'package:twitter/core/services/service_locator.dart';
import 'package:twitter/core/services/tweet_service_api.dart';
import 'package:twitter/ui/widgets/tweet_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final TweetServiceAPI tweetServiceWeb = serviceLocator<TweetServiceAPI>();

  @override
  void initState() {
    getAllTweets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          itemCount: context.watch<TweetProvider>().allTweets.length,
          itemBuilder: (context, index) {
            int key =
                context.watch<TweetProvider>().allTweets.keys.elementAt(index);
            return TweetCard(
              tweet: context.watch<TweetProvider>().allTweets[key]!,
            );
          },
        ),
      ),
      onRefresh: pullRefreshTweets,
    );

    // return Consumer<TweetProvider>(builder: (context, tweets, child) {
    //   return tweets.allTweets.isNotEmpty
    //       ? RefreshIndicator(
    //           child: ListView.builder(
    //             itemCount: tweets.allTweets.length,
    //             itemBuilder: (context, index) {
    //               int key = tweets.allTweets.keys.elementAt(index);
    //               return TweetCard(
    //                 tweet: tweets.allTweets[key]!,
    //               );
    //             },
    //           ),
    //           onRefresh: pullRefreshTweets,
    //         )
    //       : const Center(child: CircularProgressIndicator());
    // });
  }

  getAllTweets() async {
    List<Tweet> allTweets = await tweetServiceWeb.getAllTweets();
    Provider.of<TweetProvider>(context, listen: false)
        .updateLatestTweetList(allTweets);
  }

  Future<void> pullRefreshTweets() async {
    getAllTweets();
    // List<Tweet> allTweets = await tweetServiceWeb.getAllTweets();
    // Provider.of<TweetProvider>(context, listen: false)
    //     .updateLatestTweetList(allTweets);
  }
}
