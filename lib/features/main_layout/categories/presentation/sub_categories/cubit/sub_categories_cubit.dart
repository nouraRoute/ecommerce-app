import 'package:ecommerce_app/features/main_layout/categories/domain/use_case/get_sub_categories_usecase.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/sub_categories/cubit/sub_categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit(this._getSubCategoriesUsecase)
      : super(SubCategoriesInitialState());
  GetSubCategoriesUsecase _getSubCategoriesUsecase;
  String selectedCategory = '';
  Future getSubCategories() async {
    emit(GetSubCategoriesLoading());
    var response = await _getSubCategoriesUsecase(selectedCategory);
    response.fold(
      (l) => emit(GetSubCategoriesError(errorMessage: l.message)),
      (r) => emit(GetSubCategoriesSuccess(subcategories: r)),
    );
  }

  updateSelectedCategory(String cateId) {
    selectedCategory = cateId;
    emit(UpdateSelectedCategory());
    getSubCategories();
  }
}
