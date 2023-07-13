part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedSuccessState extends CategoriesState {}

class CategoriesErrorState extends CategoriesState {
  final String? errormsg ;

  CategoriesErrorState({this.errormsg});
}
