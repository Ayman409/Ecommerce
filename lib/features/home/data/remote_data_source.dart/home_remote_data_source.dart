import 'package:crystal_mind/core/network/remote/dio_helper.dart';
import 'package:crystal_mind/core/utils/constants/endpoints.dart';

import '../../../../core/utils/constants/constants.dart';

abstract class HomeRemoteDataSource {
  Future<Map<String, dynamic>> getHomeData();
  Future<Map<String, dynamic>> addOrDeleteFavoritesItems(
      {required int productId});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<Map<String, dynamic>> getHomeData() async {
    final response =
        await DioHelper.getRequest(path: kHomeEndPoint, userToken: token);

    // print(response);
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> addOrDeleteFavoritesItems(
      {required int productId}) async {
    final response = await DioHelper.postRequest(
      path: kFavoriteseEndPoint,
      userToken: token,
      data: {
        'product_id': productId,
      },
    );

    print('success in home remote data source');
    return response.data as Map<String, dynamic>;
  }
}
