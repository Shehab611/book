import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/authentication/data/models/user_data.dart';
import 'package:hive/hive.dart';

import 'drawer_repo.dart';

final class DrawerRepoImpl implements DrawerRepo{
  @override
  ({String userImagePath, String userName}) getUserData() {
    var userData= serviceLocator.get<Box<UserDataModel>>().get(0);
    String fName=userData!.fName;
    String lName=userData.lName;
    String userImagePath=userData.imageLink;
   return (userName:('$fName $lName'),userImagePath:userImagePath);
  }
}