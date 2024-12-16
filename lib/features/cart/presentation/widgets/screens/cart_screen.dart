import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/utils/ui_utils.dart';
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = BlocProvider.of<CartCubit>(context);
    cubit.getCartDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(
                IconsAssets.icSearch,
              ),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: BlocConsumer<CartCubit, CartState>(
          builder: (context, state) {
            if (state is GetCartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetCartError) {
              return Center(
                child: Text(
                  state.errorMessage,
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  // the list of cart items ===============
                  child: ListView.separated(
                      itemBuilder: (context, index) => CartItemWidget(
                            key: ValueKey(cubit
                                .cart!.cartDetailsModel!.cartItems![index].id),
                            cartItemModel:
                                cubit.cart!.cartDetailsModel!.cartItems![index],
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: AppSize.s12.h),
                      itemCount: (cubit.cart?.cartDetailsModel?.cartItems ?? [])
                          .length),
                ),
                // the total price and checkout button========
                TotalPriceAndCheckoutBotton(
                  totalPrice:
                      (cubit.cart?.cartDetailsModel?.totalCartPrice ?? 0),
                  checkoutButtonOnTap: () {},
                ),
                SizedBox(height: 10.h),
              ],
            );
          },
          listener: (BuildContext context, CartState state) {
            if (state is AddProductLoading ||
                state is UpdateProductQuantityLoading ||
                state is DeleteProductLoading) {
              UIUtils.showLoadingDialog();
            } else if (state is AddProductError ||
                state is UpdateProductQuantityError ||
                state is DeleteProductError) {
              UIUtils.hideDialog();
              UIUtils.showErrorDialog(state is AddProductError
                  ? state.errorMessage
                  : (state is UpdateProductQuantityError)
                      ? state.errorMessage
                      : (state as DeleteProductError).errorMessage);
            } else if (state is AddProductSuccess ||
                state is UpdateProductQuantitySuccess ||
                state is DeleteProductSuccess) {
              UIUtils.hideDialog();
            }
          },
        ),
      ),
    );
  }
}
