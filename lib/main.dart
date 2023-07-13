import 'package:crystal_mind/features/categories/data/remote_data_source.dart/categories_remote_data_source.dart';
import 'package:crystal_mind/features/categories/data/reposetory/categories_reposetory.dart';
import 'package:crystal_mind/features/categories/logic/categories_cubit.dart';
import 'package:crystal_mind/features/favourite/data/remote_data_source/favorite_remote_data_source.dart';
import 'package:crystal_mind/features/favourite/data/reposetory/favorites_reposetory.dart';
import 'package:crystal_mind/features/favourite/logic/favourite_cubit.dart';
import 'package:crystal_mind/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crystal_mind/features/authentecation/logic/auth_cubit.dart';
import 'package:crystal_mind/features/categories/screens/categories_screen.dart';
import 'package:crystal_mind/features/favourite/screens/favourite_screen.dart';
import 'package:crystal_mind/features/layout/logic/layout_cubit.dart';

import 'package:crystal_mind/features/search/screens/search_screen.dart';
import 'package:crystal_mind/features/settings/screens/settings_screen.dart';

import 'core/network/local/shared_pref_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'core/styles/themes.dart';
import 'core/utils/constants/constants.dart';
import 'dependency_injection/injection_container.dart' as di;

import 'features/authentecation/screens/login_screen.dart';
import 'features/authentecation/screens/signup_screen.dart';

import 'features/home/screens/home_screnn.dart';
import 'features/layout/app_layout.dart';

 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  di.init();
  await SharedPrefHelper.init();
  token = SharedPrefHelper.getData(key: 'token').toString();
  print(token);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => di.get<AuthCubit>(),
        ),
        BlocProvider<LayoutCubit>(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => di.get<HomeCubit>()..getHomeData(),
          lazy: true,
        ),
        BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit(
              categoriesRepo: CategoriesRepoImpl(
                  categoriesRemoteDataSource: CategoriesRemoteDataSourceImpl()))
            ..getCategoriesData(),
          lazy: false,
        ),
        BlocProvider<FavouriteCubit>(
          create: (context) => FavouriteCubit(
            favoriteRepo: FavouriteRepoImpl(
              favoriteRemoteDataSource: FavouriteRemoteDataSourceImpl(),
            ),
          )..getFavoriteData(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        //  home: SharedPrefHelper.getData(key: 'isLoggedIn') == true ? const AppLayout() : LoginScreen(),
        initialRoute: SharedPrefHelper.getData(key: 'token') != null
            ? AppLayout.routeName
            : LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          AppLayout.routeName: (context) => const AppLayout(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          CategoriesScreen.routeName: (context) => const CategoriesScreen(),
          FavouriteScreen.routeName: (context) => const FavouriteScreen(),
          SettingsScreen.routeName: (context) => SettingsScreen(),
          SearchScreen.routeName: (context) => const SearchScreen(),
        },
      ),
    );
  }
}
