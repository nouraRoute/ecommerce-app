import 'package:ecommerce_app/core/models/meta_data_response.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/model/categories_response.dart';

class SubCategoriesResponse {
  int? results;
  Metadata? metadata;
  List<CategoryResponse>? data;

  SubCategoriesResponse({this.results, this.metadata, this.data});

  SubCategoriesResponse.fromJson(Map<String, dynamic> json) {
    if (json["results"] is int) {
      results = json["results"];
    }
    if (json["metadata"] is Map) {
      metadata =
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => CategoryResponse.fromJson(e))
              .toList();
    }
  }

  static List<SubCategoriesResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(SubCategoriesResponse.fromJson).toList();
  }
}
