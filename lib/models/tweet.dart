import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter/models/user.dart';

part 'tweet.freezed.dart';
part 'tweet.g.dart';

@freezed
class Tweet with _$Tweet {
  Tweet._();

  factory Tweet(
      {required int tweetId,
      required String tweetBody,
      @Default(0) int? likes,
      @Default(false) bool? isLiked,
      bool? containsMedia,
      String? mediaURL,
      required String userName}) = _Tweet;

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
}
