import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';

class CustomCardItemReaction extends StatelessWidget {
  const CustomCardItemReaction(
      {Key? key,
      required this.username,
      required this.datetime,
      required this.imageUrl,
      required this.postImageUrl,
      required this.onPressed,
      required this.text})
      : super(key: key);

  final String? username;
  final String? datetime;
  final String? imageUrl;
  final String? postImageUrl;
  final String? text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: .0,
        margin: EdgeInsets.zero,
        child: ListTile(
          dense: false,
          onTap: onPressed,
          tileColor: Theme.of(context).backgroundColor,
          trailing: CachedNetworkImage(
            imageUrl: postImageUrl!,
            width: 44.w,
            height: 44.w,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const SizedBox.shrink(),
            placeholder: (context, url) => const SizedBox.shrink(),
          ),
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
                      imageUrl: imageUrl!,
                      placeholder: (context, url) => const SizedBox.shrink(),
                      errorWidget: (context, url, error) =>
                          const SizedBox.shrink(),
                    ),
                  )),
            ),
          ),
          title: RichText(
            text: TextSpan(
                text: username!,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                children: [
                  TextSpan(
                    text: ' liked your post',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  )
                ]),
          ),
          subtitle: Text(
            AppUtils.getDuration(datetime)!,
          ),
        ));
  }
}
