import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';

class ProfileProvider with ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  bool? showTabBar = false;
  void navigateToEdit(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.editProfile);
  }

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
