import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoWidget extends StatelessWidget {
  final int count;
  final String title;
  const InfoWidget({super.key, required this.count, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
