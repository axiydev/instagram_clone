import 'dart:developer';

import 'package:flutter/material.dart';

class StoryPageProvider with ChangeNotifier {
  final PageController? pageController = PageController();
  final List<Widget?> _listPages = [];
  void initData() async {
    try {} catch (e) {
      log(e.toString());
    }
  }
}
