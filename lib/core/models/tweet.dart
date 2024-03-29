import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter/core/models/user.dart';

part 'tweet.freezed.dart';
part 'tweet.g.dart';

@freezed
class Tweet with _$Tweet {
  Tweet._();

  @JsonSerializable(explicitToJson: true)
  factory Tweet(
      {int? tweetId,
      required String tweetBody,
      @Default(0) int likes,
      @Default(false) bool isLiked,
      @Default(false) bool isRetweeted,
      @Default(false) bool containsMedia,
      int? mediaId,
      required DateTime postDate,
      required User user}) = _Tweet;

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
}
