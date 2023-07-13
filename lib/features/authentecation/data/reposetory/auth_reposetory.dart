import 'package:crystal_mind/core/errors/failures.dart';
import 'package:crystal_mind/features/authentecation/data/remote_data_source/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/shared_app_utils.dart';
import '../models/login_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> logUserIn(
      {required String email, required password});
  Future<Either<Failure, LoginModel>> signUserUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
 
}

class AuthRepoImp implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImp({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, LoginModel>> logUserIn(
      {required String email, required password}) async {
    try {
      final responseData = await authRemoteDataSource.postLoginRequest(
          email: email, password: password);

      if (responseData['status'] == 'false') {
        return left(UndefinedFailure(responseData['message']));
      }

      return right(LoginModel.fromJson(responseData));
    } on DioException catch (error) {
      
      return left(SharedAppUtils.getFailureBasedOnError(error));
    } catch (e) {
       
      return left(UndefinedFailure());
    }
  }

  @override
  Future<Either<Failure, LoginModel>> signUserUp(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    try {
      final responseData = await authRemoteDataSource.postSignUpReques(
          name: name, email: email, password: password, phone: phone);

      if (responseData['status'] != 'true') {
        return left(UndefinedFailure(responseData['message']));
      }

      return right(LoginModel.fromJson(responseData));
    } on DioException catch (error) {
      return left(SharedAppUtils.getFailureBasedOnError(error));
    } catch (e) {
      return left(UndefinedFailure());
    }
  }
  
  }

