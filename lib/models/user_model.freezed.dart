// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "uid")
  String? get uid => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "bio")
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: "followers")
  List<dynamic>? get followers => throw _privateConstructorUsedError;
  @JsonKey(name: "following")
  List<dynamic>? get following => throw _privateConstructorUsedError;
  @JsonKey(name: 'photoAvatarUrl')
  String? get photoAvatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'fcmToken')
  String? get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "uid") String? uid,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "bio") String? bio,
      @JsonKey(name: "followers") List<dynamic>? followers,
      @JsonKey(name: "following") List<dynamic>? following,
      @JsonKey(name: 'photoAvatarUrl') String? photoAvatarUrl,
      @JsonKey(name: 'fcmToken') String? fcmToken});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? uid = freezed,
    Object? email = freezed,
    Object? bio = freezed,
    Object? followers = freezed,
    Object? following = freezed,
    Object? photoAvatarUrl = freezed,
    Object? fcmToken = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      photoAvatarUrl: photoAvatarUrl == freezed
          ? _value.photoAvatarUrl
          : photoAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "uid") String? uid,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "bio") String? bio,
      @JsonKey(name: "followers") List<dynamic>? followers,
      @JsonKey(name: "following") List<dynamic>? following,
      @JsonKey(name: 'photoAvatarUrl') String? photoAvatarUrl,
      @JsonKey(name: 'fcmToken') String? fcmToken});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, (v) => _then(v as _$_UserModel));

  @override
  _$_UserModel get _value => super._value as _$_UserModel;

  @override
  $Res call({
    Object? username = freezed,
    Object? uid = freezed,
    Object? email = freezed,
    Object? bio = freezed,
    Object? followers = freezed,
    Object? following = freezed,
    Object? photoAvatarUrl = freezed,
    Object? fcmToken = freezed,
  }) {
    return _then(_$_UserModel(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      followers: followers == freezed
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      following: following == freezed
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      photoAvatarUrl: photoAvatarUrl == freezed
          ? _value.photoAvatarUrl
          : photoAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {@JsonKey(name: "username") this.username,
      @JsonKey(name: "uid") this.uid,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "bio") this.bio,
      @JsonKey(name: "followers") final List<dynamic>? followers,
      @JsonKey(name: "following") final List<dynamic>? following,
      @JsonKey(name: 'photoAvatarUrl') this.photoAvatarUrl,
      @JsonKey(name: 'fcmToken') this.fcmToken})
      : _followers = followers,
        _following = following;

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "uid")
  final String? uid;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "bio")
  final String? bio;
  final List<dynamic>? _followers;
  @override
  @JsonKey(name: "followers")
  List<dynamic>? get followers {
    final value = _followers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _following;
  @override
  @JsonKey(name: "following")
  List<dynamic>? get following {
    final value = _following;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'photoAvatarUrl')
  final String? photoAvatarUrl;
  @override
  @JsonKey(name: 'fcmToken')
  final String? fcmToken;

  @override
  String toString() {
    return 'UserModel(username: $username, uid: $uid, email: $email, bio: $bio, followers: $followers, following: $following, photoAvatarUrl: $photoAvatarUrl, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.bio, bio) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            const DeepCollectionEquality()
                .equals(other._following, _following) &&
            const DeepCollectionEquality()
                .equals(other.photoAvatarUrl, photoAvatarUrl) &&
            const DeepCollectionEquality().equals(other.fcmToken, fcmToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(bio),
      const DeepCollectionEquality().hash(_followers),
      const DeepCollectionEquality().hash(_following),
      const DeepCollectionEquality().hash(photoAvatarUrl),
      const DeepCollectionEquality().hash(fcmToken));

  @JsonKey(ignore: true)
  @override
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: "username") final String? username,
      @JsonKey(name: "uid") final String? uid,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "bio") final String? bio,
      @JsonKey(name: "followers") final List<dynamic>? followers,
      @JsonKey(name: "following") final List<dynamic>? following,
      @JsonKey(name: 'photoAvatarUrl') final String? photoAvatarUrl,
      @JsonKey(name: 'fcmToken') final String? fcmToken}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "uid")
  String? get uid;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "bio")
  String? get bio;
  @override
  @JsonKey(name: "followers")
  List<dynamic>? get followers;
  @override
  @JsonKey(name: "following")
  List<dynamic>? get following;
  @override
  @JsonKey(name: 'photoAvatarUrl')
  String? get photoAvatarUrl;
  @override
  @JsonKey(name: 'fcmToken')
  String? get fcmToken;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
