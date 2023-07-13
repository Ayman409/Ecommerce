import '/dependency_injection/injection_container.dart' as main_sl;
import 'package:crystal_mind/features/authentecation/logic/auth_cubit.dart';
import 'data/remote_data_source/auth_remote_data_source.dart';
import 'data/reposetory/auth_reposetory.dart';


void init(){

  main_sl.get.registerFactory(() => AuthCubit(authRepo: main_sl.get()));


    /// Register Repos
  main_sl.get.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(authRemoteDataSource: main_sl.get()));

  /// Register APIS
  main_sl.get.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp());


}