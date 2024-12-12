import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_parameters.dart';
import 'package:ecommerce_app/features/product/domain/usecases/get_products_list_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product_model.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._getProductsListUsecase) : super(ProductInitial());
  int quantity = 1;
  final GetProductsListUsecase _getProductsListUsecase;
  getAllProducts(ProductParameters parameters) async {
    emit(GetProductsListLoading());
    var response = await _getProductsListUsecase(parameters);
    response.fold(
      (l) => emit(GetProductsListError(l.message)),
      (r) => emit(GetProductsListSuccess(r)),
    );
  }

  updateQuintet(int _quantity) {
    quantity = _quantity;
    emit(UpdateQuantity());
  }
}
