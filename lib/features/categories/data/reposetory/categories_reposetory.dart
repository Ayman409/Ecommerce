// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:crystal_mind/core/errors/failures.dart';
import 'package:crystal_mind/features/categories/data/remote_data_source.dart/categories_remote_data_source.dart';
 

import '../../../../core/utils/shared_app_utils.dart';
import '../models/categories_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, CategoriesModel>> getCategoriesData();
}

class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesRepoImpl({
    required this.categoriesRemoteDataSource,
  });

  @override
  Future<Either<Failure, CategoriesModel>> getCategoriesData() async {
    try {
      final resnseData = await categoriesRemoteDataSource.getCategoriesData();
      if (resnseData['status'] == false) {
        return left(ServerFailure(resnseData['status']));
      }

      return right(CategoriesModel.fromJson(resnseData));
    } on DioException catch (error) {
      return left(SharedAppUtils.getFailureBasedOnError(error));
    } catch (e) {
      return left(UndefinedFailure());
    }
  }
}
