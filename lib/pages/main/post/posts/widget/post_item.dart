import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/pages/main/post/posts/widget/post_item_provider.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class PostItem extends StatefulWidget {
  final PostModel? post;
  final Function addLike;
  final int? fullCommentLength;
  final bool? liked;
  final String? currentUser;
  final Function removeLike;

  const PostItem(
      {super.key,
      required this.currentUser,
      required this.fullCommentLength,
      required this.post,
      required this.liked,
      required this.addLike,
      required this.removeLike});

  static Widget show({
    required PostModel? post,
    required Function? addLike,
    required int? fullCommentLength,
    required bool? liked,
    required Function? removeLike,
    required String? currentUser,
  }) {
    return ChangeNotifierProvider(
      create: (_) => PostItemProvider(),
      child: PostItem(
          currentUser: currentUser,
          fullCommentLength: fullCommentLength,
          post: post,
          liked: liked,
          addLike: addLike!,
          removeLike: removeLike!),
    );
  }

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  void initState() {
    context.read<PostItemProvider>().checkFollowing(
        following: widget.post!.userId, followed: widget.currentUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostItemProvider>(builder: (context, postItemProvider, _) {
      return Card(
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        elevation: .0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              tileColor: Colors.transparent,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              title: InkWell(
                onTap: () => postItemProvider.onPostTilePressed(context,
                    uid: widget.post!.userId),
                child: Text(
                  widget.post!.username ?? "user",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              leading: RepaintBoundary(
                child: CustomPaint(
                  painter: MyPainter(),
                  child: Container(
                      padding: EdgeInsets.all(3.w),
                      height: 50.w,
                      width: 50.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.w),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.post!.userAvatar!,
                          placeholder: (context, url) =>
                              const SizedBox.shrink(),
                          errorWidget: (context, url, error) =>
                              const SizedBox.shrink(),
                        ),
                      )),
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (postItemProvider.isFollowed == null)
                    const Center(child: CupertinoActivityIndicator()),
                  // if (!widget.followed! &&
                  //     (!postItemProvider.isFollowed! &&
                  //         postItemProvider.isFollowed != null))
                  FutureBuilder(
                      future: FireSrc.firebaseFirestore
                          .collection('users')
                          .doc(widget.currentUser)
                          .get(),
                      builder: (context, snapshot) {
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

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }

                        var doc = snapshot.data;
                        UserModel? user = UserModel.fromDocumentSnapshot(doc);

                        if (user.following!.contains(widget.post!.userId)) {
                          return const SizedBox.shrink();
                        }

                        if (widget.currentUser == widget.post!.userId) {
                          return const SizedBox.shrink();
                        }
                        return SizedBox(
                          width: 90.w,
                          height: 28.h,
                          child: CupertinoButton(
                            onPressed: () => postItemProvider.follow(
                                followingUserId: widget.post!.userId),
                            padding: EdgeInsets.zero,
                            color: const Color(0xFF3797EF),
                            child: Text(
                              'Follow',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Theme.of(context).focusColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Card(
              margin: EdgeInsets.zero,
              elevation: .0,
              color: Theme.of(context).backgroundColor,
              child: GestureDetector(
                onDoubleTap: () => widget.addLike(),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.post!.imageUrl ??
                      "https://cmosmagazine.com/wp-content/uploads/2021/10/Instagram.jpg",
                  height: 375.h,
                  width: 375.w,
                  placeholder: (context, url) => const SizedBox.shrink(),
                  errorWidget: (context, url, error) => const SizedBox.shrink(),
                ),
              ),
            ),
            SizedBox(
              width: 375.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 14.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, right: 8.w),
                    child: widget.liked ?? false
                        ? InkWell(
                            onTap: () => widget.removeLike(),
                            child: Icon(
                              Icons.favorite_outlined,
                              size: 24.w,
                              color: Colors.red,
                            ),
                          )
                        : InkWell(
                            onTap: () => widget.addLike(),
                            child: Icon(
                              Icons.favorite_border,
                              size: 24.w,
                              color: Theme.of(context).focusColor,
                            ),
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, left: 8.w, right: 8.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.comment,
                            arguments: {'post': widget.post});
                      },
                      child: Icon(
                        CupertinoIcons.chat_bubble,
                        size: 24.w,
                        color: Theme.of(context).focusColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, left: 8.w),
                    child: Image.asset(
                      AppConstants.message,
                      width: 24.w,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: SizedBox(
                    width: 375.w,
                    child: Text('${widget.post!.likes!.length} likes'))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: SizedBox(
                  width: 375.w,
                  child: RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        text: '${widget.post!.username}',
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                        children: [
                          TextSpan(
                            text: ' ${widget.post!.description}',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontWeight: FontWeight.w500),
                          )
                        ]),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: SizedBox(
                  width: 375.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.comment,
                          arguments: {'post': widget.post});
                    },
                    child: Text('View all ${widget.fullCommentLength} commits'),
                  )),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: SizedBox(
                    width: 375.w,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        DateFormat.MMMMd().format(
                            DateTime.tryParse(widget.post!.datePublished!) ??
                                DateTime.now()),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.grey),
                      ),
                    ))),
          ],
        ),
      );
    });
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint myPaint = Paint();
    myPaint.style = PaintingStyle.stroke;
    myPaint.strokeWidth = 2.5.w;
    myPaint.shader = ui.Gradient.linear(
      const Offset(0, 1),
      const Offset(1, 0),
      [
        // const Color(0xFFF89C47),
        const Color(0xFFD91A46),
        const Color(0xFFA60F93),
      ],
    );
    canvas.drawCircle(Offset(25.w, 25.w), 25.w, myPaint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
}
