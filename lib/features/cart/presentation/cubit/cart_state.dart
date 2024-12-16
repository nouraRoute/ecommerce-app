part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class GetCartSuccess extends CartState {}

class GetCartError extends CartState {
  final String errorMessage;

  GetCartError({required this.errorMessage});
}

class GetCartLoading extends CartState {}

//////////
///
class AddProductSuccess extends CartState {}

class AddProductError extends CartState {
  final String errorMessage;

  AddProductError({required this.errorMessage});
}

class AddProductLoading extends CartState {}

////////////
class DeleteProductSuccess extends CartState {}

class DeleteProductError extends CartState {
  final String errorMessage;

  DeleteProductError({required this.errorMessage});
}

class DeleteProductLoading extends CartState {}

////////
class UpdateProductQuantitySuccess extends CartState {}

class UpdateProductQuantityError extends CartState {
  final String errorMessage;

  UpdateProductQuantityError({required this.errorMessage});
}

class UpdateProductQuantityLoading extends CartState {}
