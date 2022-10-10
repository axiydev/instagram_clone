import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:instagram_clone/models/story_model.dart';
import 'package:instagram_clone/pages/main/story/story/detail/view_story_item.dart';
import 'package:instagram_clone/pages/main/story/story/story_page_provider.dart';
import 'package:instagram_clone/pages/main/story/story_view_provider.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart' as sw;

class StoryPage extends StatefulWidget {
  final String? storyId;
  static Widget show({String? storyId}) => MultiProvider(
        providers: [
          ChangeNotifierProvider<StoryViewProvider>(
              lazy: false, create: (_) => StoryViewProvider()),
          ChangeNotifierProvider<StoryPageProvider>(
              create: (_) => StoryPageProvider()),
        ],
        child: StoryPage(
          storyId: storyId!,
        ),
      );
  const StoryPage({super.key, required this.storyId});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Consumer2<StoryViewProvider, StoryPageProvider>(
          builder: (context, storyViewValue, storyPageProvider, _) {
            return FirestoreQueryBuilder(
                query: FireSrc.firebaseFirestore
                    .collection('stories')
                    .where('storyId', isGreaterThanOrEqualTo: widget.storyId)
                    .orderBy('storyId', descending: false),
                pageSize: 20,
                builder: (context, snapshot, _) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  List<Map<String, dynamic>>? filterList = [];
                  filterList.addAll(snapshot.docs.map((e) => e.data()));

                  filterList = filterList
                      .where((element) =>
                          !((element['watchList'] as List).contains(
                              AuthSrc.firebaseAuth.currentUser!.uid)) &&
                          element['userId'] !=
                              AuthSrc.firebaseAuth.currentUser!.uid)
                      .toList();

                  return PageView.builder(
                      controller: storyPageProvider.pageController,
                      itemCount: filterList.length,
                      onPageChanged: (value) {},
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (snapshot.hasMore &&
                            index + 1 == filterList!.length) {
                          snapshot.fetchMore();
                        }
                        if (snapshot.hasError) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                        final StoryModel story =
                            StoryModel.fromJson(filterList![index]);

                        return sw.StoryView(
                          storyItems: [
                            sw.StoryItem(
                                ViewStoryItem.show(story: story, index: index),
                                duration: const Duration(seconds: 5))
                          ],
                          controller: storyPageProvider.storyControllerView,
                          onComplete: () async {
                            if (index + 1 != snapshot.docs.length) {
                              storyPageProvider.pageController!.animateToPage(
                                  index + 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                            }
                            storyPageProvider.addWatcherToList(
                                storyId: widget.storyId,
                                currentUserId:
                                    AuthSrc.firebaseAuth.currentUser!.uid);
                          },
                          onStoryShow: (value) {},
                          onVerticalSwipeComplete: (value) {},
                        );
                      });
                });
          },
        );
      }),
    );
  }
}
