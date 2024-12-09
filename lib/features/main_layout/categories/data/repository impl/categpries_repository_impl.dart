import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/categories_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/mapper/category_mapper.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/model/categories_response.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/category_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesDataSource categoriesDataSource;
  CategoriesRepositoryImpl({
    required this.categoriesDataSource,
  });
  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      CategoriesListResponse categories =
          await categoriesDataSource.getAllCategories();
      return right((categories.data ?? [])
          .map(
            (e) => e.categoryResponseToCategoryModel(),
          )
          .toList());
    } on AppExceptions catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
