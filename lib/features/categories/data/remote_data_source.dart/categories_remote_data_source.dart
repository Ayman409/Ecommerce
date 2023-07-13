import 'package:crystal_mind/core/network/remote/dio_helper.dart';
import 'package:crystal_mind/core/utils/constants/endpoints.dart';

abstract class CategoriesRemoteDataSource {
  Future<Map<String, dynamic>> getCategoriesData();
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  @override
  Future<Map<String, dynamic>> getCategoriesData() async {
    final response = await DioHelper.getRequest(path: kCategoriesEndPoint);
    print(response.data);

    // print(response);
    return response.data as Map<String, dynamic>;
  }
}
