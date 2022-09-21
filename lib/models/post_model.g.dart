// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      description: json['description'] as String?,
      username: json['username'] as String?,
      userAvatar: json['userAvatar'] as String?,
      datePublished: json['datePublished'] as String?,
      likes: json['likes'] as List<dynamic>?,
      comments: json['comments'] as List<dynamic>?,
      imageUrl: json['imageUrl'] as String?,
      postId: json['postId'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'username': instance.username,
      'userAvatar': instance.userAvatar,
      'datePublished': instance.datePublished,
      'likes': instance.likes,
      'comments': instance.comments,
      'imageUrl': instance.imageUrl,
      'postId': instance.postId,
      'userId': instance.userId,
    };
