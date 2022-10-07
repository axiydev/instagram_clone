import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/models/story_model.dart';
import 'package:instagram_clone/pages/main/story/story/detail/view_item_provider.dart';
import 'package:instagram_clone/pages/main/story/story/story_page_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ViewStoryItem extends StatefulWidget {
  final StoryModel? story;
  final int? index;
  static Widget show({StoryModel? story, int? index}) => MultiProvider(
        providers: [
          ChangeNotifierProvider<ViewStoryItemProvider>(
              create: (_) => ViewStoryItemProvider()),
          ChangeNotifierProvider<StoryPageProvider>(
              create: (_) => StoryPageProvider())
        ],
        child: ViewStoryItem(
          story: story,
          index: index,
        ),
      );
  const ViewStoryItem({super.key, required this.story, required this.index});

  @override
  State<ViewStoryItem> createState() => _ViewStoryItemState();
}

class _ViewStoryItemState extends State<ViewStoryItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<ViewStoryItemProvider, StoryPageProvider>(
          builder: (context, storyItem, storyPage, child) => SafeArea(
                  child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.story!.storyImage!,
                    fit: BoxFit.cover,
                    height: 812.h,
                    width: 312.w,
                  )
                ],
              ))),
    );
  }
}
