import 'package:ecommerce_app/features/cart/domain/entities/cart_details_model.dart';

class CartModel {
  int? numOfCartItems;
  String? cartId;
  CartDetailsModel? cartDetailsModel;
  CartModel({this.cartDetailsModel, this.cartId, this.numOfCartItems});
}
