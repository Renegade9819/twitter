// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tweet _$$_TweetFromJson(Map<String, dynamic> json) => _$_Tweet(
      tweetId: json['tweetId'] as int?,
      tweetBody: json['tweetBody'] as String,
      likes: json['likes'] as int? ?? 0,
      isLiked: json['isLiked'] as bool? ?? false,
      isRetweeted: json['isRetweeted'] as bool? ?? false,
      containsMedia: json['containsMedia'] as bool? ?? false,
      mediaId: json['mediaId'] as int?,
      postDate: DateTime.parse(json['postDate'] as String),
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$$_TweetToJson(_$_Tweet instance) => <String, dynamic>{
      'tweetId': instance.tweetId,
      'tweetBody': instance.tweetBody,
      'likes': instance.likes,
      'isLiked': instance.isLiked,
      'isRetweeted': instance.isRetweeted,
      'containsMedia': instance.containsMedia,
      'mediaId': instance.mediaId,
      'postDate': instance.postDate.toIso8601String(),
      'userName': instance.userName,
    };
