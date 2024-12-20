// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/core/di/service_locatop.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/sub_categories/cubit/sub_categories_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/sub_categories/cubit/sub_categories_state.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatefulWidget {
  const SubCategoriesList({
    super.key,
  });
  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  late var subCategoriesCubit = BlocProvider.of<SubCategoriesCubit>(context);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subCategoriesCubit.getSubCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
        builder: (context, state) {
          if (state is GetSubCategoriesError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          if (state is GetSubCategoriesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetSubCategoriesSuccess) {
            var subCategories = state.subcategories;
            return CustomScrollView(
              slivers: <Widget>[
                // category title
                SliverToBoxAdapter(
                  child: Text(
                    'Laptops & Electronics',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s14),
                  ),
                ),
                // the category card
                SliverToBoxAdapter(
                  child: CategoryCardItem(
                      "Laptops & Electronics",
                      ImageAssets.categoryCardImage,
                      goToCategoryProductsListScreen),
                ),
                // the grid view of the subcategories

                SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: subCategories.length,
                      (context, index) => SubCategoryItem(
                          subCategories[index],
                          ImageAssets.subcategoryCardImage,
                          goToCategoryProductsListScreen),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: AppSize.s8,
                      crossAxisSpacing: AppSize.s8,
                    ))
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
