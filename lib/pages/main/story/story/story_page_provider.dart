import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:story_view/story_view.dart';

class StoryPageProvider with ChangeNotifier {
  final StoryController storyControllerView = StoryController();
  final PageController? pageController = PageController();
  final List<StoryItem?> _listPages = [];
  void initData() async {
    try {} catch (e) {
      log(e.toString());
    }
  }

  void addWatcherToList(
      {required String? storyId, required String? currentUserId}) async {
    try {
      await FireSrc.addWatcher(currentUserId: currentUserId, storyId: storyId);
      log('Story Korildi');
    } catch (e) {
      log(e.toString());
    }
  }
}
