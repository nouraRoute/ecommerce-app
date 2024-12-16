import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';

import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/product/data/datasources/product_data_source.dart';
import 'package:ecommerce_app/features/product/data/mapper/product_response_mapper.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_model.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_parameters.dart';
import 'package:ecommerce_app/features/product/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductDataSource productDataSource;
  ProductRepositoryImpl({
    required this.productDataSource,
  });
  @override
  Future<Either<Failure, List<ProductModel>>> getProductsList(
      ProductParameters parameters) async {
    try {
      var response = await productDataSource.getProductsList(parameters);
      return right((response.productsList ?? [])
          .map(
            (e) => e.toEntity(),
          )
          .toList());
    } on AppExceptions catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
