import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';

class EditProfileProvider with ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final globalKeyForFormField = GlobalKey<FormState>();
  final _imagePicker = ImagePicker();
  UserModel? user;
  File? _file;
  bool? isLoading = false;

  void initUserValues() async {
    try {
      user = await AuthSrc.getCurrentUser;
      userNameController.text = user!.username!;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
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

  void back(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  void updateUser(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (_file == null) {
      AppUtils.showDialog(context, msg: 'Rasm yuklanmadi');
      return;
    }
    if (userNameController.text.isEmpty ||
        userNameController.text == user!.username) return;
    isLoading = true;
    notifyListeners();
    try {
      if (userNameController.text.isEmpty) return;
      UserModel? updatedUser = user!
          .copyWith(bio: bioController.text, username: userNameController.text);
      var userCreated = await AuthSrc.updateUser(
          imageFile: imageFile,
          username: userNameController.text,
          updatedUser: updatedUser);
      if (userCreated!) {
        isLoading = false;
        // ignore: use_build_context_synchronously
        back(context);
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  File? get imageFile => _file;
}
