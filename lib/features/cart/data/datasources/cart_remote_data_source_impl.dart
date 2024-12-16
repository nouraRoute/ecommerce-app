import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/api_constants.dart';
import 'package:ecommerce_app/features/cart/data/datasources/cart_data_source.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartDataSource)
class CartRemoteDataSourceImpl implements CartDataSource {
  final Dio _dio;

  CartRemoteDataSourceImpl({required Dio dio}) : _dio = dio;
  @override
  Future<CartResponse> addToCart(String productId) async {
    try {
      var response = await _dio
          .post(ApiConstants.cartEndPoint, data: {"productId": productId});
      return CartResponse.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data is Map
            ? e.response!.data['message']
            : 'some thing went wrong';
      }
      throw RemoteException(message: message);
    }
  }

  @override
  Future<CartResponse> deleteProductFromCart(String productID) async {
    try {
      var response =
          await _dio.delete("${ApiConstants.cartEndPoint}/$productID");
      return CartResponse.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data is Map
            ? e.response!.data['message']
            : 'some thing went wrong';
      }
      throw RemoteException(message: message);
    }
  }

  @override
  Future<CartResponse> getCart() async {
    try {
      var response = await _dio.get(ApiConstants.cartEndPoint);
      return CartResponse.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data is Map
            ? e.response!.data['message']
            : 'some thing went wrong';
      }
      throw RemoteException(message: message);
    }
  }

  @override
  Future<CartResponse> updateProductQuantity(
      String productID, int quantity) async {
    try {
      var response = await _dio.put("${ApiConstants.cartEndPoint}/$productID",
          data: {"count": quantity});
      return CartResponse.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data is Map
            ? e.response!.data['message']
            : 'some thing went wrong';
      }
      throw RemoteException(message: message);
    }
  }
}
