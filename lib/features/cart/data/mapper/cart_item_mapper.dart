import 'package:ecommerce_app/features/cart/data/models/cart_response.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_item_model.dart';
import 'package:ecommerce_app/features/product/data/mapper/product_response_mapper.dart';

extension CartItemMapper on CartItemResponse {
  CartItemModel toEntity() => CartItemModel(
      count: count, id: id, price: price, product: product?.toEntity());
}
