 


import '../../favourite/data/models/favourites_model.dart';
import '../data/models/home_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final HomeModel homeModel;
  HomeLoadedSuccessState({
    required this.homeModel,
  });
}

class HomeErrorState extends HomeState {
  final String? errormsg;

  HomeErrorState({this.errormsg});
}

class ChangeFavouriteState extends HomeState {}

class ChangeFavouriteSuccesState extends HomeState {
  final FavoritesModel model ;
  ChangeFavouriteSuccesState({
    required this.model,
  });
}

class ChangeFavouriteErrorState extends HomeState {
  final String? errormsg;

  ChangeFavouriteErrorState({this.errormsg});
}
