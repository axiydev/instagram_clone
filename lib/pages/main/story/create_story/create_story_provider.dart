import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/models/story_model.dart';
import 'package:instagram_clone/services/services.dart';

class CreateStoryProvider with ChangeNotifier {
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
              title: const Text('Create Story'),
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

  void publishingStory(
    BuildContext context,
  ) async {
    try {
      if (imageFile == null) return;
      StoryModel? newStory = StoryModel(
        description: descriptionController!.text,
      );
      bool? isPublished =
          await FireSrc.uploadStory(story: newStory, imageFile: imageFile);

      if (isPublished!) {
        log('Publish boldi');
        imageFile = null;
        descriptionController!.clear();
        // ignore: use_build_context_synchronously
        if (Navigator.of(context).canPop()) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
