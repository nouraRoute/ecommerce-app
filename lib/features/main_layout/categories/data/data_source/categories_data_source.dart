import 'package:ecommerce_app/features/main_layout/categories/data/model/categories_response.dart';

abstract class CategoriesDataSource {
  Future<CategoriesListResponse> getAllCategories();
}
