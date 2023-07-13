import 'package:crystal_mind/features/home/logic/home_cubit.dart';

import '/dependency_injection/injection_container.dart' as main_sl;
import 'data/remote_data_source.dart/home_remote_data_source.dart';
import 'data/reposetory/home_reposetory.dart';
 


void init(){

 main_sl.get.registerFactory(() => HomeCubit(homeRepo: main_sl.get()));

  /// Register Repos
  main_sl.get.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(
        homeRemoteDataSource: main_sl.get(),
      ));

  /// Register Data Sources
  main_sl.get.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());


}