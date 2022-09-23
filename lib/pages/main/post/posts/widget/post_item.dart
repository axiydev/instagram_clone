import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class PostItem extends StatelessWidget {
  final PostModel? post;
  final Function addLike;
  final int? fullCommentLength;
  final bool? liked;
  final Function removeLike;
  const PostItem(
      {super.key,
      required this.fullCommentLength,
      required this.post,
      required this.liked,
      required this.addLike,
      required this.removeLike});

  @override
  Widget build(BuildContext context) {
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
            title: Text(
              post!.username ?? "user",
              style: Theme.of(context).textTheme.displaySmall,
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
                      borderRadius: BorderRadius.circular(25),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: post!.userAvatar!,
                        placeholder: (context, url) => const SizedBox.shrink(),
                        errorWidget: (context, url, error) =>
                            const SizedBox.shrink(),
                      ),
                    )),
              ),
            ),
            trailing: Icon(
              Icons.more_horiz,
              color: Theme.of(context).focusColor,
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
              onDoubleTap: () => addLike(),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: post!.imageUrl ??
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
                  child: liked ?? false
                      ? InkWell(
                          onTap: () => removeLike(),
                          child: Icon(
                            Icons.favorite_outlined,
                            size: 24.w,
                            color: Colors.red,
                          ),
                        )
                      : InkWell(
                          onTap: () => addLike(),
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
                          arguments: {'post': post});
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
                  child: Icon(
                    Icons.share,
                    size: 24.w,
                    color: Theme.of(context).focusColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: SizedBox(
                  width: 375.w, child: Text('${post!.likes!.length} likes'))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SizedBox(
                width: 375.w,
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      text: '${post!.username}',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      children: [
                        TextSpan(
                          text: ' ${post!.description}',
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
                        arguments: {'post': post});
                  },
                  child: Text('View all $fullCommentLength commits'),
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
                          DateTime.tryParse(post!.datePublished!) ??
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
    canvas.drawCircle(const Offset(26, 26), 25, myPaint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
}
