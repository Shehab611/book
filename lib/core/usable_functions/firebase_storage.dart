import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

abstract class StorageHandle {
//all works done
  static Future<String> uploadPicToFolder({required String folderName}) async {
    ImagePicker picker = ImagePicker();
    XFile? imageFile;

    try {
      imageFile = await picker.pickImage(source: ImageSource.gallery);
    } catch (error) {
      return error.toString();
    }

  var file=  await FirebaseStorage.instance
        .ref()
        .child("$folderName/${Uri
        .file(imageFile!.path)
        .pathSegments
        .last}")
        .putFile(File(imageFile.path));

      return await file.ref.getDownloadURL();
  }

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

  static Future<String> uploadVideoToFolder({required String folderName}) async {
    String text = '';
    ImagePicker picker = ImagePicker();
    XFile? videoFile;
    try {
      videoFile = await picker.pickImage(source: ImageSource.gallery);
    } catch (error) {
      text = error.toString();
    }
    if (text.isNotEmpty) return text;
    return FirebaseStorage.instance
        .ref()
        .child("$folderName/${Uri
        .file(videoFile!.path)
        .pathSegments
        .last}")
        .putFile(
        File(videoFile.path), SettableMetadata(contentType: 'video/mp4'))
        .then((value) => value.ref.getDownloadURL())
        .catchError((error) => error.toString());
  }

  static Future<String> uploadPdfToFolder({required String folderName}) async {
    String text = '';
    FilePickerResult? pdfFile;
    try {
      pdfFile = await FilePicker.platform
          .pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);
    } catch (error) {
      text = error.toString();
    }
    if (text.isNotEmpty) return text;
    return FirebaseStorage.instance
        .ref()
        .child(
        "$folderName/${Uri
            .file(pdfFile!.files.single.path!)
            .pathSegments
            .last}")
        .putFile(File(pdfFile.files.single.path!),
        SettableMetadata(contentType: 'application/pdf'))
        .then((value) => value.ref.getDownloadURL())
        .catchError((error) => error.toString());
  }

  static Future<String> uploadSpecificExtensionToFolder(
      {required String folderName, required List<String> extensions}) async {
    String text = '';
    FilePickerResult? pdfFile;
    try {
      pdfFile = await FilePicker.platform
          .pickFiles(allowedExtensions: extensions, type: FileType.custom);
    } catch (error) {
      text = error.toString();
    }

    if (text.isNotEmpty) return text;
    return FirebaseStorage.instance
        .ref()
        .child(
        "$folderName/${Uri
            .file(pdfFile!.files.single.path!)
            .pathSegments
            .last}")
        .putFile(
      File(pdfFile.files.single.path!),
    )
        .then((value) => value.ref.getDownloadURL())
        .catchError((error) => error.toString());
  }

  static Future<String> uploadAnyExtensionToFolder(
      {required String folderName}) async {
    String text = '';
    FilePickerResult? pdfFile;
    try {
      pdfFile = await FilePicker.platform.pickFiles();
    } catch (error) {
      text = error.toString();
    }
    if (text.isNotEmpty) return text;
    return FirebaseStorage.instance
        .ref()
        .child(
        "$folderName/${Uri
            .file(pdfFile!.files.single.path!)
            .pathSegments
            .last}")
        .putFile(
      File(pdfFile.files.single.path!),
    )
        .then((value) => value.ref.getDownloadURL())
        .catchError((error) => error.toString());
  }

//works done
// the elements in the returned list is sorted by last modified
  static Future<List<String>> getLinksOfAllFilesInFolder(
      {required String folderName}) async {
    List<String> url = [];
    await FirebaseStorage.instance
        .ref()
        .child(folderName)
        .listAll()
        .then((value) async {
      for (var element in value.items) {
        await element.getDownloadURL().then((value) {
          url.add(value);
        });
      }
    }).catchError((error) {
      url.add(error.toString());
    }) ??
        '';
    return url.reversed.toList();
  }

//works done
  static Future<List<String>> getLinksOfAllFilesInAllSubFolder({
    required String folderName,
  }) async {
    List<String> url = [];
    await FirebaseStorage.instance
        .ref()
        .child(folderName)
        .listAll()
        .then((value) async {
      for (var element in value.prefixes) {
        await element.listAll().then((value) async {
          for (var element in value.items) {
            await element.getDownloadURL().then((value) {
              url.add(value);
            });
          }
        });
      }
    }).catchError((error) {
      url.add(error.toString());
    }) ??
        '';
    return url.reversed.toList();
  }

//works done
  static Future<List<String>> getLinksOfAllFilesInOneSubFolder(
      {required String folderName, required String subFolderName}) async {
    List<String> url = [];
    await FirebaseStorage.instance
        .ref()
        .child(folderName)
        .listAll()
        .then((value) async {
      for (var element in value.prefixes) {
        if (element.name.trim() == subFolderName) {
          await element.listAll().then((value) async {
            for (var element in value.items) {
              await element.getDownloadURL().then((value) {
                url.add(value);
              });
            }
          });
        }
      }
      if (url.isEmpty) url.add('Folder is not found');
    }).catchError((error) {
      url.add(error.toString());
    }) ??
        '';
    return url.reversed.toList();
  }

//works done
  static Future<String> getLinkOfFileInOneSubFolder({required String folderName,
    required String subFolderName,
    required String fileName}) async {
    String url = '';
    await FirebaseStorage.instance
        .ref()
        .child(folderName)
        .listAll()
        .then((value) async {
      for (var element in value.prefixes) {
        if (element.name.trim() == subFolderName) {
          await element.listAll().then((value) async {
            for (var element in value.items) {
              if (element.name.trim() == fileName) {
                await element.getDownloadURL().then((value) {
                  url = value;
                });
              }
            }
          });
        }
      }
      if (url.isEmpty) url = 'File is not found';
    }).catchError((error) {
      url = error.toString();
    }) ??
        '';
    return url;
  }

//works done
  static Future<String> getLinkOfOneFileInFolder(
      {required String folderName, required String fileName}) async {
    String url = '';
    await FirebaseStorage.instance
        .ref()
        .child(folderName)
        .listAll()
        .then((value) async {
      for (var element in value.items) {
        if (element.name.trim() == fileName) {
          await element.getDownloadURL().then((value) {
            url = value;
          });
        }
      }
      if (url.isEmpty) url = 'File is not found';
    }).catchError((error) {
      url = error.toString();
    }) ??
        '';
    return url;
  }
}