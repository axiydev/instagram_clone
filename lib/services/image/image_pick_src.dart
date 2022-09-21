import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickImageSrc {
  late ImagePicker? _imagePicker;

  PickImageSrc.init() {
    _imagePicker = ImagePicker();
  }
  static final _instance = PickImageSrc.init();

  factory PickImageSrc() => _instance;

  Future<File?> pickImageFromStorage(ImageSource? source) async {
    File? file;
    try {
      final request = await Permission.photos.request();
      if (request.isGranted) {
        var imageFile = await _imagePicker!.pickImage(source: source!);
        file = File(imageFile!.path);
      }
      return file;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  ImagePicker? get imagePicker => _imagePicker;
}
