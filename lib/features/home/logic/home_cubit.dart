

import 'package:crystal_mind/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../favourite/data/models/favourites_model.dart';
import '../data/models/home_model.dart';
import '../data/reposetory/home_reposetory.dart';
 

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  final HomeRepo homeRepo;
  HomeModel? _homeModel;
  HomeModel? get homeModel => _homeModel;

  FavoritesModel? _changeFavoriteModel;
  FavoritesModel? get changeFavoriteModel => _changeFavoriteModel;
   bool isInfavorite = false;
  Map<int, bool> favorites = {};
  
 Future<void> getHomeData() async {
    emit(HomeLoadingState());
    final either = await homeRepo.getHomeModel();
    either.fold((failure) {
      emit(HomeErrorState(errormsg: failure.failureMsg));
    }, (homeModel) {
      _homeModel = homeModel as HomeModel?;
      
      homeModel.data!.products!.forEach((element) {
        favorites.addAll(
          {
            element.id!: element.inFavorites!,
          },
        );
      });
      emit(HomeLoadedSuccessState(homeModel: homeModel));
    });
  }

   changeFavourite({required int productId}) async {
    //fake reverse for favorite
    favorites[productId] = !favorites[productId]!;
    emit(ChangeFavouriteState());
    
    final either =
        await homeRepo.addOrDeleteFavoritesItems(productId: productId);
    either.fold((failure) {
      // if any failed happed return favorite as it was
      favorites[productId] = !favorites[productId]!;
     
      emit(ChangeFavouriteErrorState(errormsg: failure.failureMsg));
    }, (changeFavoriteModel) {
      _changeFavoriteModel = changeFavoriteModel;

      if (!changeFavoriteModel.status!) {
        // if statues not != true change favorite succes 
        favorites[productId] = !favorites[productId]!;
      } 
      emit(ChangeFavouriteSuccesState(model:changeFavoriteModel ));
    });
  }
}
