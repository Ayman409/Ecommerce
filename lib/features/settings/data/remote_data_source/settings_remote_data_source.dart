import '../../../../core/network/remote/dio_helper.dart';
import '../../../../core/utils/constants/endpoints.dart';

abstract class SettingsRemoteDataSource {
  Future<Map<String, dynamic>> getUserData();
}


@override
  Future<Map<String, dynamic>> getUserData() async {
    final response = await DioHelper.getRequest(path: kProfileEndPoint);
    print(response.data);
     print('success in remote data source while getting user data');
    // print(response);
    return response.data as Map<String, dynamic>;
  }