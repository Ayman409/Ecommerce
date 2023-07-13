import 'package:crystal_mind/core/network/remote/dio_helper.dart';

import '../../../../core/utils/constants/endpoints.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> postLoginRequest(
      {required String email, required String password});
  Future<Map<String, dynamic>> postSignUpReques({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
  
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  @override
  Future<Map<String, dynamic>> postLoginRequest(
      {required String email, required String password}) async {
    final response = await DioHelper.postRequest(
      path: kLoginEndPoint,
      data: {
        'email': email,
        'password': password,
      },
    );
    //print(response);
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> postSignUpReques(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    final response = await DioHelper.postRequest(
      path: kLoginEndPoint,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    return response.data as Map<String, dynamic>;
  }

  
}
