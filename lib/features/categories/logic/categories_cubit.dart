import 'package:bloc/bloc.dart';
import 'package:crystal_mind/features/categories/data/models/categories_model.dart';
import 'package:crystal_mind/features/categories/data/reposetory/categories_reposetory.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.categoriesRepo}) : super(CategoriesInitial());
  final CategoriesRepo categoriesRepo;
  CategoriesModel? _categoriesModel;
  CategoriesModel? get categoriesModel => _categoriesModel;
 
  void getCategoriesData() async {
    emit(CategoriesLoadingState());
    final either = await categoriesRepo.getCategoriesData();
    either.fold((failure) {
      emit(CategoriesErrorState(errormsg: failure.failureMsg));
    }, (categoryModel) {
      _categoriesModel = categoryModel;
      
      emit(CategoriesLoadedSuccessState());
    });
  }

}
