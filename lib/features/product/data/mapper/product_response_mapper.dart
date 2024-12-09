import 'package:ecommerce_app/features/product/data/models/products_list_response.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_model.dart';

extension ProductResponseMapper on ProductResponse {
  ProductModel productResponseToProductModel() => ProductModel(
        description: description,
        id: id,
        imageCover: imageCover,
        images: images,
        price: price,
        ratingsAverage: ratingsAverage,
        ratingsQuantity: ratingsQuantity,
        sold: sold,
        title: title,
      );
}
