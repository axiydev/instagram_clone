import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel {
  factory CommentModel({
    String? profilePic,
    String? datePublished,
    String? uid,
    String? text,
    String? commentId,
    String? fcmToken,
    String? username,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  factory CommentModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>?>? dataSnapshot) {
    final data = dataSnapshot!.data();

    return CommentModel(
      profilePic: data!['profilePic'],
      username: data['username'],
      datePublished: data['datePublished'],
      commentId: data['commentId'],
      uid: data['uid'],
      text: data['text'],
    );
  }
}
