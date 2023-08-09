import 'package:book/core/usable_functions/firebase_data.dart';
import 'package:book/core/usable_functions/firebase_storage.dart';
import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/authentication/data/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

import 'complete_profile_repo.dart';

final class CompleteProfileRepoImpl implements CompleteProfileRepo {
  @override
  Future<({bool succsuful, String? errorString})> addUserData(
      {required UserDataModel userDataModel}) async {
    try {
      await DataHandling.addDataToDocument(
          collectionName: 'users',
          docName: FirebaseAuth.instance.currentUser!.email!,
          data: UserDataModel.toJson(userDataModel: userDataModel));
      return (succsuful: true, errorString: null);
    } catch (e) {
      return (succsuful: false, errorString: e.toString());
    }
  }

  @override
  Future<({bool succsuful, String? errorString, String? path})> uploadUserImage(
      {required String subFolderName}) async {
    try {
      String path = await StorageHandle.uploadPicToSubFolder(
          folderName: 'user_images', subFolderName: subFolderName);

      return (succsuful: true, errorString: null, path: path);
    } catch (e) {
      return (succsuful: false, errorString: e.toString(), path: null);
    }
  }

  @override
  Future<({bool succsuful, String? errorString})> addUserDataToDB(
      {required UserDataModel userDataModel}) async {
    try {
      await serviceLocator.get<Box<UserDataModel>>().add(userDataModel);
      return (
        succsuful: true,
        errorString: null,
      );
    } catch (e) {
      return (succsuful: false, errorString: e.toString());
    }
  }
}
