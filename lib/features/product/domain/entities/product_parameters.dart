class ProductParameters {
  int? limit;
  String? sort;
  int? page;
  String? keyword;
  String? brand;
  String? categoryId;
  String? price;
  ProductParameters({
    this.limit,
    this.sort,
    this.page,
    this.keyword,
    this.brand,
    this.categoryId,
    this.price,
  });
  Map<String, dynamic> toJson() {
    return {
      if (limit != null) "limit": limit,
      if (sort != null) "sort": sort,
      if (page != null) "page": page,
      if (keyword != null) "keyword": keyword,
      if (brand != null) "brand": brand,
      if (categoryId != null) "category": categoryId,
      if (price != null) "price": price,
    };
  }
}
