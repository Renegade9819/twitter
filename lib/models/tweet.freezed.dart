// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tweet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tweet _$TweetFromJson(Map<String, dynamic> json) {
  return _Tweet.fromJson(json);
}

/// @nodoc
class _$TweetTearOff {
  const _$TweetTearOff();

  _Tweet call(
      {int? tweetId,
      required String tweetBody,
      int likes = 0,
      bool? isLiked = false,
      bool containsMedia = false,
      int? mediaId,
      String? mediaURL,
      required DateTime postDate,
      required String userName}) {
    return _Tweet(
      tweetId: tweetId,
      tweetBody: tweetBody,
      likes: likes,
      isLiked: isLiked,
      containsMedia: containsMedia,
      mediaId: mediaId,
      mediaURL: mediaURL,
      postDate: postDate,
      userName: userName,
    );
  }

  Tweet fromJson(Map<String, Object?> json) {
    return Tweet.fromJson(json);
  }
}

/// @nodoc
const $Tweet = _$TweetTearOff();

/// @nodoc
mixin _$Tweet {
  int? get tweetId => throw _privateConstructorUsedError;
  String get tweetBody => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  bool? get isLiked => throw _privateConstructorUsedError;
  bool get containsMedia => throw _privateConstructorUsedError;
  int? get mediaId => throw _privateConstructorUsedError;
  String? get mediaURL => throw _privateConstructorUsedError;
  DateTime get postDate => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetCopyWith<Tweet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetCopyWith<$Res> {
  factory $TweetCopyWith(Tweet value, $Res Function(Tweet) then) =
      _$TweetCopyWithImpl<$Res>;
  $Res call(
      {int? tweetId,
      String tweetBody,
      int likes,
      bool? isLiked,
      bool containsMedia,
      int? mediaId,
      String? mediaURL,
      DateTime postDate,
      String userName});
}

/// @nodoc
class _$TweetCopyWithImpl<$Res> implements $TweetCopyWith<$Res> {
  _$TweetCopyWithImpl(this._value, this._then);

  final Tweet _value;
  // ignore: unused_field
  final $Res Function(Tweet) _then;

  @override
  $Res call({
    Object? tweetId = freezed,
    Object? tweetBody = freezed,
    Object? likes = freezed,
    Object? isLiked = freezed,
    Object? containsMedia = freezed,
    Object? mediaId = freezed,
    Object? mediaURL = freezed,
    Object? postDate = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      tweetId: tweetId == freezed
          ? _value.tweetId
          : tweetId // ignore: cast_nullable_to_non_nullable
              as int?,
      tweetBody: tweetBody == freezed
          ? _value.tweetBody
          : tweetBody // ignore: cast_nullable_to_non_nullable
              as String,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      containsMedia: containsMedia == freezed
          ? _value.containsMedia
          : containsMedia // ignore: cast_nullable_to_non_nullable
              as bool,
      mediaId: mediaId == freezed
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaURL: mediaURL == freezed
          ? _value.mediaURL
          : mediaURL // ignore: cast_nullable_to_non_nullable
              as String?,
      postDate: postDate == freezed
          ? _value.postDate
          : postDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TweetCopyWith<$Res> implements $TweetCopyWith<$Res> {
  factory _$TweetCopyWith(_Tweet value, $Res Function(_Tweet) then) =
      __$TweetCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? tweetId,
      String tweetBody,
      int likes,
      bool? isLiked,
      bool containsMedia,
      int? mediaId,
      String? mediaURL,
      DateTime postDate,
      String userName});
}

/// @nodoc
class __$TweetCopyWithImpl<$Res> extends _$TweetCopyWithImpl<$Res>
    implements _$TweetCopyWith<$Res> {
  __$TweetCopyWithImpl(_Tweet _value, $Res Function(_Tweet) _then)
      : super(_value, (v) => _then(v as _Tweet));

  @override
  _Tweet get _value => super._value as _Tweet;

  @override
  $Res call({
    Object? tweetId = freezed,
    Object? tweetBody = freezed,
    Object? likes = freezed,
    Object? isLiked = freezed,
    Object? containsMedia = freezed,
    Object? mediaId = freezed,
    Object? mediaURL = freezed,
    Object? postDate = freezed,
    Object? userName = freezed,
  }) {
    return _then(_Tweet(
      tweetId: tweetId == freezed
          ? _value.tweetId
          : tweetId // ignore: cast_nullable_to_non_nullable
              as int?,
      tweetBody: tweetBody == freezed
          ? _value.tweetBody
          : tweetBody // ignore: cast_nullable_to_non_nullable
              as String,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      containsMedia: containsMedia == freezed
          ? _value.containsMedia
          : containsMedia // ignore: cast_nullable_to_non_nullable
              as bool,
      mediaId: mediaId == freezed
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaURL: mediaURL == freezed
          ? _value.mediaURL
          : mediaURL // ignore: cast_nullable_to_non_nullable
              as String?,
      postDate: postDate == freezed
          ? _value.postDate
          : postDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tweet extends _Tweet {
  _$_Tweet(
      {this.tweetId,
      required this.tweetBody,
      this.likes = 0,
      this.isLiked = false,
      this.containsMedia = false,
      this.mediaId,
      this.mediaURL,
      required this.postDate,
      required this.userName})
      : super._();

  factory _$_Tweet.fromJson(Map<String, dynamic> json) =>
      _$$_TweetFromJson(json);

  @override
  final int? tweetId;
  @override
  final String tweetBody;
  @JsonKey()
  @override
  final int likes;
  @JsonKey()
  @override
  final bool? isLiked;
  @JsonKey()
  @override
  final bool containsMedia;
  @override
  final int? mediaId;
  @override
  final String? mediaURL;
  @override
  final DateTime postDate;
  @override
  final String userName;

  @override
  String toString() {
    return 'Tweet(tweetId: $tweetId, tweetBody: $tweetBody, likes: $likes, isLiked: $isLiked, containsMedia: $containsMedia, mediaId: $mediaId, mediaURL: $mediaURL, postDate: $postDate, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tweet &&
            const DeepCollectionEquality().equals(other.tweetId, tweetId) &&
            const DeepCollectionEquality().equals(other.tweetBody, tweetBody) &&
            const DeepCollectionEquality().equals(other.likes, likes) &&
            const DeepCollectionEquality().equals(other.isLiked, isLiked) &&
            const DeepCollectionEquality()
                .equals(other.containsMedia, containsMedia) &&
            const DeepCollectionEquality().equals(other.mediaId, mediaId) &&
            const DeepCollectionEquality().equals(other.mediaURL, mediaURL) &&
            const DeepCollectionEquality().equals(other.postDate, postDate) &&
            const DeepCollectionEquality().equals(other.userName, userName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tweetId),
      const DeepCollectionEquality().hash(tweetBody),
      const DeepCollectionEquality().hash(likes),
      const DeepCollectionEquality().hash(isLiked),
      const DeepCollectionEquality().hash(containsMedia),
      const DeepCollectionEquality().hash(mediaId),
      const DeepCollectionEquality().hash(mediaURL),
      const DeepCollectionEquality().hash(postDate),
      const DeepCollectionEquality().hash(userName));

  @JsonKey(ignore: true)
  @override
  _$TweetCopyWith<_Tweet> get copyWith =>
      __$TweetCopyWithImpl<_Tweet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TweetToJson(this);
  }
}

abstract class _Tweet extends Tweet {
  factory _Tweet(
      {int? tweetId,
      required String tweetBody,
      int likes,
      bool? isLiked,
      bool containsMedia,
      int? mediaId,
      String? mediaURL,
      required DateTime postDate,
      required String userName}) = _$_Tweet;
  _Tweet._() : super._();

  factory _Tweet.fromJson(Map<String, dynamic> json) = _$_Tweet.fromJson;

  @override
  int? get tweetId;
  @override
  String get tweetBody;
  @override
  int get likes;
  @override
  bool? get isLiked;
  @override
  bool get containsMedia;
  @override
  int? get mediaId;
  @override
  String? get mediaURL;
  @override
  DateTime get postDate;
  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$TweetCopyWith<_Tweet> get copyWith => throw _privateConstructorUsedError;
}
