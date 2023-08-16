import 'package:book/features/home/data/repositories/drawer/drawer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit(this.drawerRepo) : super(const DrawerInitial());
  final DrawerRepo drawerRepo;

  void getUserData(){
    emit(DrawerLoading());
    final ({String userImagePath, String userName}) userData=drawerRepo.getUserData();
    Future.delayed(const Duration(milliseconds: 100),() => emit(DrawerGetUserData(userData)),);

  }

}
