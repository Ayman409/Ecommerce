 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles/colors.dart';
import '../../home/logic/home_cubit.dart';
import '../data/models/favourites_model.dart';
import '../logic/favourite_cubit.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});
  static const routeName = '/favourite-screen';

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    //context.read<FavouriteCubit>().getFavoriteData();
  }

  bool isChangeFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (context.read<FavouriteCubit>().favoritesModel != null) {
          final favoriteCubit = context.read<FavouriteCubit>();
          final favoriteData = favoriteCubit.favoritesModel!.data!.favoriteData;
          final favoriteMap = favoriteCubit.favorites;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: favoriteMap.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      int productId = favoriteMap.keys.elementAt(index);
                      Product product = favoriteMap[productId]!;
                      return Card(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 90,
                              child: Image.network(product.image!),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${product.price}\$',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.blue.shade800),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${product.oldPrice}\$',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: greyColor,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(Icons.favorite,
                                            color: Colors.red),
                                        onPressed: () async {
                                          favoriteCubit.changeFavourite(
                                              product: favoriteData![index].product!);
                                         await context
                                              .read<HomeCubit>()
                                              .getHomeData();
                                          // await  context.read<HomeCubit>().getHomeData();
                                          // await context
                                          //     .read<HomeCubit>()
                                          //     .changeFavourite(
                                          //         productId: favoriteData[index]
                                          //             .product!
                                          //             .id!);

                                         
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
