import 'package:book/core/utils/app_router.dart';
import 'package:book/features/home/data/repositories/home/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  static HomeCubit get(context) => BlocProvider.of(context);



  void navigateToBookDetailsScreen(){
    emit(NavigateToBookDetailsScreen());
  }

  void navigateToSearchScreen(BuildContext context){
    emit(NavigateToSearchScreen());
   Navigator.pushNamed(context, AppRouter.kSearchScreen);
  }

}
