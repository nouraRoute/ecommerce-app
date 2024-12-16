import 'package:ecommerce_app/features/cart/data/mapper/cart_item_mapper.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_response.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_details_model.dart';

extension CartDetailsMapper on CartDetailsResponse {
  CartDetailsModel toEntity() => CartDetailsModel(
      id: id,
      totalCartPrice: totalCartPrice,
      cartItems: (cartItems ?? [])
          .map(
            (e) => e.toEntity(),
          )
          .toList());
}
