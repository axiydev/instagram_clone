import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:instagram_clone/data/app_data.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/pages/main/main_provider.dart';
import 'package:instagram_clone/pages/main/post/posts/posts_provider.dart';
import 'package:instagram_clone/pages/main/post/posts/widget/post_item.dart';
import 'package:instagram_clone/pages/main/story/story_view.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatefulWidget {
  static Widget get show => ChangeNotifierProvider<PostsProvider>(
        create: (_) => PostsProvider(),
        lazy: false,
        child: const PostsPage(),
      );
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void didChangeDependencies() {
    log('INITTT');

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    log('BUILDD');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: Text(
            'Instagram',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 30.sp),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: .0,
          actions: [
            Consumer2<PostsProvider, MainProvider>(
              builder: (context, postValue, mainValueProvider, _) => IconButton(
                onPressed: () {
                  mainValueProvider.changeIndex(2);
                },
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor,
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
          ],
        ),
      ),
      body: Consumer<PostsProvider>(
        builder: (context, valuePosts, child) => RefreshIndicator(
          backgroundColor: Theme.of(context).backgroundColor,
          onRefresh: () {
            setState(() {});
            return Future.delayed(const Duration(milliseconds: 400));
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                StoryView.show,
                FirestoreListView(
                  primary: false,
                  shrinkWrap: true,
                  query: FirebaseFirestore.instance
                      .collection('posts')
                      .orderBy('datePublished', descending: true),
                  itemBuilder: (context, doc) {
                    if (doc.data().isEmpty) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    if (!doc.exists) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    PostModel? post = PostModel.fromDocumentSnapshot(doc);

                    return PostItem.show(
                      post: post,
                      currentUserUsername: usernameApp,
                      currentUser: AuthSrc.firebaseAuth.currentUser!.uid,
                      fullCommentLength: post.comments!,
                      addLike: () => valuePosts.addLike(post: post),
                      removeLike: () => valuePosts.removeLike(post: post),
                      liked: FireSrc.isLiked(myPost: post),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
