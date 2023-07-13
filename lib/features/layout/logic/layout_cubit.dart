import 'package:bloc/bloc.dart';
import 'package:crystal_mind/features/categories/screens/categories_screen.dart';
import 'package:crystal_mind/features/favourite/screens/favourite_screen.dart';
import 'package:crystal_mind/features/home/screens/home_screnn.dart';
 
import 'package:crystal_mind/features/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';

 


part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentIndex = 0 ; 

  List<Widget> bottomScreens =[
   const HomeScreen(),
   const CategoriesScreen(),
   const FavouriteScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index){
    currentIndex = index ;
    emit(ChangeBottomNavState());
  }
}
