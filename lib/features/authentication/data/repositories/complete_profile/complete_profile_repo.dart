import 'package:book/features/authentication/data/models/user_data.dart';

abstract interface class CompleteProfileRepo{

  Future<String> uploadUserImage({required String folderName});
  Future< ({bool succsuful, String? errorString}) > addUserData({required UserDataModel userDataModel});

}