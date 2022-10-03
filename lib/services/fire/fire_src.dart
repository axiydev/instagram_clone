import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_clone/models/comment_model.dart';
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

  //? remove avatar to Storage
  static Future<bool?> removeFileFromStorage({required String url}) async {
    try {
      var ref = _firebaseStorage.refFromURL(url);
      await ref.delete();
      return true;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

//? upload post
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
          comments: 0,
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

//? upload post
  static Future<bool?> deletePost({required PostModel? post}) async {
    try {
      bool? imageDeleted = await removeFileFromStorage(url: post!.imageUrl!);
      if (imageDeleted!) {
        await _firebaseFirestore.collection('posts').doc(post.postId).delete();
        return true;
      }
      return false;
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<bool?> addLike({required PostModel? myPost}) async {
    try {
      final currentUser = _firebaseAuth.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> myDocument =
          await _firebaseFirestore
              .collection('posts')
              .doc(myPost!.postId)
              .get();
      if (!(myDocument.data()!['likes'] as List).contains(currentUser)) {
        _firebaseFirestore.collection('posts').doc(myPost.postId).update({
          'likes': FieldValue.arrayUnion([currentUser]),
        });
        return true;
      }
      return true;
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return null;
  }

  static bool? isLiked({required PostModel? myPost}) {
    try {
      final currentUser = _firebaseAuth.currentUser!.uid;
      if (myPost!.likes!.contains(currentUser)) {
        return true;
      }
      return false;
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<bool?> removeLike({required PostModel? myPost}) async {
    try {
      final currentUser = _firebaseAuth.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> myDocument =
          await _firebaseFirestore
              .collection('posts')
              .doc(myPost!.postId)
              .get();
      if ((myDocument.data()!['likes'] as List).contains(currentUser)) {
        _firebaseFirestore.collection('posts').doc(myPost.postId).update({
          'likes': FieldValue.arrayRemove([currentUser]),
        });
        return false;
      }
      return false;
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return null;
  }

//? FOR COMMENT
  static Future<bool?> postComment(
      {required String? postId, required CommentModel? comment}) async {
    try {
      final commnetId = const Uuid().v1();
      CommentModel? newComment = comment!.copyWith(commentId: commnetId);
      await _firebaseFirestore
          .collection('posts')
          .doc(postId)
          .collection('commentss')
          .doc(commnetId)
          .set(newComment.toJson());
      await _firebaseFirestore
          .collection('posts')
          .doc(postId)
          .update({'comments': FieldValue.increment(1)});
      CommentModel? requestCommentModel = await getComment();
      if (requestCommentModel!.uid != null) {
        return true;
      }
      return false;
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return null;
  }

//? get commetnt
  static Future<CommentModel?> getComment({
    String? postId,
  }) async {
    try {
      final commnetId = const Uuid().v1();
      DocumentSnapshot<Map<String, dynamic>> comment = await _firebaseFirestore
          .collection('posts')
          .doc(postId)
          .collection('commentss')
          .doc(commnetId)
          .get();
      Map<String, dynamic>? data = comment.data();
      if (data != null) {
        return CommentModel.fromJson(data);
      }
      return CommentModel.fromJson({});
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return null;
  }

//? follow User
  static Future<bool?> followUser(
      {required String? followingUserId,
      required String? followedUserId}) async {
    try {
      final userFollowing = await _firebaseFirestore
          .collection('users')
          .doc(followingUserId)
          .get();
      final userFollowed = await _firebaseFirestore
          .collection('users')
          .doc(followedUserId)
          .get();

      bool? isFollowed = false;
      bool? isFollowing = false;
      log(userFollowing.data()!['followers'].toString());
      if (!userFollowing.data()!['followers'].contains(followedUserId)) {
        await _firebaseFirestore
            .collection('users')
            .doc(followingUserId)
            .update({
          'followers': FieldValue.arrayUnion([followedUserId])
        });

        isFollowed = true;
      }

      if (!userFollowed.data()!['following'].contains(followingUserId)) {
        await _firebaseFirestore
            .collection('users')
            .doc(followedUserId)
            .update({
          'following': FieldValue.arrayUnion([followingUserId])
        });
        isFollowing = true;
      }

      return isFollowing && isFollowed;
    } on FirebaseException catch (e) {
      log(e.toString());
    }

    return null;
  }

  static Future<bool?> checkFollowing(
      {required String? followingUserId,
      required String? followedUserId}) async {
    try {
      final userFollowing = await _firebaseFirestore
          .collection('users')
          .doc(followingUserId)
          .get();
      var data = userFollowing.data();

      if (data!['followers']!.contains(followedUserId)) {
        return true;
      }
      return false;
    } on FirebaseException catch (e) {
      log(e.toString());
    }

    return null;
  }

  static Future<bool?> unfollowUser(
      {required String? followingUserId,
      required String? followedUserId}) async {
    try {
      final userFollowing = await _firebaseFirestore
          .collection('users')
          .doc(followingUserId)
          .get();
      final userFollowed = await _firebaseFirestore
          .collection('users')
          .doc(followedUserId)
          .get();

      bool? isFollowRemoved = false;
      bool? isFollowingRemoved = false;
      log(userFollowing.data()!['followers'].toString());
      if (userFollowing.data()!['followers'].contains(followedUserId)) {
        await _firebaseFirestore
            .collection('users')
            .doc(followingUserId)
            .update({
          'followers': FieldValue.arrayRemove([followedUserId])
        });

        isFollowRemoved = true;
      }

      if (userFollowed.data()!['following'].contains(followingUserId)) {
        await _firebaseFirestore
            .collection('users')
            .doc(followedUserId)
            .update({
          'following': FieldValue.arrayRemove([followingUserId])
        });
        isFollowingRemoved = true;
      }

      return isFollowingRemoved && isFollowRemoved;
    } on FirebaseException catch (e) {
      log(e.toString());
    }

    return null;
  }

  static Future<int?> getCommentLength({
    String? postId,
  }) async {
    try {
      QuerySnapshot<Map<String, dynamic>> comment = await _firebaseFirestore
          .collection('posts')
          .doc(postId)
          .collection('commentss')
          .get();
      int? data = comment.size;
      return data;
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return null;
  }

  static FirebaseFirestore get firebaseFirestore => _firebaseFirestore;
}
