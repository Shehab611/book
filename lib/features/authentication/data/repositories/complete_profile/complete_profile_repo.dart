import 'package:book/features/authentication/data/models/user_data.dart';

abstract interface class CompleteProfileRepo{

  Future<({bool successful, String? errorString,String? path})> uploadUserImage({required String subFolderName});
  Future< ({bool successful, String? errorString}) > addUserData({required UserDataModel userDataModel});
  Future<({bool successful, String? errorString}) > addUserDataToDB({required UserDataModel userDataModel});

}