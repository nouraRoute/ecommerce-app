import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/category_model.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
}
