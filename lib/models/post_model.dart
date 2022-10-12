import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    String? description,
    String? username,
    String? userAvatar,
    String? datePublished,
    List? likes,
    int? comments,
    String? imageUrl,
    String? postId,
    String? fcmToken,
    String? userId,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, Object?> json) =>
      _$PostModelFromJson(json);

  factory PostModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>?>? dataSnapshot) {
    final data = dataSnapshot!.data();

    return PostModel(
        description: data!['description'],
        username: data['username'],
        userAvatar: data['userAvatar'],
        datePublished: data['datePublished'],
        likes: data['likes'],
        comments: data['comments'],
        imageUrl: data['imageUrl'],
        postId: data['postId'],
        fcmToken: data['fcmToken'],
        userId: data['userId']);
  }
}
