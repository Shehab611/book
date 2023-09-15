import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/authentication/data/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart';

import 'drawer_repo.dart';

final class DrawerRepoImpl implements DrawerRepo {
  @override
  Future<({String userImagePath, String userName})> getUserData() async {
    var userData = await serviceLocator.get<Database>().rawQuery(
        'select * from users where userEmail = ?',
        [FirebaseAuth.instance.currentUser!.email!]);
    var userDataModel = UserDataModel.fromJson(userData[0]);
    String fName = userDataModel.fName;
    String lName = userDataModel.lName;
    String userImagePath = userDataModel.imageLink;
    return (userName: ('$fName $lName'), userImagePath: userImagePath);
  }
}
