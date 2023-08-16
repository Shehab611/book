part of 'drawer_header_cubit.dart';


sealed class DrawerHeaderState {
  const DrawerHeaderState();
}

class DrawerHeaderInitial extends DrawerHeaderState {
  const DrawerHeaderInitial();
}
class DrawerHeaderLoading extends DrawerHeaderState {
  const DrawerHeaderLoading();
}
class DrawerHeaderGetUserData extends DrawerHeaderState {
  final ({String userName,String userImagePath}) userData;

  const DrawerHeaderGetUserData(this.userData);
}