import 'package:crystal_mind/core/network/remote/dio_helper.dart';
import 'package:crystal_mind/core/utils/constants/constants.dart';
import 'package:crystal_mind/core/utils/constants/endpoints.dart';

abstract class FavoriteRemoteDataSource {
  Future<Map<String, dynamic>> getFavoritesItems();
  Future<Map<String, dynamic>> addOrDeleteFavoritesItems(
      {required int productId});

}

class FavouriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  @override
  Future<Map<String, dynamic>> getFavoritesItems() async {
    final response =
        await DioHelper.getRequest(path: kFavoriteseEndPoint, userToken: token);
     print('success in favorite remote data source');
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

    print('success change favotite in remote data source');
    return response.data as Map<String, dynamic>;
  }


}
