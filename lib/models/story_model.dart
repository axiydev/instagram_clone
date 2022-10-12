import 'package:freezed_annotation/freezed_annotation.dart';
part 'story_model.freezed.dart';
part 'story_model.g.dart';

@freezed
class StoryModel with _$StoryModel {
  factory StoryModel({
    String? storyImage,
    String? datePublished,
    String? userId,
    String? description,
    String? profileAvatar,
    List? likes,
    String? fcmToken,
    List? watchList,
    String? username,
    String? storyId,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  // factory StoryModel.fromDocumentSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>?>? dataSnapshot) {
  //   final data = dataSnapshot!.data();

  //   return StoryModel(
  //     profilePic: data!['profilePic'],
  //     username: data['username'],
  //     datePublished: data['datePublished'],
  //     commentId: data['commentId'],
  //     uid: data['uid'],
  //     text: data['text'],
  //   );
  // }
}
