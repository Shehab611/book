part of 'drawer_cubit.dart';


sealed class DrawerState {
  const DrawerState();
}

class DrawerInitial extends DrawerState {
  const DrawerInitial();
}
class DrawerLoading extends DrawerState {}
class DrawerGetUserData extends DrawerState {
  final ({String userName,String userImagePath}) userData;

  const DrawerGetUserData(this.userData);
}

class DrawerMakeLoggedInTrue extends DrawerState {}
class DrawerMakeLoggedInFalse extends DrawerState {}
