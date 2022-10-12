import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:instagram_clone/models/comment_model.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/pages/main/post/comment/comment_provider.dart';
import 'package:instagram_clone/pages/main/post/comment/widgets/custom_card_widget.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:provider/provider.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});
  static Widget get show => ChangeNotifierProvider(
        create: (_) => CommentProvider(),
        child: const CommentPage(),
      );
  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  late PostModel? _post;
  UserModel? _userModel;
  @override
  void didChangeDependencies() {
    final Map<String, dynamic> argument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    if (argument.containsKey('post') && argument['post'] != null) {
      _post = argument['post'];
      setState(() {});
    }
    getCurrentUser();
    super.didChangeDependencies();
  }

  void getCurrentUser() async {
    _userModel = await AuthSrc.getCurrentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: .0,
        title: Text(
          'Comments',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: body,
    );
  }

  Widget get body {
    return Consumer<CommentProvider>(
        builder: (context, commentProviderValue, _) {
      if (_userModel == null) {
        return const Center(child: CupertinoActivityIndicator());
      }
      return Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CustomCardItem(
                    username: _post!.username!,
                    datetime: _post!.datePublished!,
                    imageUrl: _post!.userAvatar!,
                    onPressed: () => commentProviderValue
                        .navigateToUserView(context, uid: _post!.userId),
                    text: _post!.description!),
                FirestoreListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    physics: const NeverScrollableScrollPhysics(),
                    query: FireSrc.firebaseFirestore
                        .collection('posts')
                        .doc(_post!.postId!)
                        .collection('commentss')
                        .orderBy('datePublished', descending: true),
                    itemBuilder: (context, document) {
                      if (!document.exists) {
                        return const Center(
                            child: CupertinoActivityIndicator());
                      }

                      if (document.data().isEmpty) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                      CommentModel? comment =
                          CommentModel.fromDocumentSnapshot(document);

                      return CustomCardItem(
                        onPressed: () => commentProviderValue
                            .navigateToUserView(context, uid: comment.uid),
                        imageUrl: comment.profilePic,
                        text: comment.text,
                        datetime: comment.datePublished,
                        username: comment.username,
                      );
                    })
              ],
            ),
          ),
          Positioned(
              left: .0.w,
              right: .0.w,
              bottom: .0.w,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: .0.w,
                child: ListTile(
                  dense: false,
                  tileColor: Theme.of(context).listTileTheme.tileColor,
                  title: CupertinoTextField(
                    style: Theme.of(context).textTheme.bodyMedium!,
                    controller: commentProviderValue.editingController,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    placeholder: 'Add a comment...',
                    placeholderStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      CommentModel? myComment = CommentModel(
                        profilePic: _userModel!.photoAvatarUrl,
                        datePublished: DateTime.now().toString(),
                        uid: _userModel!.uid,
                        username: _userModel!.username,
                      );
                      commentProviderValue.addPost(
                          postId: _post!.postId,
                          myComment: myComment,
                          userName: _userModel!.username,
                          fcm: _post!.fcmToken!);
                      FocusScope.of(context).unfocus();
                    },
                    child: const Text('Post'),
                  ),
                  leading: Container(
                      padding: EdgeInsets.all(3.w),
                      height: 50.w,
                      width: 50.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: _userModel!.photoAvatarUrl ??
                              "https://cmosmagazine.com/wp-content/uploads/2021/10/Instagram.jpg",
                          placeholder: (context, url) =>
                              const SizedBox.shrink(),
                          errorWidget: (context, url, error) =>
                              const SizedBox.shrink(),
                        ),
                      )),
                ),
              ))
        ],
      );
    });
  }
}
