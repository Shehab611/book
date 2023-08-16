import 'package:book/core/utils/services_locator.dart';
import 'package:book/features/authentication/data/models/user_data.dart';
import 'package:hive/hive.dart';

import 'drawer_repo.dart';

class DrawerRepoImpl implements DrawerRepo{
  @override
  ({String userImagePath, String userName}) getUserData() {
    var userData=  serviceLocator.get<Box<UserDataModel>>().get(0);
   return (userName:('${userData!.fName} ${userData.lName}'),userImagePath: userData.imageLink);
  }
}