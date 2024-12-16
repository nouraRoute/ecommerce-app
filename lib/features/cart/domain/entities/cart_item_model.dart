import 'package:ecommerce_app/features/product/domain/entities/product_model.dart';

class CartItemModel {
  int? count;
  String? id;
  ProductModel? product;
  int? price;
  CartItemModel({this.count, this.id, this.price, this.product});
}
