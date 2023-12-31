import 'package:book/features/home/data/repositories/drawer/drawer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drawer_header_state.dart';

class DrawerHeaderCubit extends Cubit<DrawerHeaderState> {
  DrawerHeaderCubit(this.drawerRepo) : super(const DrawerHeaderInitial());
  final DrawerRepo drawerRepo;

  void getUserData() async {
    emit(const DrawerHeaderLoading());
    final ({String userImagePath, String userName}) userData =
        await drawerRepo.getUserData();
    Future.delayed(
      const Duration(microseconds: 5),
      () => emit(DrawerHeaderGetUserData(userData)),
    );
  }
}
