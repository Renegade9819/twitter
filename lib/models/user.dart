import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter/models/tweet.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  User._();

  factory User({
    required String userName,
    required String password,
    required String name,
    String? avatarURL,
    required DateTime dob,
    required DateTime joinDate,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
