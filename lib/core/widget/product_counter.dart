// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';

class ProductCounter extends StatefulWidget {
  int quantity;
  void Function() onAdd;
  void Function() onSubtract;
  ProductCounter({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onSubtract,
  });

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  @override
  Widget build(BuildContext context) {
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
                widget.onSubtract();
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
            widget.quantity.toString(),
            style: getMediumStyle(color: ColorManager.white)
                .copyWith(fontSize: 18.sp),
          ),
          SizedBox(
            width: 18.w,
          ),
          InkWell(
              onTap: () {
                widget.onAdd();
              },
              child: Icon(
                Icons.add_circle_outline,
                color: ColorManager.white,
                size: 20.w,
              )),
        ],
      ),
    );
  }
}
