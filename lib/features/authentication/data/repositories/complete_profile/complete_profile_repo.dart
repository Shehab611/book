import 'package:book/features/authentication/data/models/user_data.dart';

abstract class CompleteProfileRepo{

  Future<String> uploadUserImage({required String folderName});
  ({bool succsuful, String? errorString})  addUserData({required UserDataModel userDataModel});

}