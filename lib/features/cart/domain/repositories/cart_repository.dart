import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_model.dart';

abstract class CartRepository {
  Future<Either<Failure, CartModel>> getCart();
  Future<Either<Failure, CartModel>> updateProductQuantity(
      String productId, int quantity);
  Future<Either<Failure, CartModel>> addToCart(String productID);
  Future<Either<Failure, CartModel>> deleteProductFromCart(String productId);
}
