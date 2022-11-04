import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:instagram_clone/models/story_model.dart';
import 'package:instagram_clone/pages/main/profile/profile/widget/story_widget.dart';
import 'package:instagram_clone/pages/main/story/story/story_page.dart';
import 'package:instagram_clone/pages/main/story/story_view_provider.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:instagram_clone/utils/page_route_custom.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_utils_export.dart';

class StoryView extends StatefulWidget {
  static Widget get show => ChangeNotifierProvider<StoryViewProvider>(
        create: (_) => StoryViewProvider(),
        child: const StoryView(),
      );
  const StoryView({super.key});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StoryViewProvider>(builder: (context, storyValue, _) {
      return SizedBox(
          height: 100.h,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              StoryWidget(
                  title: 'Create Story',
                  isAddWidget: true,
                  onPressed: () {
                    storyValue.navigateToStory(context);
                  },
                  imageUrl: AppConstants.defaultImageUrl),
              FirestoreListView(
                  primary: false,
                  query: FireSrc.firebaseFirestore
                      .collection('stories')
                      .orderBy('datePublished', descending: true),
                  padding: EdgeInsets.only(
                    top: 9.h,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, snapshot) {
                    if (!snapshot.exists) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }

                    var jsonData = snapshot.data();

                    StoryModel? story = StoryModel.fromJson(jsonData);
                    if (story.watchList!
                        .contains(AuthSrc.firebaseAuth.currentUser!.uid)) {
                      return const SizedBox.shrink();
                    }
                    if (story.userId == AuthSrc.firebaseAuth.currentUser!.uid) {
                      return const SizedBox.shrink();
                    }
                    return StoryWidget(
                      imageUrl: story.storyImage!,
                      onPressed: () {
                        Navigator.of(context).push(AppPageRouter(
                            child: StoryPage.show(storyId: story.storyId)));
                      },
                      title: story.username!,
                      isAddWidget: false,
                    );
                  }),
            ]),
          ));
    });
  }
}
