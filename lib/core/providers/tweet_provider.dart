import 'package:flutter/cupertino.dart';
import 'package:twitter/core/models/tweet.dart';
import 'package:twitter/core/services/service_locator.dart';
import 'package:twitter/core/services/tweet_service.dart';
import 'package:twitter/core/viewstate.dart';

class TweetProvider with ChangeNotifier {
  final TweetService tweetServiceWeb = serviceLocator<TweetService>();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  Map<int, Tweet> allTweets = {};
  Map<int, Tweet> likedTweets = {};
  Map<int, Tweet> userTweets = {};
  Map<int, Tweet> userMediaTweets = {};

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<void> getLatestTweets(List<Tweet> tweets) async {
    setState(ViewState.busy);
    allTweets = {};
    await Future.delayed(const Duration(seconds: 2));
    for (var tweet in tweets) {
      allTweets[tweet.tweetId!] = tweet;
    }
    setState(ViewState.idle);
  }

  Future<void> updateLatestTweetList(List<Tweet> updatedTweets) async {
    allTweets = {};
    //await Future.delayed(const Duration(seconds: 3));
    for (var tweet in updatedTweets) {
      allTweets[tweet.tweetId!] = tweet;
    }
    notifyListeners();
  }

  Future<void> updateUserTweetsList(List<Tweet> updatedUserTweets) async {
    setState(ViewState.busy);
    userTweets = {};
    for (var tweet in updatedUserTweets) {
      userTweets[tweet.tweetId!] = tweet;
    }
    setState(ViewState.idle);
  }

  Future<void> updateUserLikedTweetsList(List<Tweet> updatedLikedTweets) async {
    likedTweets = {};
    for (var tweet in updatedLikedTweets) {
      likedTweets[tweet.tweetId!] = tweet;
    }
    //notifyListeners();
  }

  Future<void> updateUserMediaTweetList(List<Tweet> updatedMediaTweets) async {
    userMediaTweets = {};
    for (var tweet in updatedMediaTweets) {
      userMediaTweets[tweet.tweetId!] = tweet;
    }
    //notifyListeners();
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
