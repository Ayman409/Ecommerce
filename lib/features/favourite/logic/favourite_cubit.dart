import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/favourites_model.dart';
import '../data/reposetory/favorites_reposetory.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit({required this.favoriteRepo}) : super(FavouriteInitial());
  final FavoriteRepo favoriteRepo;

  FavoritesModel? _favoritesModel;
  FavoritesModel? get favoritesModel => _favoritesModel;

  FavoritesModel? _changeFavoriteModel;
  FavoritesModel? get changeFavoriteModel => _changeFavoriteModel;

  Map<dynamic, dynamic> favorites = {};

  getFavoriteData() async {
    emit(FavouriteLoadingState());
    final either = await favoriteRepo.getFavouritesModel();
    either.fold((failure) {
      //print('failed in favorite cubit');
      emit(FavouriteErrorState(failMsg: failure.failureMsg));
      //print('whyyyyyyyy');
    }, (favoriteModel) {
      _favoritesModel = favoriteModel;
      favoritesModel!.data!.favoriteData!.forEach((element) {
        favorites.addAll({
          //ToDo: hereeeeeeeeeeee
          element.product!.id!: element.product!
        });
        print(favorites[favorites.keys.elementAt(0)]);
      });
      // print(_favoritesModel!.data);
//print('success in favorite cubit');
      emit(FavouriteLoadedSuccessState(model: favoriteModel));
    });
  }

    changeFavourite({required Product product}) async {
    //fake delete from favorite
    if (favorites.containsKey(product.id)) favorites.remove(product.id);
    emit(ChangeFavouriteSuccesState());

    final either =
        await favoriteRepo.addOrDeleteFavoritesItems(productId: product.id!);
    either.fold((failure) {
      // if any failed happed return favorite as it was
      emit(FavouriteChangedErrorState(failMsg: failure.failureMsg));
    }, (changeFavoriteModel) {
      _changeFavoriteModel = changeFavoriteModel;

      if (!changeFavoriteModel.status!) {
        // if statues not != true change favorite succes
        favorites.remove(product.id);
      }
     getFavoriteData();
      emit(ChangeFavouriteSuccesState());
    });
  }

  changeFavouriteById({required dynamic productId}) async {
    //fake delete from favorite
    if (favorites.containsKey(productId)) {
      favorites.remove(productId);
    } else {
      favorites.addAll({productId: productId});
    }
    emit(FavouriteChangedState());

    final either =
        await favoriteRepo.addOrDeleteFavoritesItems(productId: productId);
    either.fold((failure) {
      // if any failed happed return favorite as it was
      emit(FavouriteChangedErrorState(failMsg: failure.failureMsg));
    }, (changeFavoriteModel) {
      _changeFavoriteModel = changeFavoriteModel;

      if (!changeFavoriteModel.status!) {
        // if statues not != true change favorite succes
        favorites.remove(productId);
      }
      emit(ChangeFavouriteSuccesState());
    });
  }

  void removeFromFavorite({required int productId}) {
    if (favorites.containsKey(productId)) {
      favorites.remove(productId);
    } else {
      null;
    }
  }
}
