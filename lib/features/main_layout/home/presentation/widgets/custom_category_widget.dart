import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryWidget extends StatelessWidget {
  const CustomCategoryWidget({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: categoryModel.id == null
          ? null
          : () => Navigator.of(context)
              .pushNamed(Routes.productsScreen, arguments: categoryModel.id),
      child: Column(
        children: [
          // CachedNetworkImage(
          //   height: 100,
          //   width: 100,
          //   fit: BoxFit.cover,
          //   imageUrl: ImageAssets.categoryHomeImage,
          //   placeholder: (context, url) =>
          //       const Center(child: CircularProgressIndicator()),
          //   errorWidget: (context, url, error) =>
          //       const Center(child: Icon(Icons.error)),
          //   imageBuilder: (context, imageProvider) {
          //     return Container(
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         image: DecorationImage(
          //           image: imageProvider,
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     );
          //   },
          // ),

          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                imageUrl: categoryModel.image ?? '',
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                      width: 30.r,
                      height: 30.r,
                      child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, _) =>
                    Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            categoryModel.name ?? "",
            style:
                getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
