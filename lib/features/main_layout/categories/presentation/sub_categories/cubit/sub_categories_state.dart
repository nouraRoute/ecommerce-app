// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/category_model.dart';

abstract class SubCategoriesState {}

class SubCategoriesInitialState extends SubCategoriesState {}

class GetSubCategoriesSuccess extends SubCategoriesState {
  List<CategoryModel> subcategories;
  GetSubCategoriesSuccess({
    required this.subcategories,
  });
}

class GetSubCategoriesError extends SubCategoriesState {
  final String errorMessage;

  GetSubCategoriesError({required this.errorMessage});
}

class GetSubCategoriesLoading extends SubCategoriesState {}

class UpdateSelectedCategory extends SubCategoriesState {}
