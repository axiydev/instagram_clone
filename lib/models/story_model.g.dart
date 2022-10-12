// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryModel _$$_StoryModelFromJson(Map<String, dynamic> json) =>
    _$_StoryModel(
      storyImage: json['storyImage'] as String?,
      datePublished: json['datePublished'] as String?,
      userId: json['userId'] as String?,
      description: json['description'] as String?,
      profileAvatar: json['profileAvatar'] as String?,
      likes: json['likes'] as List<dynamic>?,
      fcmToken: json['fcmToken'] as String?,
      watchList: json['watchList'] as List<dynamic>?,
      username: json['username'] as String?,
      storyId: json['storyId'] as String?,
    );

Map<String, dynamic> _$$_StoryModelToJson(_$_StoryModel instance) =>
    <String, dynamic>{
      'storyImage': instance.storyImage,
      'datePublished': instance.datePublished,
      'userId': instance.userId,
      'description': instance.description,
      'profileAvatar': instance.profileAvatar,
      'likes': instance.likes,
      'fcmToken': instance.fcmToken,
      'watchList': instance.watchList,
      'username': instance.username,
      'storyId': instance.storyId,
    };
