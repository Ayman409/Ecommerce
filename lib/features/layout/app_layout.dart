import 'package:crystal_mind/features/layout/logic/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});
  static const routeName = '/appLayout-screen';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var layoutCubit = context.read<LayoutCubit>();
        return Scaffold(
          // appBar: AppBar(
          //   title: const Text('Ecommerce App'),
          // ),
          body: layoutCubit.bottomScreens[layoutCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => layoutCubit.changeBottom(index),
            currentIndex: layoutCubit.currentIndex,
            selectedItemColor: Colors.blueAccent.shade200,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.shifting,
            selectedFontSize: 14.0, // Set the font size of the selected item

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
