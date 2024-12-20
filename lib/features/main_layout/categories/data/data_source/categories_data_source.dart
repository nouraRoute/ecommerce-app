import 'package:ecommerce_app/features/main_layout/categories/data/model/categories_response.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/model/sub_categories_response.dart';

abstract class CategoriesDataSource {
  Future<CategoriesListResponse> getAllCategories();
  Future<SubCategoriesResponse> getSubCategories(String id);
}
