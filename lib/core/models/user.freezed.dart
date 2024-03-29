// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String userName,
      required String? password,
      required String name,
      String? avatarURL = null,
      int? avatarId = null,
      int? bgId = null,
      required DateTime dob,
      required DateTime joinDate}) {
    return _User(
      userName: userName,
      password: password,
      name: name,
      avatarURL: avatarURL,
      avatarId: avatarId,
      bgId: bgId,
      dob: dob,
      joinDate: joinDate,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get userName => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatarURL => throw _privateConstructorUsedError;
  int? get avatarId => throw _privateConstructorUsedError;
  int? get bgId => throw _privateConstructorUsedError;
  DateTime get dob => throw _privateConstructorUsedError;
  DateTime get joinDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String userName,
      String? password,
      String name,
      String? avatarURL,
      int? avatarId,
      int? bgId,
      DateTime dob,
      DateTime joinDate});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? name = freezed,
    Object? avatarURL = freezed,
    Object? avatarId = freezed,
    Object? bgId = freezed,
    Object? dob = freezed,
    Object? joinDate = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarURL: avatarURL == freezed
          ? _value.avatarURL
          : avatarURL // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarId: avatarId == freezed
          ? _value.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as int?,
      bgId: bgId == freezed
          ? _value.bgId
          : bgId // ignore: cast_nullable_to_non_nullable
              as int?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      joinDate: joinDate == freezed
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userName,
      String? password,
      String name,
      String? avatarURL,
      int? avatarId,
      int? bgId,
      DateTime dob,
      DateTime joinDate});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? name = freezed,
    Object? avatarURL = freezed,
    Object? avatarId = freezed,
    Object? bgId = freezed,
    Object? dob = freezed,
    Object? joinDate = freezed,
  }) {
    return _then(_User(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarURL: avatarURL == freezed
          ? _value.avatarURL
          : avatarURL // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarId: avatarId == freezed
          ? _value.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as int?,
      bgId: bgId == freezed
          ? _value.bgId
          : bgId // ignore: cast_nullable_to_non_nullable
              as int?,
      dob: dob == freezed
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      joinDate: joinDate == freezed
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {required this.userName,
      required this.password,
      required this.name,
      this.avatarURL = null,
      this.avatarId = null,
      this.bgId = null,
      required this.dob,
      required this.joinDate})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String userName;
  @override
  final String? password;
  @override
  final String name;
  @JsonKey()
  @override
  final String? avatarURL;
  @JsonKey()
  @override
  final int? avatarId;
  @JsonKey()
  @override
  final int? bgId;
  @override
  final DateTime dob;
  @override
  final DateTime joinDate;

  @override
  String toString() {
    return 'User(userName: $userName, password: $password, name: $name, avatarURL: $avatarURL, avatarId: $avatarId, bgId: $bgId, dob: $dob, joinDate: $joinDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avatarURL, avatarURL) &&
            const DeepCollectionEquality().equals(other.avatarId, avatarId) &&
            const DeepCollectionEquality().equals(other.bgId, bgId) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            const DeepCollectionEquality().equals(other.joinDate, joinDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avatarURL),
      const DeepCollectionEquality().hash(avatarId),
      const DeepCollectionEquality().hash(bgId),
      const DeepCollectionEquality().hash(dob),
      const DeepCollectionEquality().hash(joinDate));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  factory _User(
      {required String userName,
      required String? password,
      required String name,
      String? avatarURL,
      int? avatarId,
      int? bgId,
      required DateTime dob,
      required DateTime joinDate}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get userName;
  @override
  String? get password;
  @override
  String get name;
  @override
  String? get avatarURL;
  @override
  int? get avatarId;
  @override
  int? get bgId;
  @override
  DateTime get dob;
  @override
  DateTime get joinDate;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
