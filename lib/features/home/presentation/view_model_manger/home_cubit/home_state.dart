part of 'home_cubit.dart';


sealed class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class CheckOnData extends HomeState{
  const CheckOnData();
}

class NavigateToSearchScreen extends HomeState {
  const NavigateToSearchScreen();
}