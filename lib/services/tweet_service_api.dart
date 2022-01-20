import 'dart:io';

import 'package:twitter/models/tweet.dart';

abstract class TweetServiceAPI {
  Future<Tweet> postTweet(Tweet tweet);
  Future<int> postMediaTweet(File mediaFile, String userName);
  Future<List<Tweet>> getAllTweets();
  Future<List<Tweet>> getUserTweets(String userName);
  Future<List<Tweet>> getUserLikedTweets(String userName);
  Future<List<Tweet>> getUserMediaTweets(String userName);
  Future<bool> likeTweet(int tweetId, String userName);
  Future<bool> unlikeTweet(int tweetId, String userName);
}
