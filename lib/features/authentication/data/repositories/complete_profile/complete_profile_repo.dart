import 'package:book/features/authentication/data/models/user_data.dart';

abstract interface class CompleteProfileRepo{

  Future<({bool succsuful, String? errorString,String? path})> uploadUserImage({required String subFolderName});
  Future< ({bool succsuful, String? errorString}) > addUserData({required UserDataModel userDataModel});
  Future<({bool succsuful, String? errorString}) > addUserDataToDB({required UserDataModel userDataModel});

}