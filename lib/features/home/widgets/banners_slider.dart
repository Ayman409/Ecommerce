
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data/models/home_model.dart';

class BannersSlider extends StatelessWidget {
  const BannersSlider({
    super.key,
    required this.banners,
  });

  final List<Banners>? banners;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banners!
          .map((e) => Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage('${e.image}'),
                      fit: BoxFit.cover,
                    )),
              ))
          .toList(),
      options: CarouselOptions(
        height: 250,
        initialPage: 0,
        viewportFraction: 1.0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
      
      ),
    );
  }
}