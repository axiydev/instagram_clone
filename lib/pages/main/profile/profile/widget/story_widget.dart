import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

class StoryWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isAddWidget;
  final String imageUrl;
  const StoryWidget(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.imageUrl,
      this.isAddWidget = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
      margin: EdgeInsets.only(left: 15.w),
      elevation: .0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isAddWidget
              ? GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    height: 52.w,
                    width: 52.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.w,
                          color: const Color(0xFF48484A),
                        )),
                    child: Icon(
                      Icons.add,
                      size: 18.w,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: onPressed,
                  child: CustomPaint(
                    painter: MyPainter(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28.w),
                      child: SizedBox(
                        height: 52.w,
                        width: 52.w,
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              const SizedBox.shrink(),
                          placeholder: (context, url) =>
                              const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
          )
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
        // const Color(0xFFffa95f).withOpacity(.5),
        // const Color(0xFFf99c4a).withOpacity(.15),
        // const Color(0xFFf47838).withOpacity(.3),
        // const Color(0xFFf99c4a).withOpacity(.45),
        const Color(0xFFd92d7a).withOpacity(.7),
        const Color(0xFFcc2a92).withOpacity(.8),
        const Color(0xFFc32e92).withOpacity(.95)
      ],
      [1.0, 1.0, 1.0],
    );
    canvas.drawCircle(Offset(26.w, 26.w), 30.w, myPaint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
}
