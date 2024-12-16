// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/core/utils/ui_utils.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:ecommerce_app/features/cart/domain/usecases/delete_product_from_cart_usecase.dart';
import 'package:ecommerce_app/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:ecommerce_app/features/cart/domain/usecases/update_product_quantity_usecase.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._getCartUsecase,
    this._addToCartUsecase,
    this._updateProductQuantityUsecase,
    this._deleteProductFromCartUsecase,
  ) : super(CartInitial()) {
    getCartDetails();
  }
  final GetCartUsecase _getCartUsecase;
  final AddToCartUsecase _addToCartUsecase;
  final UpdateProductQuantityUsecase _updateProductQuantityUsecase;
  final DeleteProductFromCartUsecase _deleteProductFromCartUsecase;
  CartModel? cart;
  Future<void> getCartDetails({bool showDialog = false}) async {
    if (showDialog) {
      UIUtils.showLoadingDialog();
    }
    emit(GetCartLoading());
    var response = await _getCartUsecase();
    response.fold((l) => emit(GetCartError(errorMessage: l.message)), (r) {
      cart = r;
      emit(GetCartSuccess());
    });
  }

  Future<void> addProductToCart(
    String productID,
  ) async {
    emit(AddProductLoading());
    var response = await _addToCartUsecase(productID);
    response.fold((l) => emit(AddProductError(errorMessage: l.message)), (r) {
      cart = r;
      emit(AddProductSuccess());
    });
  }

  addProductWithQuantity(String productId, int quantity) async {
    List<CartItemModel> exist = cart?.cartDetailsModel?.cartItems
            ?.where(
              (element) => element.product?.id == productId,
            )
            .toList() ??
        [];
    if (exist.isNotEmpty) {
      await updateProductQuantity(productId, quantity);
    } else {
      await addProductToCart(productId); //1
      if (quantity > 1) {
        await updateProductQuantity(productId, quantity);
      }
    }
  }

  Future<void> deletePRoductFromCart(String productID) async {
    emit(DeleteProductLoading());
    var response = await _deleteProductFromCartUsecase(productID);
    response.fold((l) => emit(DeleteProductError(errorMessage: l.message)),
        (r) {
      cart = r;
      emit(DeleteProductSuccess());
    });
  }

  Future<void> updateProductQuantity(String productId, int quantity) async {
    emit(UpdateProductQuantityLoading());
    var response = await _updateProductQuantityUsecase(productId, quantity);
    response.fold(
        (l) => emit(UpdateProductQuantityError(errorMessage: l.message)), (r) {
      cart = r;
      emit(UpdateProductQuantitySuccess());
    });
  }
}
