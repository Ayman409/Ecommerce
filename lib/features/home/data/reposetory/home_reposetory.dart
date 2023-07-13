// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crystal_mind/features/home/data/models/home_model.dart';
import 'package:crystal_mind/features/home/data/remote_data_source.dart/home_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import 'package:crystal_mind/core/errors/failures.dart';
 
import 'package:dio/dio.dart';

import '../../../../core/utils/shared_app_utils.dart';
import '../../../favourite/data/models/favourites_model.dart';
 

abstract class HomeRepo {
  Future<Either<Failure, HomeModel>> getHomeModel();
    Future<Either<Failure, FavoritesModel>> addOrDeleteFavoritesItems(
      {required int productId});
}

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({
    required this.homeRemoteDataSource,
  });
  @override
  Future<Either<Failure, HomeModel>> getHomeModel() async {
    try {
      final resnseData = await homeRemoteDataSource.getHomeData();
      if (resnseData['status'] == false) {
        return left(ServerFailure(resnseData['status']));
      }
     
      return right(HomeModel.fromJson(resnseData));
    } on DioException catch (error) {
      
      return left(SharedAppUtils.getFailureBasedOnError(error));
    } catch (e) {
       
      return left(UndefinedFailure());
      
    }
  }
   @override
  Future<Either<Failure, FavoritesModel>> addOrDeleteFavoritesItems(
      {required int productId}) async {
    try {
      final responseData = await homeRemoteDataSource
          .addOrDeleteFavoritesItems(productId: productId);

      if (responseData['status'] != true) {
         print('failed in favotite repo');
        return left(UndefinedFailure(responseData['message']));
      }
        print('success in favotite repo');
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
