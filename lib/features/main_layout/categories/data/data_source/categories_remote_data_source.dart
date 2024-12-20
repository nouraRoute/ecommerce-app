import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/api_constants.dart';

import 'package:ecommerce_app/features/main_layout/categories/data/data_source/categories_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/model/categories_response.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/model/sub_categories_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoriesDataSource)
class CategoriesRemoteDataSource implements CategoriesDataSource {
  Dio dio;
  CategoriesRemoteDataSource({
    required this.dio,
  });
  @override
  Future<CategoriesListResponse> getAllCategories() async {
    try {
      var response = await dio.get(ApiConstants.getAllCategories);
      return CategoriesListResponse.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data["message"] ?? "not defined dio error";
      }
      throw RemoteException(message: message);
    }
  }

  @override
  Future<SubCategoriesResponse> getSubCategories(String id) async {
    try {
      var response =
          await dio.get("${ApiConstants.getAllCategories}/$id/subcategories");
      return SubCategoriesResponse.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data["message"] ?? "not defined dio error";
      }
      throw RemoteException(message: message);
    }
  }
}
