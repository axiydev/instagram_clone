import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:intl/intl.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem(
      {Key? key,
      required this.username,
      required this.datetime,
      required this.imageUrl,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final String? username;
  final String? datetime;
  final String? imageUrl;
  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: .0,
        margin: EdgeInsets.zero,
        child: ListTile(
          dense: true,
          onTap: onPressed,
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
                    text: ' ${text ?? "default"}',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  )
                ]),
          ),
          subtitle: Text(
            DateFormat.MMMEd().format(DateTime.tryParse(datetime!)!),
          ),
        ));
  }
}
