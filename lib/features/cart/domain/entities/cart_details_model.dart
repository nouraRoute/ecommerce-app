import 'package:ecommerce_app/features/cart/domain/entities/cart_item_model.dart';

class CartDetailsModel {
  String? id;
  int? totalCartPrice;

  List<CartItemModel>? cartItems;
  CartDetailsModel({this.cartItems, this.id, this.totalCartPrice});
}
