import 'package:book/core/usable_functions/firebase_data.dart';
import 'package:book/core/usable_functions/firebase_storage.dart';
import 'package:book/features/authentication/data/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'complete_profile_repo.dart';

class CompleteProfileRepoImpl implements CompleteProfileRepo {
  @override
  ({bool succsuful, String? errorString}) addUserData({required UserDataModel userDataModel}) {
    try {
      DataHandling.addDataToDocument(
          collectionName: 'users',
          docName: FirebaseAuth.instance.currentUser!.email!,
          data: UserDataModel.toJson(userDataModel: userDataModel));
      return (succsuful: true,errorString: null);
    } catch (e) {
      return  (succsuful:false,errorString:e.toString());
    }
  }

  @override
  Future<String> uploadUserImage({required String folderName}) async {
    try {
      return await StorageHandle.uploadPicToFolder(folderName: folderName);
    } catch (e) {
      return e.toString();
    }
  }
}
