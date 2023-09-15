import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

abstract final class  StorageHandle {
  static Future<String> uploadPicToSubFolder(
      {required String folderName, required String subFolderName}) async {
    String text = '';
    ImagePicker picker = ImagePicker();
    dynamic imageFile;
    try {
      imageFile = await picker.pickImage(source: ImageSource.gallery);
    } catch (error) {
      text = error.toString();
    }
    if (text.isNotEmpty) return text;
    return FirebaseStorage.instance
        .ref()
        .child(folderName)
        .child("$subFolderName/${Uri
        .file(imageFile.path)
        .pathSegments
        .last}")
        .putFile(File(imageFile.path))
        .then((value) => value.ref.getDownloadURL())
        .catchError((error) => error.toString());
  }

}