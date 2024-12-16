import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_model.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteProductFromCartUsecase {
  final CartRepository _cartRepository;

  DeleteProductFromCartUsecase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;
  Future<Either<Failure, CartModel>> call(String productId) =>
      _cartRepository.deleteProductFromCart(productId);
}
