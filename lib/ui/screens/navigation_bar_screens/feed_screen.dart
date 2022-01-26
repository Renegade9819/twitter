import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/core/models/tweet.dart';
import 'package:twitter/core/providers/tweet_provider.dart';
import 'package:twitter/core/services/service_locator.dart';
import 'package:twitter/core/services/tweet_service.dart';
import 'package:twitter/core/viewstate.dart';
import 'package:twitter/ui/widgets/plane_indicator.dart';
import 'package:twitter/ui/widgets/shimmer_widget.dart';
import 'package:twitter/ui/widgets/tweet_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final TweetService tweetServiceWeb = serviceLocator<TweetService>();

  @override
  void initState() {
    getAllTweets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<TweetProvider>().state == ViewState.busy) {
      return ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                dense: true,
                leading: ShimmerWidget.circular(width: 64, height: 64),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: ShimmerWidget.rectangular(
                    width: 140,
                    height: 20,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: ShimmerWidget.rectangular(
                      width: double.infinity, height: 30),
                ),
              ),
            );
          });
    } else {
      return PlaneIndicator(
        child: ListView.builder(
            itemCount: context.watch<TweetProvider>().allTweets.length,
            itemBuilder: (context, index) {
              int key = context
                  .watch<TweetProvider>()
                  .allTweets
                  .keys
                  .elementAt(index);
              return TweetCard(
                tweet: context.watch<TweetProvider>().allTweets[key]!,
              );
            }),
      );
    }

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
        .getLatestTweets(allTweets);
  }

  // Future<void> pullRefreshTweets() async {
  //   getAllTweets();
  // List<Tweet> allTweets = await tweetServiceWeb.getAllTweets();
  // Provider.of<TweetProvider>(context, listen: false)
  //     .updateLatestTweetList(allTweets);
  // }
}
