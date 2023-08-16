import 'package:book/features/home/data/repositories/home/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  static HomeCubit get(context) => BlocProvider.of(context);



  void navigateToBookDetailsScreen(){
    emit(NavigateToBookDetailsScreen());
  }

  void navigateToSearchScreen(){
    emit(NavigateToSearchScreen());
  }

}
