import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';

class UserWidget extends StatelessWidget {
  final UserModel user;
  final VoidCallback onPress;
  const UserWidget({super.key, required this.user, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: .0,
        margin: const EdgeInsets.symmetric(vertical: .0),
        child: ListTile(
          dense: false,
          onTap: onPress,
          tileColor: Theme.of(context).backgroundColor,
          leading: RepaintBoundary(
            child: CustomPaint(
              painter: MyPainter(),
              child: Container(
                  padding: EdgeInsets.all(3.w),
                  height: 32.w,
                  width: 32.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.w),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: user.photoAvatarUrl ?? '',
                      placeholder: (context, url) => const SizedBox.shrink(),
                      width: 25.w,
                      height: 25.w,
                      errorWidget: (context, url, error) =>
                          const SizedBox.shrink(),
                    ),
                  )),
            ),
          ),
          title: RichText(
            text: TextSpan(
              text: user.username ?? 'user',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ));
  }
}
