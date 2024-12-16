import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/cart/data/datasources/cart_data_source.dart';
import 'package:ecommerce_app/features/cart/data/mapper/cart_response_mapper.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_response.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_model.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartDataSource _cartDataSource;

  CartRepositoryImpl({required CartDataSource cartDataSource})
      : _cartDataSource = cartDataSource;
  @override
  Future<Either<Failure, CartModel>> addToCart(String productID) async {
    try {
      CartResponse response = await _cartDataSource.addToCart(productID);
      return Right(response.toEntity());
    } on AppExceptions catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, CartModel>> deleteProductFromCart(
      String productId) async {
    try {
      CartResponse response =
          await _cartDataSource.deleteProductFromCart(productId);
      return Right(response.toEntity());
    } on AppExceptions catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    try {
      CartResponse response = await _cartDataSource.getCart();
      return Right(response.toEntity());
    } on AppExceptions catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, CartModel>> updateProductQuantity(
      String productId, int quantity) async {
    try {
      CartResponse response =
          await _cartDataSource.updateProductQuantity(productId, quantity);
      return Right(response.toEntity());
    } on AppExceptions catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
