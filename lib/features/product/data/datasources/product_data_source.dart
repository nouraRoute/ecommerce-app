import 'package:ecommerce_app/features/product/data/models/products_list_response.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_parameters.dart';

abstract class ProductDataSource {
  Future<ProductsListResponse> getProductsList(ProductParameters parameters);
}
