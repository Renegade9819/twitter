import 'package:twitter/models/tweet.dart';

abstract class TweetService {
  Tweet? getTweet(int tweetId);
  Set<Tweet>? getAllTweets();
  Set<Tweet>? getAllUserTweets(String userName);
  Set<Tweet>? getAllLikedTweets(String userName);
  void postTweet(String userName, Tweet tweet, int tweetId);
  void likeTweet(String userName, int tweetId);
  void dislikeTweet(String userName, int tweetId);
}
