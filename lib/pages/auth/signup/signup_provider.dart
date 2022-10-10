import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';
import 'package:provider/provider.dart';

abstract class SignUpProviderRepository {
  void onInit();
  void onDispose();
}

class SignUpProvider extends SignUpProviderRepository
    with ChangeNotifier, ReassembleHandler {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final _imagePicker = ImagePicker();

  final globalKeyForFormField = GlobalKey<FormState>();
  File? _file;
  bool? isLoading = false;
  @override
  void onDispose() {
    userNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  void uploadImageToAvatar() async {
    try {
      var xFile = await _imagePicker.pickImage(source: ImageSource.gallery);
      _file = File(xFile!.path);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  void signUp(BuildContext context) async {
    FocusScope.of(context).unfocus();
    RegExp exp = RegExp(r"^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$");
    if (!exp.hasMatch(emailController.text.trim())) {
      AppUtils.showDialog(context, msg: 'Gmail kiritishda xatolik bor');
      return;
    }

    if (passwordController.text.length < 7) {
      AppUtils.showDialog(context, msg: 'Password 7 tadan kam');
      return;
    }
    if (_file == null) {
      AppUtils.showDialog(context, msg: 'Rasm yuklanmadi');
      return;
    }
    isLoading = true;
    notifyListeners();
    try {
      if (emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty ||
          userNameController.text.isEmpty) return;
      if (passwordController.text.trim() !=
          confirmPasswordController.text.trim()) return;

      var userCreated = await AuthSrc.signUp(
          email: emailController.text.trim(),
          bio: bioController.text.trim(),
          imageFile: _file,
          username: userNameController.text.trim(),
          password: passwordController.text.trim());
      if (userCreated!) {
        isLoading = false;
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoutes.mainPage, (route) => false);
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  File? get imageFile => _file;

  @override
  void onInit() {}

  @override
  void reassemble() {
    log('HOTT RELOADED');
  }
}
