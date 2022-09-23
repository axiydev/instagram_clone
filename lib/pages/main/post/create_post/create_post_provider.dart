import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/services/fire/fire_src.dart';
import 'package:instagram_clone/services/image/image_pick_src.dart';

typedef LogoutFunction = void Function(int? index);

class CreatePostProvider with ChangeNotifier {
  File? imageFile;
  final PickImageSrc _pickImageSrc = PickImageSrc();

  TextEditingController? descriptionController = TextEditingController();

  void restore() {
    imageFile = null;
    notifyListeners();
  }

  void showPostCreationType(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('Create Post'),
              content: const Text('Choose your create type'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('camera'),
                  onPressed: () async {
                    imageFile = await _pickImageSrc
                        .pickImageFromStorage(ImageSource.camera)
                        .then((value) {
                      log(value.toString());
                      Navigator.of(context).pop();
                      return value;
                    });
                    log(imageFile.toString());
                    notifyListeners();
                  },
                ),
                CupertinoDialogAction(
                  child: const Text('gallery'),
                  onPressed: () async {
                    imageFile = await _pickImageSrc
                        .pickImageFromStorage(ImageSource.gallery)
                        .then((value) {
                      Navigator.of(context).pop();
                      return value;
                    });
                    notifyListeners();
                  },
                ),
              ],
            ));
  }

  void publishingPost({required LogoutFunction? func}) async {
    try {
      if (imageFile == null) return;
      PostModel newPost = PostModel(
        description: descriptionController!.text,
      );
      bool? isPublished =
          await FireSrc.uploadPost(post: newPost, imageFile: imageFile);

      if (isPublished!) {
        log('Publish boldi');
        imageFile = null;
        descriptionController!.clear();
        func!(0);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
