import 'package:ecommerce_app/features/cart/data/mapper/cart_details_mapper.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_response.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_model.dart';

extension CartResponseMapper on CartResponse {
  CartModel toEntity() => CartModel(
      cartId: cartId,
      numOfCartItems: numOfCartItems,
      cartDetailsModel: cartDetailsResponse?.toEntity());
}
