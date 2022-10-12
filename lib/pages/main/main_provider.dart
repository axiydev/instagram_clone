import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/data/app_data.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:instagram_clone/utils/app_utils_export.dart';

class MainProvider with ChangeNotifier {
  final CupertinoTabController? cupertinoTabController =
      CupertinoTabController();
  int? _currentIndex = 0;
  UserModel? _user;
  UserModel? _selectedUser;
  String? _imageUrl;

  void getUser({required String? uid}) async {
    try {
      _selectedUser = await AuthSrc.getSelectedUser(userUid: uid);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
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

  void getUserAvatar() async {
    try {
      _user = await AuthSrc.getCurrentUser;
      usernameApp = (await AuthSrc.getCurrentUser)!.username!;
      _imageUrl = _user!.photoAvatarUrl;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  void changeIndex(int? index) {
    _currentIndex = index;
    cupertinoTabController!.index = index!;
    log(cupertinoTabController!.index.toString());
    notifyListeners();
  }

  int? get currentIndex => _currentIndex;
  String? get imageUrl => _imageUrl;
  UserModel? get user => _user;
  UserModel? get selectedUser => _selectedUser;
}
