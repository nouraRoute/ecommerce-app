// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/api_constants.dart';

import 'package:ecommerce_app/features/product/data/datasources/product_data_source.dart';
import 'package:ecommerce_app/features/product/data/models/products_list_response.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_parameters.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductDataSource)
class ProductRemoteDataSource implements ProductDataSource {
  Dio dio;
  ProductRemoteDataSource({
    required this.dio,
  });
  @override
  Future<ProductsListResponse> getProductsList(
      ProductParameters parameters) async {
    try {
      var response =
          await dio.get(ApiConstants.getProducts, data: parameters.toJson());
      return ProductsListResponse.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data["message"] ?? "not defined dio error";
      }
      throw RemoteException(message: message);
    }
  }
}
