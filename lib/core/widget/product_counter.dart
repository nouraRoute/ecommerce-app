import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/features/product/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductCubit>(context);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        print("XXX=>${cubit.quantity}");
        return Container(
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(24.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    int quantity = cubit.quantity;
                    if (quantity == 1) return;
                    cubit.updateQuintet(--quantity);
                  },
                  child: Icon(
                    Icons.remove_circle_outline,
                    size: 20.w,
                    color: ColorManager.white,
                  )),
              SizedBox(
                width: 18.w,
              ),
              Text(
                cubit.quantity.toString(),
                style: getMediumStyle(color: ColorManager.white)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(
                width: 18.w,
              ),
              InkWell(
                  onTap: () {
                    print('XXX');
                    int quantity = cubit.quantity;
                    cubit.updateQuintet(++quantity);
                  },
                  child: Icon(
                    Icons.add_circle_outline,
                    color: ColorManager.white,
                    size: 20.w,
                  )),
            ],
          ),
        );
      },
    );
  }
}
