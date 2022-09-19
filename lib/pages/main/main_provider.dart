import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';

class MainProvider with ChangeNotifier {
  String? imageUrl;
  void loadUserAvatar() async {
    try {} catch (e) {}
  }

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.signIn, (route) => false);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
