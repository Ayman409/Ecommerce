import 'package:flutter/material.dart';

import '../data/models/categories_model.dart';

class CategoriesKinds extends StatelessWidget {
  const CategoriesKinds({
    super.key,
    required this.categoriesData,
  });

  final List<CategoriesData> categoriesData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemBuilder: (context, index) => Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                    categoriesData[index].image!),
                Container(
                  color: Colors.black.withOpacity(0.8),
                  alignment: Alignment.center,
                  width: 100,
                  height: 25,
                  child:  Text(
                   categoriesData[index].name!,
                   overflow:TextOverflow.ellipsis ,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      itemCount: categoriesData.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
