import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);
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

  static void get themeChanger {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
