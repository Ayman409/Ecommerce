// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoadingState extends FavouriteState {}

class FavouriteLoadedSuccessState extends FavouriteState {
  final FavoritesModel model;
  FavouriteLoadedSuccessState({
    required this.model,
  });
}

class FavouriteErrorState extends FavouriteState {
  final String failMsg;
  FavouriteErrorState({
    required this.failMsg,
  });
}

// class FavoriteChangeStates extends FavouriteState{
//      final int productId;

// FavoriteChangeStates({required this.productId});
// }
class FavouriteChangedState extends FavouriteState {
  // FavouriteChangedState({
  //   required super.productId,
  // });
}

class ChangeFavouriteSuccesState extends FavouriteState {}

class FavouriteChangedErrorState extends FavouriteState {
  final String failMsg;
  FavouriteChangedErrorState({
    required this.failMsg,
  });
}
