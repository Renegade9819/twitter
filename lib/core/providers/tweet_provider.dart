import 'package:flutter/cupertino.dart';
import 'package:twitter/core/models/tweet.dart';
import 'package:twitter/core/services/service_locator.dart';
import 'package:twitter/core/services/tweet_service_api.dart';

class TweetProvider with ChangeNotifier {
  final TweetServiceAPI tweetServiceWeb = serviceLocator<TweetServiceAPI>();

  Map<int, Tweet> allTweets = {};
  Map<int, Tweet> likedTweets = {};
  Map<int, Tweet> userTweets = {};
  Map<int, Tweet> userMediaTweets = {};

  Future<void> updateLatestTweetList(List<Tweet> updatedTweets) async {
    allTweets = {};
    for (var tweet in updatedTweets) {
      allTweets[tweet.tweetId!] = tweet;
    }
    notifyListeners();
  }

  Future<void> updateUserTweetsList(List<Tweet> updatedUserTweets) async {
    userTweets = {};
    for (var tweet in updatedUserTweets) {
      userTweets[tweet.tweetId!] = tweet;
    }
    notifyListeners();
  }

  Future<void> updateUserLikedTweetsList(List<Tweet> updatedLikedTweets) async {
    likedTweets = {};
    for (var tweet in updatedLikedTweets) {
      likedTweets[tweet.tweetId!] = tweet;
    }
    notifyListeners();
  }

  Future<void> updateUserMediaTweetList(List<Tweet> updatedMediaTweets) async {
    userMediaTweets = {};
    for (var tweet in updatedMediaTweets) {
      userMediaTweets[tweet.tweetId!] = tweet;
    }
    notifyListeners();
  }

  void addToAllTweets(Tweet tweet) {
    allTweets.addAll({tweet.tweetId!: tweet});
    notifyListeners();
  }

  void removeFromAllTweets(int tweetId) {
    allTweets.remove(tweetId);
    notifyListeners();
  }

  void addToUserTweets(Tweet tweet) {
    userTweets.addAll({tweet.tweetId!: tweet});
    notifyListeners();
  }

  void removeFromUserTweets(int tweetId) {
    userTweets.remove(tweetId);
    notifyListeners();
  }

  void addToUserMediaTweets(Tweet tweet) {
    userMediaTweets.addAll({tweet.tweetId!: tweet});
    notifyListeners();
  }

  void removeFromUserMediaTweets(int tweetId) {
    userMediaTweets.remove(tweetId);
    notifyListeners();
  }

  void addToLikedTweets(Tweet tweet) {
    likedTweets.addAll({tweet.tweetId!: tweet});
    notifyListeners();
  }

  void removeFromLikedTweets(int tweetId) {
    likedTweets.remove(tweetId);
    notifyListeners();
  }

  void updateTweet(Tweet tweet) {
    allTweets[tweet.tweetId!] = tweet;
    notifyListeners();
  }
}
