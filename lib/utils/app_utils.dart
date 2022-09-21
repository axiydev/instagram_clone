import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

//? theme changer
  static void themeChanger() {
    if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    }
  }
}
