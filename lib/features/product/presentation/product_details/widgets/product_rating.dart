import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/product_counter.dart';
import 'package:ecommerce_app/features/product/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductRating extends StatefulWidget {
  final String productBuyers;
  final String productRating;
  const ProductRating(
      {super.key, required this.productBuyers, required this.productRating});

  @override
  State<ProductRating> createState() => _ProductRatingState();
}

class _ProductRatingState extends State<ProductRating> {
  late ProductCubit productCubit = BlocProvider.of<ProductCubit>(context);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
                color: ColorManager.primary.withOpacity(.3), width: 1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Text(
            '${widget.productBuyers} Sold',
            overflow: TextOverflow.ellipsis,
            style: getMediumStyle(color: ColorManager.primary)
                .copyWith(fontSize: 18.sp),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Image.asset(
          ImageAssets.rate,
          width: 30.w,
        ),
        SizedBox(
          width: 4.w,
        ),
        Expanded(
          child: Text(
            widget.productRating,
            overflow: TextOverflow.ellipsis,
            style: getMediumStyle(color: ColorManager.appBarTitleColor)
                .copyWith(fontSize: 14.sp),
          ),
        ),
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return ProductCounter(
              quantity: productCubit.quantity,
              onAdd: () {
                productCubit.updateQuintet(++productCubit.quantity);
              },
              onSubtract: () {
                if (productCubit.quantity == 1) return;
                productCubit.updateQuintet(--productCubit.quantity);
              },
            );
          },
        )
      ],
    );
  }
}
