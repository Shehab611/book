part of 'home_cubit.dart';


sealed class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class NavigateToBookDetailsScreen extends HomeState{}

class NavigateToSearchScreen extends HomeState{}