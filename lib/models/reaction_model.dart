import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'reaction_model.freezed.dart';
part 'reaction_model.g.dart';

@freezed
class ReactionModel with _$ReactionModel {
  const factory ReactionModel({
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'myUsername') String? myUsername,
    @JsonKey(name: 'postId') String? postId,
    @JsonKey(name: 'reactionId') String? reactionId,
    @JsonKey(name: 'myUid') String? myUid,
    @JsonKey(name: 'userId') String? userId,
    @JsonKey(name: 'fcmToken') String? fcmToken,
    @JsonKey(name: 'myAvatarUrl') String? myAvatarUrl,
    @JsonKey(name: 'reactionPubplishDate') String? reactionPubplishDate,
    @JsonKey(name: 'reactionText') String? reactionText,
    @JsonKey(name: 'isFollowed') @Default(false) bool? isFollowed,
    @JsonKey(name: 'storyUrl') String? storyUrl,
    @JsonKey(name: 'storyId') String? storyId,
  }) = _ReactionModel;

  factory ReactionModel.fromJson(Map<String, Object?> json) =>
      _$ReactionModelFromJson(json);

  factory ReactionModel.empty() {
    return ReactionModel.fromJson({});
  }
  factory ReactionModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return ReactionModel(
      imageUrl: data!['imageUrl'],
      postId: data['postId'],
      myUid: data['myUid'],
      myUsername: data['myUsername'],
      userId: data['userId'],
      reactionId: data['reactionId'],
      myAvatarUrl: data['myAvatarUrl'],
      reactionPubplishDate: data['reactionPubplishDate'],
      reactionText: data['reactionText'],
      isFollowed: data['isFollowed'],
      storyUrl: data['storyUrl'],
      fcmToken: data['fcmToken'],
      storyId: data['storyId'],
    );
  }
}
