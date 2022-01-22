// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      userName: json['userName'] as String,
      password: json['password'] as String?,
      name: json['name'] as String,
      avatarURL: json['avatarURL'] as String? ?? null,
      avatarId: json['avatarId'] as int? ?? null,
      bgId: json['bgId'] as int? ?? null,
      dob: DateTime.parse(json['dob'] as String),
      joinDate: DateTime.parse(json['joinDate'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'name': instance.name,
      'avatarURL': instance.avatarURL,
      'avatarId': instance.avatarId,
      'bgId': instance.bgId,
      'dob': instance.dob.toIso8601String(),
      'joinDate': instance.joinDate.toIso8601String(),
    };
