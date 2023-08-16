part of 'drawer_cubit.dart';


sealed class DrawerState {
  const DrawerState();
}

class DrawerInitial extends DrawerState {
  const DrawerInitial();
}

class DrawerMakeLoggedInTrue extends DrawerState {}
class DrawerMakeLoggedInFalse extends DrawerState {}
class DrawerLogOut extends DrawerState {}
class DrawerValueGet extends DrawerState {}
