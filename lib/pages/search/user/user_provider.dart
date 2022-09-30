import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserViewProvider with ChangeNotifier {
  bool? showTabBar = false;
  final ScrollController scrollController = ScrollController();
  int? _postCount = 0;
  void setPostCount(int? post) {
    _postCount = post;
    notifyListeners();
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
}
