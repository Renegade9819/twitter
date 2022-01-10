import 'package:twitter/models/user.dart';

class Tweet {
  int? _tweetId;
  String? _tweetBody;
  int likes = 0;
  bool? containsMedia;
  String? mediaURL;

  User? user;

  void like() {
    likes = likes + 1;
  }

  void dislike() {
    if (likes > 0) {
      likes = likes - 1;
    }
  }
}
