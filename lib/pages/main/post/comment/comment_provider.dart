import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instagram_clone/models/comment_model.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';

class CommentProvider with ChangeNotifier {
  final TextEditingController? editingController = TextEditingController();
  void addPost(
      {required String? postId, required CommentModel? myComment}) async {
    try {
      if (editingController!.text.isEmpty) return;
      CommentModel newCommentMod =
          myComment!.copyWith(text: editingController!.text);
      final isPublished =
          await FireSrc.postComment(postId: postId, comment: newCommentMod);
      if (isPublished!) {
        editingController!.clear();
        log('published');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void navigateToUserView(BuildContext context, {required String? uid}) {
    Navigator.of(context)
        .pushNamed(AppRoutes.userPageView, arguments: {'uid': uid});
  }
}
