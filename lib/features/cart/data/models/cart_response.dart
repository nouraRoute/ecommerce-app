import 'package:ecommerce_app/features/product/data/models/products_list_response.dart';

class CartResponse {
  String? status;
  int? numOfCartItems;
  String? cartId;
  CartDetailsResponse? cartDetailsResponse;

  CartResponse(
      {this.status,
      this.numOfCartItems,
      this.cartId,
      this.cartDetailsResponse});

  CartResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["numOfCartItems"] is int) {
      numOfCartItems = json["numOfCartItems"];
    }
    if (json["cartId"] is String) {
      cartId = json["cartId"];
    }
    if (json["data"] is Map) {
      cartDetailsResponse = json["data"] == null
          ? null
          : CartDetailsResponse.fromJson(json["data"]);
    }
  }

  static List<CartResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartResponse.fromJson).toList();
  }
}

class CartDetailsResponse {
  String? id;
  int? totalCartPrice;

  List<CartItemResponse>? cartItems;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? cartOwner;
  CartDetailsResponse(
      {this.id,
      this.cartOwner,
      this.cartItems,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice});

  CartDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["cartOwner"] is String) {
      cartOwner = json["cartOwner"];
    }
    if (json["products"] is List) {
      cartItems = json["products"] == null
          ? null
          : (json["products"] as List)
              .map((e) => CartItemResponse.fromJson(e))
              .toList();
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
    if (json["totalCartPrice"] is int) {
      totalCartPrice = json["totalCartPrice"];
    }
  }

  static List<CartDetailsResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartDetailsResponse.fromJson).toList();
  }
}

class CartItemResponse {
  int? count;
  String? id;
  ProductResponse? product;
  int? price;

  CartItemResponse({this.count, this.id, this.product, this.price});

  CartItemResponse.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["product"] is Map) {
      product = json["product"] == null
          ? null
          : ProductResponse.fromJson(json["product"]);
    }
    if (json["price"] is int) {
      price = json["price"];
    }
  }

  static List<CartItemResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartItemResponse.fromJson).toList();
  }
}
