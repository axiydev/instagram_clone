import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:instagram_clone/models/story_model.dart';
import 'package:instagram_clone/pages/main/story/story/detail/view_story_item.dart';
import 'package:instagram_clone/pages/main/story/story/story_page_provider.dart';
import 'package:instagram_clone/pages/main/story/story_view_provider.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:provider/provider.dart';

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
                    .orderBy('datePublished', descending: true),
                builder: (context, snapshot, _) {
                  return PageView.builder(
                      controller: storyPageProvider.pageController,
                      itemCount: snapshot.docs.length,
                      itemBuilder: (context, index) {
                        // obtain more items
                        if (snapshot.hasMore &&
                            index + 1 == snapshot.docs.length) {
                          // Tell FirestoreQueryBuilder to try to obtain more items.
                          // It is safe to call this function from within the build method.
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
                            StoryModel.fromJson(snapshot.docs[index].data());

                        return ViewStoryItem.show(story: story, index: index);
                      });
                });
          },
        );
      }),
    );
  }
}
