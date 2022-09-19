import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/models/user_model.dart';

class AuthSrc {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _firebaseStorage = FirebaseStorage.instance;
  static final _firebaseFirestore = FirebaseFirestore.instance;

//? sign in

  static Future<UserCredential?> signIn(
      {required String? username, required String? password}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: username!, password: password!);
      return userCredential;
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return null;
  }

//? sign up
  static Future<bool?> signUp({
    required String? email,
    required String? password,
    required File? imageFile,
    required String? username,
    required String? bio,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      UserModel? user = UserModel(
          username: username,
          uid: userCredential.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoAvatarUrl:
              await uploadFileToStorage(fileName: username!, file: imageFile));
      if (user.photoAvatarUrl == null) return null;
      await _firebaseFirestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(user.toJson());
      if (kDebugMode) {
        print('siz muvofaqqiyatli royxatdan otdingiz');
      }
      return true;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      log(e.toString());
    }
    return null;
  }

//? upload avatar to Storage
  static Future<String?> uploadFileToStorage(
      {required String fileName, required File? file}) async {
    try {
      var ref = _firebaseStorage.ref();
      var newRef = ref.child('avatarPhoto').child(fileName);
      UploadTask? task = newRef.putFile(file!);
      await task;
      return newRef.getDownloadURL();
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
