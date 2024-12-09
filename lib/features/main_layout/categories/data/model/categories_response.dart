import 'package:ecommerce_app/core/models/meta_data_response.dart';

class CategoriesListResponse {
  int? results;
  Metadata? metadata;
  List<CategoryResponse>? data;

  CategoriesListResponse({this.results, this.metadata, this.data});

  CategoriesListResponse.fromJson(Map<String, dynamic> json) {
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

  static List<CategoriesListResponse> fromList(
      List<Map<String, dynamic>> list) {
    return list.map(CategoriesListResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["results"] = results;
    if (metadata != null) {
      _data["metadata"] = metadata?.toJson();
    }
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class CategoryResponse {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryResponse(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  static List<CategoryResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CategoryResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["image"] = image;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}
