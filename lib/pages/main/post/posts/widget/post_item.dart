import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:intl/intl.dart';

class PostItem extends StatelessWidget {
  final PostModel? post;
  const PostItem({Key? key, required this.post}) : super(key: key);

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
            contentPadding: EdgeInsets.zero,
            title: Text(
              post!.username ?? "user",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            leading: Container(
                padding: EdgeInsets.all(3.w),
                height: 50.w,
                width: 50.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.w, color: Colors.red)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: post!.userAvatar!,
                    placeholder: (context, url) => const Placeholder(),
                    errorWidget: (context, url, error) => const Placeholder(),
                  ),
                )),
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
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: post!.imageUrl ??
                  "https://cmosmagazine.com/wp-content/uploads/2021/10/Instagram.jpg",
              height: 375.h,
              width: 375.w,
              placeholder: (context, url) => Image.network(url),
              errorWidget: (context, url, error) => Image.network(url),
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
                  child: Icon(
                    Icons.favorite_border,
                    size: 24.w,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h, left: 8.w, right: 8.w),
                  child: Icon(
                    CupertinoIcons.chat_bubble,
                    size: 24.w,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h, left: 8.w),
                  child: Icon(
                    Icons.share,
                    size: 24.w,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: SizedBox(width: 375.w, child: const Text('64 likes'))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: const Text(
                'joshua_l The game in Japan was amazing and I want to share some photos'),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: SizedBox(
                  width: 375.w,
                  child: Text(DateFormat.MMMMd().format(
                      DateTime.tryParse(post!.datePublished!) ??
                          DateTime.now())))),
        ],
      ),
    );
  }
}
