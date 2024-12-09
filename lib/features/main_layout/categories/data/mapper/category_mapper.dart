import 'package:ecommerce_app/features/main_layout/categories/data/model/categories_response.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/category_model.dart';

extension CategoryMapper on CategoryResponse {
  CategoryModel categoryResponseToCategoryModel() => CategoryModel(
        id: id,
        name: name,
        slug: slug,
        image: image,
      );
}
