import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_model.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_parameters.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getProductsList(
      ProductParameters parameters);
}
