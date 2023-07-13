
 
import 'package:crystal_mind/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../categories/logic/categories_cubit.dart';
import '../../categories/widgets/categories_item_kind.dart';

import '../../search/screens/search_screen.dart';

 
import '../logic/home_state.dart';
import '../widgets/banners_slider.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.routeName);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is ChangeFavouriteErrorState) {
            Fluttertoast.showToast(
                msg: state.errormsg!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          if (context.read<HomeCubit>().homeModel != null) {
            final homeCubit = context.read<HomeCubit>();
            final homeData = homeCubit.homeModel!.data;
            final banners = homeData!.banners;
            final products = homeData.products;

            final categoriesCubit = context.read<CategoriesCubit>();
            final categoriesData = categoriesCubit.categoriesModel!.data!.data!;

            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BannersSlider(banners: banners),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 100,
                      child: CategoriesKinds(categoriesData: categoriesData),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'New Home',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    ProductItem(products: products)
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
