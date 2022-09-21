import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/pages/main/post/posts/posts_provider.dart';
import 'package:instagram_clone/pages/main/post/posts/widget/post_item.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatefulWidget {
  static Widget get show => ChangeNotifierProvider<PostsProvider>(
        create: (_) => PostsProvider(),
        child: const PostsPage(),
      );
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
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
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: .0,
            actions: [
              Consumer<PostsProvider>(
                builder: (context, postValue, _) => IconButton(
                  onPressed: () {},
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
        body: FirestoreListView(
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
            return PostItem(post: post);
          },
        ));
  }
}