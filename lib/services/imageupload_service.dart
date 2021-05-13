import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class ImageUpload {
  User? user = FirebaseAuth.instance.currentUser;
  Future<String> uploadImage(String path, bool camera) async {
    try {
      PickedFile? file = await ImagePicker.platform
          .pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref(path);
      await ref.putFile(File(file!.path));
      String? image = await ref.getDownloadURL();
      return image;
    } catch (err) {
      throw err;
    }
  }
}
