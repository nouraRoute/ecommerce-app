// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/category_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetSubCategoriesUsecase {
  CategoriesRepository categoriesRepository;
  GetSubCategoriesUsecase({
    required this.categoriesRepository,
  });
  Future<Either<Failure, List<CategoryModel>>> call(String id) =>
      categoriesRepository.getSubCategories(id);
}
