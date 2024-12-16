import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_model.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateProductQuantityUsecase {
  final CartRepository _cartRepository;

  UpdateProductQuantityUsecase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;
  Future<Either<Failure, CartModel>> call(String productId, int quantity) =>
      _cartRepository.updateProductQuantity(productId, quantity);
}
