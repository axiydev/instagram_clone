import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';

abstract class SignInProviderRepository {
  void onInit();
  void onDispose();
}

class SignInProvider extends SignInProviderRepository with ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool? isLoading = false;
  void signIn(
    BuildContext context,
  ) async {
    if (passwordController.text.length < 7) {
      AppUtils.showDialog(context, msg: 'password 8 tadan kam');
      return;
    }
    try {
      if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
        return;
      }
      isLoading = true;
      notifyListeners();
      final UserCredential? userCredential = await AuthSrc.signIn(
          username: userNameController.text.trim(),
          password: passwordController.text.trim());
      if (userCredential != null) {
        isLoading = false;
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.mainPage, (route) => false);
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onDispose() {
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  void onInit() {}
}
