// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/category_model.dart';

abstract class CategoriesState {}

class CategoriesInitialSata extends CategoriesState {}

class GetAllCategoriesSuccessState extends CategoriesState {
  List<CategoryModel> categoriesList;
  GetAllCategoriesSuccessState(this.categoriesList);
}

class GetAllCategoriesLoadingState extends CategoriesState {}

class GetAllCategoriesErrorState extends CategoriesState {
  String message;
  GetAllCategoriesErrorState({
    required this.message,
  });
}
