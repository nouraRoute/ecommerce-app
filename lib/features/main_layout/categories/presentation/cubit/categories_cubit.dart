import 'package:ecommerce_app/features/main_layout/categories/domain/use_case/get_all_categories_usecase.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/categories_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CategoriesCubit extends Cubit<CategoriesState> {
  GetAllCategoriesUsecase _getAllCategoriesUseCase;
  CategoriesCubit(this._getAllCategoriesUseCase)
      : super(CategoriesInitialSata()) {
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoadingState());
    var response = await _getAllCategoriesUseCase();
    response.fold(
      (l) => emit(GetAllCategoriesErrorState(message: l.message)),
      (r) => emit(GetAllCategoriesSuccessState(r)),
    );
  }
}
