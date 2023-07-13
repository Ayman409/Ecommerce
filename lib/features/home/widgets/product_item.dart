import 'package:crystal_mind/features/favourite/logic/favourite_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles/colors.dart';
import '../data/models/home_model.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.products,
  });

  final List<Products>? products;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 6,
      crossAxisSpacing: 4,
      childAspectRatio: 1 / 1.6,
      children: List.generate(
          widget.products!.length,
          (index) => Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image(
                            image: NetworkImage(
                              widget.products![index].image!,
                            ),
                            width: double.infinity,
                            height: 200,
                          ),
                          if (widget.products![index].discount != 0)
                            CustomPaint(
                              painter: TapePainter(),
                              child: const Center(
                                child: Text(
                                  'Discount',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          widget.products![index].name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${widget.products![index].price!.round()}\$',
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
                          if (widget.products![index].discount != 0)
                            Text(
                              '${widget.products![index].oldPrice!.round()}\$',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: greyColor,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          const Spacer(),
                          BlocBuilder<FavouriteCubit, FavouriteState>(
                            builder: (context, state) {
                                  
                            return IconButton(
                                icon: Icon(
                                 Icons.favorite,
                                  color: context
                                          .read<FavouriteCubit>()
                                          .favorites
                                          .containsKey(
                                              widget.products![index].id)
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                onPressed: () async {
                                  await context
                                      .read<FavouriteCubit>()
                                      .changeFavouriteById(
                                          productId:
                                              widget.products![index].id!);
                                  // setState(() {});
                                  // ignore: use_build_context_synchronously
                                  // context.read<FavouriteCubit>().removeFromFavorite(
                                  //     productId: widget.products![index].id!);
                                  // ignore: use_build_context_synchronously
                                  context
                                      .read<FavouriteCubit>()
                                      .getFavoriteData();
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}

class TapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 20, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
