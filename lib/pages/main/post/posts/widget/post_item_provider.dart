import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';

class PostItemProvider with ChangeNotifier {
  bool? _isFollowed = false;

  void checkFollowing(
      {required String? following, required String? followed}) async {
    try {
      _isFollowed = await FireSrc.checkFollowing(
          followingUserId: following, followedUserId: followed);
      log('is Followed  $_isFollowed');
      notifyListeners();
    } catch (e, s) {
      log(s.toString());
      log(e.toString());
    }
  }

  void deletePost({required PostModel? post}) async {
    try {
      var isDeleted = await FireSrc.deletePost(post: post);
      if (isDeleted!) {
        log('Post ochirildi');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void follow(
      {required String? followingUserId,
      required String? fcm,
      required String? userName}) async {
    try {
      bool? followed = await FireSrc.followUser(
          followingUserId: followingUserId,
          userName: userName,
          followedUserId: AuthSrc.firebaseAuth.currentUser!.uid,
          followingFcm: fcm);
      if (followed!) {
        log('Follow boldi');
        notifyListeners();
      } else {
        log('Follow bolgan');
        notifyListeners();
      }
    } catch (e, s) {
      log(s.toString());
      log(e.toString());
    }
  }

  void onPostTilePressed(BuildContext context,
      {required String? uid, required String fcm}) {
    Navigator.of(context)
        .pushNamed(AppRoutes.userPageView, arguments: {'uid': uid, 'fcm': fcm});
  }

  bool? get isFollowed => _isFollowed;
}
