import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/category_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/sub_categories/cubit/sub_categories_cubit.dart';
import 'package:ecommerce_app/features/product/domain/entities/product_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryItem extends StatelessWidget {
  final CategoryModel subCat;
  final String image;

  final Function navigation;
  const SubCategoryItem(this.subCat, this.image, this.navigation, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productsScreen,
          arguments: ProductParameters(categoryId: subCat.id)),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  border: Border.all(color: ColorManager.primary, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            subCat.name ?? "",
            style: getRegularStyle(color: ColorManager.primary)
                .copyWith(fontSize: 10),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
