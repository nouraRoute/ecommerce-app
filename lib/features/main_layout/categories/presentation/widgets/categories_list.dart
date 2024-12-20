import 'package:ecommerce_app/core/di/service_locatop.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/category_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/categories_states.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/sub_categories/cubit/sub_categories_cubit.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/sub_categories/cubit/sub_categories_state.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var subCatCubit = BlocProvider.of<SubCategoriesCubit>(context);
    return BlocProvider(
      create: (context) => serviceLocator.get<CategoriesCubit>(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is GetAllCategoriesSuccessState) {
            List<CategoryModel> categories = state.categoriesList;
            if (subCatCubit.selectedCategory == "" &&
                categories[0].id != null) {
              subCatCubit.updateSelectedCategory(categories[0].id!);
            }
            return BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
              builder: (context, state) {
                return Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.containerGray,
                    border: Border(
                        // set the border for only 3 sides
                        top: BorderSide(
                            width: AppSize.s2,
                            color: ColorManager.primary.withOpacity(0.3)),
                        left: BorderSide(
                            width: AppSize.s2,
                            color: ColorManager.primary.withOpacity(0.3)),
                        bottom: BorderSide(
                            width: AppSize.s2,
                            color: ColorManager.primary.withOpacity(0.3))),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSize.s12),
                      bottomLeft: Radius.circular(AppSize.s12),
                    ),
                  ),

                  // the categories items list
                  child: ClipRRect(
                    // clip the corners of the container that hold the list view
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSize.s12),
                      bottomLeft: Radius.circular(AppSize.s12),
                    ),
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                            index,
                            categories[index],
                            subCatCubit.selectedCategory ==
                                categories[index].id, () {
                          subCatCubit
                              .updateSelectedCategory(categories[index].id!);
                        });
                      },
                    ),
                  ),
                ));
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  // callback function to change the selected index
}
