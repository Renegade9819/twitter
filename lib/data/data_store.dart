import 'package:flutter/material.dart';
import 'package:twitter/models/tweet.dart';
import 'package:twitter/models/user.dart';

class DataStore {
  Set<User> users = {};
  Set<Tweet> tweets = {};

  Map<String, Set<int>> userTweets = {};
  Map<String, Set<int>> likedTweets = {};
  Map<String, Set<int>> reTweets = {};

  User batman = User(
      userName: "batman000",
      password: "batman123",
      name: "Bruce Wayne",
      joinDate: DateUtils.dateOnly(DateTime.now()),
      dob: DateTime.parse('02-09-1998'),
      avatarURL: "assets/avatars/batman.png");

  User superman = User(
    userName: "supman",
    password: "superman123",
    name: "Clark Kent",
    joinDate: DateUtils.dateOnly(DateTime.now()),
    dob: DateTime.parse('17-07-2000'),
    avatarURL: "assets/avatars/superman.png",
  );

  User wonderwoman = User(
    userName: "wonderW",
    password: "ww123",
    name: "Diana Prince",
    joinDate: DateUtils.dateOnly(DateTime.now()),
    dob: DateTime.parse('24-06-2002'),
    avatarURL: "assets/avatars/wonderwoman.png",
  );

  User flash = User(
    userName: "fastflash",
    password: "flash123",
    name: "Barry Allen",
    joinDate: DateUtils.dateOnly(DateTime.now()),
    dob: DateTime.parse('01-01-2001'),
    avatarURL: "assets/avatars/flash.png",
  );

  Tweet batmanTweetOne = Tweet(
    tweetId: 1,
    tweetBody: "Hi, this is Bruce Wayne.",
    isLiked: false,
    containsMedia: false,
    userName: "batman000",
  );

  Tweet supermanTweetOne = Tweet(
    tweetId: 2,
    tweetBody:
        "Hi, this is Clark Kent. I am superman. I am from a Krypton. Nice to meet you. Look at this photo I shot with my camera.",
    isLiked: false,
    containsMedia: true,
    mediaURL: "assets/images/supepic.jpg",
    userName: "supman",
  );

  Tweet wwTweetOne = Tweet(
    tweetId: 3,
    tweetBody:
        "Hi, this is Diana Prince. I am Wonder Woman. My lasso of truth be spitting facts.",
    isLiked: false,
    containsMedia: false,
    userName: "wonderW",
  );

  Tweet flashTweetOne = Tweet(
    tweetId: 1,
    tweetBody:
        "Hi, this is Flash. The fastest man in the universe. Just eating my salad.",
    isLiked: false,
    containsMedia: true,
    mediaURL: "assets/images/flashsalad.jpg",
    userName: "fastflash",
  );

  DataStore._populated() {
    populateUsers();
    populateTweets();
  }

  static final DataStore instance = DataStore._populated();

  void populateUsers() {
    users.add(batman);
    users.add(superman);
    users.add(wonderwoman);
    users.add(flash);
  }

  void populateTweets() {
    tweets.add(batmanTweetOne);
    tweets.add(supermanTweetOne);
    tweets.add(wwTweetOne);
    tweets.add(flashTweetOne);
  }
}
