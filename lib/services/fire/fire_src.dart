import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/services/auth/auth_src.dart';
import 'package:uuid/uuid.dart';

class FireSrc {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _firebaseStorage = FirebaseStorage.instance;
  static final _firebaseFirestore = FirebaseFirestore.instance;

  //? upload avatar to Storage
  static Future<String?> uploadFileToStorage(
      {required String fileName, required File? file}) async {
    try {
      var ref = _firebaseStorage.ref();
      var newRef = ref.child('postsImage').child(fileName);
      UploadTask? task = newRef.putFile(file!);
      await task;
      return newRef.getDownloadURL();
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<bool?> uploadPost(
      {required PostModel? post, required File? imageFile}) async {
    try {
      String? postId = const Uuid().v1();
      UserModel? user = await AuthSrc.getCurrentUser;
      String? uploadedImageUrl = await uploadFileToStorage(
          fileName: postId + imageFile!.path.split('/').last, file: imageFile);
      PostModel newPost = post!.copyWith(
          postId: postId,
          userId: user!.uid,
          username: user.username,
          userAvatar: user.photoAvatarUrl,
          likes: [],
          comments: [],
          imageUrl: uploadedImageUrl,
          datePublished: DateTime.now().toString());

      await _firebaseFirestore
          .collection('posts')
          .doc(postId)
          .set(newPost.toJson());
      PostModel? resultPost = PostModel.fromDocumentSnapshot(
          await _firebaseFirestore.collection('posts').doc(postId).get());
      bool? isPublished = resultPost.postId != null;
      return isPublished;
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return null;
  }
}
