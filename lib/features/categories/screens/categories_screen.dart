import 'package:crystal_mind/features/categories/logic/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  static const routeName = '/categories-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        final categoriesubit = context.read<CategoriesCubit>();
        final categoriesData = categoriesubit.categoriesModel!.data!.data!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
          child: Column(
            children: [
              ListView.builder(
                itemCount: categoriesData.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical, 
                itemBuilder: (context, index) => Card(
                  
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 90,
                        child: Image.network(categoriesData[index].image!),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        categoriesData[index].name!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
