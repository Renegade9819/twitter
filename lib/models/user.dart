import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter/models/tweet.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  User._();

  factory User({
    required String userName,
    required String? password,
    required String name,
    @Default(null) String? avatarURL,
    @Default(null) int? avatarId,
    @Default(null) int? bgId,
    required DateTime dob,
    required DateTime joinDate,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
