import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/models/story_model.dart';
import 'package:instagram_clone/pages/main/story/story/detail/view_item_provider.dart';
import 'package:instagram_clone/pages/main/story/story/story_page_provider.dart';
import 'package:instagram_clone/utils/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';

// ignore: must_be_immutable
class ViewStoryItem extends StatefulWidget {
  final StoryModel? story;
  final int? index;
  static Widget show({StoryModel? story, int? index}) => MultiProvider(
        providers: [
          ChangeNotifierProvider<ViewStoryItemProvider>(
              create: (_) => ViewStoryItemProvider()),
          ChangeNotifierProvider<StoryPageProvider>(
              create: (_) => StoryPageProvider()),
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
    context.read<ViewStoryItemProvider>().initData(widget.story);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<ViewStoryItemProvider, StoryPageProvider>(
          builder: (context, storyItemValue, storyPage, child) => SafeArea(
                  child: Stack(
                fit: StackFit.expand,
                children: [
                  StoryImage.url(
                    widget.story!.storyImage!,
                    controller: storyPage.storyControllerView,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: .0,
                    right: .0,
                    top: 15.h,
                    child: ListTile(
                      title: Text(
                        widget.story!.username ?? "user",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      subtitle: Text(widget.story!.description ?? "description",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 12.sp)),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          widget.story!.profileAvatar ??
                              AppConstants.defaultImageUrl,
                        ),
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
