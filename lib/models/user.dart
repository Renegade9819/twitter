import 'package:twitter/models/tweet.dart';

class User {
  String? userName;
  String? password;
  String? name;
  String? avatarURL;
  DateTime? dob;
  DateTime? joinDate;

  Set<Tweet> usertweets = {};
  Set<Tweet> likedTweets = {};

  void addTweetToLikes(Tweet tweet) {
    likedTweets.add(tweet);
  }

  void removeTweetFromLikes(Tweet tweet) {
    likedTweets.remove(tweet);
  }
}
