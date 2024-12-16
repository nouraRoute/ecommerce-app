import 'package:ecommerce_app/features/cart/data/models/cart_response.dart';

abstract class CartDataSource {
  Future<CartResponse> getCart();
  Future<CartResponse> deleteProductFromCart(String productID);
  Future<CartResponse> addToCart(String productID);
  Future<CartResponse> updateProductQuantity(String productID, int quantity);
}
