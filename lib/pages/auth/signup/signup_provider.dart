import 'package:flutter/material.dart';

abstract class SignUpProviderRepository {
  void onInit();
  void onDispose();
}

class SignUpProvider extends SignUpProviderRepository with ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController bioController = TextEditingController();
  @override
  void onDispose() {
    userNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
  }
}
