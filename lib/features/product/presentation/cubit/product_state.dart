part of 'product_cubit.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class UpdateQuantity extends ProductState {}

class GetProductsListSuccess extends ProductState {
  List<ProductModel> products;
  GetProductsListSuccess(this.products);
}

class GetProductsListLoading extends ProductState {}

class GetProductsListError extends ProductState {
  String errorMessage;
  GetProductsListError(this.errorMessage);
}
