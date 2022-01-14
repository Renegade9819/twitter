import 'package:twitter/data/data_store.dart';
import 'package:twitter/models/tweet.dart';
import 'package:twitter/services/tweet_service.dart';

class TweetServiceFakeImpl implements TweetService {
  DataStore dataStore = DataStore.instance;

  @override
  Set<Tweet>? getAllLikedTweets(String userName) {
    Set<Tweet> likedTweets = {};

    Set<int>? likedTweetsId = dataStore.likedTweets[userName];

    for (int tweetId in likedTweetsId!) {
      Tweet? tweet = getTweet(tweetId);
      if (tweet != null) {
        likedTweets.add(tweet);
      }
    }
    return likedTweets;
  }

  @override
  Set<Tweet>? getAllTweets() {
    return dataStore.tweets;
  }

  @override
  Set<Tweet>? getAllUserTweets(String userName) {
    Set<Tweet> userTweets = {};

    Set<int>? userTweetsId = dataStore.userTweets[userName];

    for (int tweetId in userTweetsId!) {
      Tweet? tweet = getTweet(tweetId);
      if (tweet != null) {
        userTweets.add(tweet);
      }
    }
    return userTweets;
  }

  @override
  Tweet? getTweet(int tweetId) {
    for (Tweet tweet in dataStore.tweets) {
      if (tweet.tweetId == tweetId) {
        return tweet;
      }
    }
    return null;
  }

  @override
  void dislikeTweet(String userName, int tweetId) {
    dataStore.likedTweets[userName]!.remove(tweetId);
  }

  @override
  void likeTweet(String userName, int tweetId) {
    dataStore.likedTweets[userName]!.add(tweetId);
  }

  @override
  void postTweet(String userName, Tweet tweet, int tweetId) {
    dataStore.tweets.add(tweet);
    dataStore.userTweets[userName]!.add(tweetId);
  }
}
