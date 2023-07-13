import 'package:crystal_mind/features/favourite/data/remote_data_source/favorite_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/shared_app_utils.dart';
import '../models/favourites_model.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, FavoritesModel>> getFavouritesModel();
   Future<Either<Failure, FavoritesModel>> addOrDeleteFavoritesItems(
      {required int productId});
}

class FavouriteRepoImpl implements FavoriteRepo {
  FavoriteRemoteDataSource favoriteRemoteDataSource;
  FavouriteRepoImpl({
    required this.favoriteRemoteDataSource,
  });
  @override
  Future<Either<Failure, FavoritesModel>> getFavouritesModel() async {
    try {
      final responseData = await favoriteRemoteDataSource.getFavoritesItems();
      if (responseData['status'] == 'false') {
         print('failed in favorite repo');
        return left(ServerFailure(responseData['status']));
      }
      print('success in favorite repo');
      return right(FavoritesModel.fromJson(responseData));
    } on DioException catch (error) {
       print(error);
      return left(SharedAppUtils.getFailureBasedOnError(error));
    } catch (e) {
      print(e);
      return left(UndefinedFailure());
    }
  }
  
  @override
  Future<Either<Failure, FavoritesModel>> addOrDeleteFavoritesItems({required int productId}) async{
    try {
      final responseData = await favoriteRemoteDataSource
          .addOrDeleteFavoritesItems(productId: productId);

      if (responseData['status'] != true) {
         print('failed in favotite repo');
        return left(UndefinedFailure(responseData['message']));
      }
        print('success cahnge favotite in repo');
        print(responseData);
      return right(FavoritesModel.fromJson(responseData));
    } on DioException catch (error) {
      return left(SharedAppUtils.getFailureBasedOnError(error));
    } catch (e) {
      print(e);
      return left(UndefinedFailure());
    }
  }
  }

