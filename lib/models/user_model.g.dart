// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      username: json['username'] as String?,
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      bio: json['bio'] as String?,
      followers: json['followers'] as List<dynamic>?,
      following: json['following'] as List<dynamic>?,
      photoAvatarUrl: json['photoAvatarUrl'] as String?,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'uid': instance.uid,
      'email': instance.email,
      'bio': instance.bio,
      'followers': instance.followers,
      'following': instance.following,
      'photoAvatarUrl': instance.photoAvatarUrl,
      'fcmToken': instance.fcmToken,
    };
