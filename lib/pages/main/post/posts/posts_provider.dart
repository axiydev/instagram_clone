import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:provider/provider.dart';

class PostsProvider with ChangeNotifier, ReassembleHandler {
  late int? _commentLength = 0;
  void getCommentLength({required String? postId}) async {
    try {
      _commentLength = await FireSrc.getCommentLength(postId: postId);
      // notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  void addLike({required PostModel? post}) async {
    await FireSrc.addLike(myPost: post);
    notifyListeners();
  }

  void removeLike({required PostModel? post}) async {
    await FireSrc.removeLike(myPost: post);
    notifyListeners();
  }

  int? get getFullCommentLength => _commentLength;

  @override
  void reassemble() {
    log('HOT RELOADED');
  }
}
