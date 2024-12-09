import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_model.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_parameters.dart';
import 'package:ecommerce_app/features/product/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetProductsListUsecase {
  ProductRepository productRepository;
  GetProductsListUsecase({
    required this.productRepository,
  });
  Future<Either<Failure, List<ProductModel>>> call(
          ProductParameters parameters) async =>
      productRepository.getProductsList(parameters);
}
