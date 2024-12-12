import 'package:ecommerce_app/core/di/service_locatop.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_model.dart';
import 'package:ecommerce_app/features/product/presentation/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/product/presentation/product_details/widgets/product_description.dart';
import 'package:ecommerce_app/features/product/presentation/product_details/widgets/product_item.dart';
import 'package:ecommerce_app/features/product/presentation/product_details/widgets/product_label.dart';
import 'package:ecommerce_app/features/product/presentation/product_details/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product/presentation/product_details/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductCubit productCubit = serviceLocator.get<ProductCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productCubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Product Details',
            style: getMediumStyle(color: ColorManager.appBarTitleColor)
                .copyWith(fontSize: 20.sp),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage(IconsAssets.icSearch),
                  color: ColorManager.primary,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorManager.primary,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ProductSlider(
                  items: (widget.productModel.images ?? [])
                      .map(
                        (e) => ProductItem(
                          imageUrl: e,
                        ),
                      )
                      .toList(),
                  initialIndex: 0),
              SizedBox(
                height: 24.h,
              ),
              ProductLabel(
                  productName: widget.productModel.title ?? "",
                  productPrice: 'EGP ${widget.productModel.price ?? ""}'),
              SizedBox(
                height: 16.h,
              ),
              ProductRating(
                  productBuyers: (widget.productModel.sold ?? 0).toString(),
                  productRating:
                      '${widget.productModel.ratingsAverage ?? ""} (${widget.productModel.ratingsQuantity ?? ""})'),
              SizedBox(
                height: 16.h,
              ),
              ProductDescription(
                  productDescription: widget.productModel.description ?? ""),
              SizedBox(
                height: 48.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total price',
                        style: getMediumStyle(
                                color: ColorManager.primary.withOpacity(.6))
                            .copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      if (widget.productModel.price != null)
                        BlocBuilder<ProductCubit, ProductState>(
                          builder: (context, state) {
                            var cubit = BlocProvider.of<ProductCubit>(context);
                            return Text(
                                'EGP ${widget.productModel.price! * cubit.quantity}',
                                style: getMediumStyle(
                                        color: ColorManager.appBarTitleColor)
                                    .copyWith(fontSize: 18.sp));
                          },
                        )
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      label: 'Add to cart',
                      onTap: () {},
                      prefixIcon: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: ColorManager.white,
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
