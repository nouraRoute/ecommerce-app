// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/features/product/domain/entities/product_parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/core/di/service_locatop.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/product/presentation/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    Key? key,
    required this.categoryId,
  }) : super(key: key);
  final String categoryId;
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late String categoryId;
  ProductCubit _productCubit = serviceLocator.get<ProductCubit>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productCubit
        .getAllProducts(ProductParameters(categoryId: widget.categoryId));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: const HomeScreenAppBar(
          automaticallyImplyLeading: true,
        ),
        body: BlocProvider<ProductCubit>(
          create: (context) => _productCubit,
          child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
            if (state is GetProductsListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetProductsListError) {
              return Center(child: Text(state.errorMessage));
            }
            if (state is GetProductsListSuccess) {
              return Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: state.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 7 / 9,
                        ),
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                            productModel: state.products[index],
                            height: height,
                            width: width,
                          );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                    )
                  ],
                ),
              );
            }
            return Container();
          }),
        ));
  }
}
