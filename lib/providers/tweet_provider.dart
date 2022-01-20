import 'package:flutter/cupertino.dart';
import 'package:twitter/models/tweet.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/tweet_service.dart';

class TweetProviderOld with ChangeNotifier {
  final TweetService tweetService = serviceLocator<TweetService>();

  Set<Tweet>? allTweets = {};
  Set<Tweet>? likedTweets = {};
  Set<Tweet> reTweets = {};

  void loadAllTweets() {
    allTweets = tweetService.getAllTweets();
    //notifyListeners();
  }

  void postTweet(Tweet newTweet) {
    allTweets!.add(newTweet);
    tweetService.postTweet(newTweet.userName, newTweet, newTweet.tweetId!);
    notifyListeners();
  }

  void loadLikedTweets(String userName) {
    likedTweets = tweetService.getAllLikedTweets(userName);
    notifyListeners();
  }

  void toggleLike(int tweetId, String userName) {
    Tweet? tweet;
    for (Tweet likedTweet in likedTweets!) {
      if (likedTweet.tweetId == tweetId) {
        tweet = likedTweet;
      }
    }
    bool? _isTweetLiked = tweet!.isLiked;
    if (_isTweetLiked != null) {
      Tweet updatedTweet = tweet.copyWith(isLiked: !_isTweetLiked);
      if (_isTweetLiked) {
        _addToLikes(updatedTweet, userName);
      } else {
        _removeFromLikes(updatedTweet, userName);
      }
    }
    notifyListeners();
  }

  void _addToLikes(Tweet updatedTweet, String userName) {
    Tweet? tweet = tweetService.getTweet(updatedTweet.tweetId!);
    likedTweets!.add(tweet!);
    tweetService.likeTweet(userName, tweet.tweetId!);
  }

  void _removeFromLikes(Tweet updatedTweet, String userName) {
    Tweet? tweet = tweetService.getTweet(updatedTweet.tweetId!);
    for (Tweet t in likedTweets!) {
      if (t.tweetId == tweet!.tweetId) {
        likedTweets!.remove(t);
        break;
      }
    }
    tweetService.dislikeTweet(userName, tweet!.tweetId!);
  }
}
