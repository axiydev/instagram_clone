import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';

class UserViewProvider with ChangeNotifier {
  bool? showTabBar = false;
  final ScrollController scrollController = ScrollController();
  int? _postCount = 0;
  bool? _isFollowed = false;
  void setPostCount(int? post) {
    _postCount = post;
    notifyListeners();
  }

  void checkFollowing({required String? userId, required String? myUid}) async {
    try {
      _isFollowed = await FireSrc.checkFollowing(
          followingUserId: userId, followedUserId: myUid);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  void follow(
      {required String? followingUserId,
      required String? followingFcm,
      required String? userName}) async {
    try {
      bool? followed = await FireSrc.followUser(
          followingUserId: followingUserId,
          followedUserId: AuthSrc.firebaseAuth.currentUser!.uid,
          userName: userName,
          followingFcm: followingFcm);
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

  void unFollow({required String? userId}) async {
    try {
      bool? followed = await FireSrc.unfollowUser(
          followingUserId: userId,
          followedUserId: AuthSrc.firebaseAuth.currentUser!.uid);
      if (followed!) {
        log('UnFollow boldi');
        notifyListeners();
      } else {
        log('UnFollow bolgan');
        notifyListeners();
      }
    } catch (e, s) {
      log(s.toString());
      log(e.toString());
    }
  }

  get postCount => _postCount;
  void onChangeScroll() {
    scrollController.addListener(() {
      if (scrollController.position.pixels.h >= 363) {
        showTabBar = true;
        notifyListeners();
      } else if (scrollController.position.pixels.h < 363) {
        showTabBar = false;
        notifyListeners();
      }
    });
  }

  bool? get isFollowed => _isFollowed;
}
