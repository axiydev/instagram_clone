// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
mixin _$CommentModel {
  String? get profilePic => throw _privateConstructorUsedError;
  String? get datePublished => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get commentId => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res>;
  $Res call(
      {String? profilePic,
      String? datePublished,
      String? uid,
      String? text,
      String? commentId,
      String? fcmToken,
      String? username});
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res> implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  final CommentModel _value;
  // ignore: unused_field
  final $Res Function(CommentModel) _then;

  @override
  $Res call({
    Object? profilePic = freezed,
    Object? datePublished = freezed,
    Object? uid = freezed,
    Object? text = freezed,
    Object? commentId = freezed,
    Object? fcmToken = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      profilePic: profilePic == freezed
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      datePublished: datePublished == freezed
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CommentModelCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$$_CommentModelCopyWith(
          _$_CommentModel value, $Res Function(_$_CommentModel) then) =
      __$$_CommentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? profilePic,
      String? datePublished,
      String? uid,
      String? text,
      String? commentId,
      String? fcmToken,
      String? username});
}

/// @nodoc
class __$$_CommentModelCopyWithImpl<$Res>
    extends _$CommentModelCopyWithImpl<$Res>
    implements _$$_CommentModelCopyWith<$Res> {
  __$$_CommentModelCopyWithImpl(
      _$_CommentModel _value, $Res Function(_$_CommentModel) _then)
      : super(_value, (v) => _then(v as _$_CommentModel));

  @override
  _$_CommentModel get _value => super._value as _$_CommentModel;

  @override
  $Res call({
    Object? profilePic = freezed,
    Object? datePublished = freezed,
    Object? uid = freezed,
    Object? text = freezed,
    Object? commentId = freezed,
    Object? fcmToken = freezed,
    Object? username = freezed,
  }) {
    return _then(_$_CommentModel(
      profilePic: profilePic == freezed
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      datePublished: datePublished == freezed
          ? _value.datePublished
          : datePublished // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: fcmToken == freezed
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentModel implements _CommentModel {
  _$_CommentModel(
      {this.profilePic,
      this.datePublished,
      this.uid,
      this.text,
      this.commentId,
      this.fcmToken,
      this.username});

  factory _$_CommentModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommentModelFromJson(json);

  @override
  final String? profilePic;
  @override
  final String? datePublished;
  @override
  final String? uid;
  @override
  final String? text;
  @override
  final String? commentId;
  @override
  final String? fcmToken;
  @override
  final String? username;

  @override
  String toString() {
    return 'CommentModel(profilePic: $profilePic, datePublished: $datePublished, uid: $uid, text: $text, commentId: $commentId, fcmToken: $fcmToken, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentModel &&
            const DeepCollectionEquality()
                .equals(other.profilePic, profilePic) &&
            const DeepCollectionEquality()
                .equals(other.datePublished, datePublished) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.commentId, commentId) &&
            const DeepCollectionEquality().equals(other.fcmToken, fcmToken) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(profilePic),
      const DeepCollectionEquality().hash(datePublished),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(commentId),
      const DeepCollectionEquality().hash(fcmToken),
      const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$$_CommentModelCopyWith<_$_CommentModel> get copyWith =>
      __$$_CommentModelCopyWithImpl<_$_CommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentModelToJson(
      this,
    );
  }
}

abstract class _CommentModel implements CommentModel {
  factory _CommentModel(
      {final String? profilePic,
      final String? datePublished,
      final String? uid,
      final String? text,
      final String? commentId,
      final String? fcmToken,
      final String? username}) = _$_CommentModel;

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$_CommentModel.fromJson;

  @override
  String? get profilePic;
  @override
  String? get datePublished;
  @override
  String? get uid;
  @override
  String? get text;
  @override
  String? get commentId;
  @override
  String? get fcmToken;
  @override
  String? get username;
  @override
  @JsonKey(ignore: true)
  _$$_CommentModelCopyWith<_$_CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
