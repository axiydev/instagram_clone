import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

enum ActionTypeCustom { delete, copyLink }

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
          const Color(0xFFFBAA47),
          const Color(0xFFD91A46),
          const Color(0xFFA60F93)
        ],
        [
          1,
          1,
          1,
        ],
        TileMode.clamp);
    canvas.drawCircle(Offset(16.w, 16.w), 16.w, myPaint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
}

class AppUtils {
  static ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.dark);
  static void showDialog(BuildContext context, {required String msg}) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Input error'),
        content: Text(msg),
        actions: [
          CupertinoDialogAction(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  static String? getDuration(String? dateTime) {
    Duration? duration =
        DateTime.now().difference(DateTime.tryParse(dateTime!)!);
    int? day = duration.inDays;
    int? hours = duration.inHours;
    int? min = duration.inMinutes;
    int? sec = duration.inSeconds;
    if (day >= 1) {
      return ' $day days ago';
    } else if (hours >= 1) {
      return ' $hours hours ago';
    } else if (min >= 1) {
      return ' $min minutes ago';
    } else {
      return ' $sec seconds ago';
    }
  }

//? theme changer
  static void themeChanger() {
    if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    }
  }
}
