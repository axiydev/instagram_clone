import 'package:flutter/material.dart';

abstract class SignInProviderRepository {
  void onInit();
  void onDispose();
}

class SignInProvider extends SignInProviderRepository with ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onDispose() {
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
  }
}
