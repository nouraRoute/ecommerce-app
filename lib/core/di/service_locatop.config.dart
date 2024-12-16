// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce_app/core/di/registr_models.dart' as _i216;
import 'package:ecommerce_app/features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i150;
import 'package:ecommerce_app/features/auth/data/data_source/local/auth_local_data_source_empl.dart'
    as _i422;
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_api_remote_data_source.dart'
    as _i4;
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_api_remote_data_source_empl.dart'
    as _i998;
import 'package:ecommerce_app/features/auth/data/repository_impl/auth_repository_impl.dart'
    as _i51;
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart'
    as _i542;
import 'package:ecommerce_app/features/auth/domain/use_case/get_token_use_case.dart'
    as _i252;
import 'package:ecommerce_app/features/auth/domain/use_case/sign_in_use_case.dart'
    as _i437;
import 'package:ecommerce_app/features/auth/domain/use_case/sign_up_use_case.dart'
    as _i321;
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i118;
import 'package:ecommerce_app/features/cart/data/datasources/cart_data_source.dart'
    as _i868;
import 'package:ecommerce_app/features/cart/data/datasources/cart_remote_data_source_impl.dart'
    as _i941;
import 'package:ecommerce_app/features/cart/data/repositories/cart_repository_impl.dart'
    as _i84;
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart'
    as _i182;
import 'package:ecommerce_app/features/cart/domain/usecases/add_to_cart_usecase.dart'
    as _i229;
import 'package:ecommerce_app/features/cart/domain/usecases/delete_product_from_cart_usecase.dart'
    as _i790;
import 'package:ecommerce_app/features/cart/domain/usecases/get_cart_usecase.dart'
    as _i555;
import 'package:ecommerce_app/features/cart/domain/usecases/update_product_quantity_usecase.dart'
    as _i807;
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart'
    as _i390;
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/categories_data_source.dart'
    as _i162;
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/categories_remote_data_source.dart'
    as _i422;
import 'package:ecommerce_app/features/main_layout/categories/data/repository%20impl/categpries_repository_impl.dart'
    as _i852;
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/categories_repository.dart'
    as _i12;
import 'package:ecommerce_app/features/main_layout/categories/domain/use_case/get_all_categories_usecase.dart'
    as _i925;
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/categories_cubit.dart'
    as _i303;
import 'package:ecommerce_app/features/product/data/datasources/product_data_source.dart'
    as _i74;
import 'package:ecommerce_app/features/product/data/datasources/product_remote_data_source.dart'
    as _i196;
import 'package:ecommerce_app/features/product/data/repositories/product_repository_impl.dart'
    as _i154;
import 'package:ecommerce_app/features/product/domain/repositories/product_repository.dart'
    as _i337;
import 'package:ecommerce_app/features/product/domain/usecases/get_products_list_usecase.dart'
    as _i692;
import 'package:ecommerce_app/features/product/presentation/cubit/product_cubit.dart'
    as _i338;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i162.CategoriesDataSource>(
        () => _i422.CategoriesRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i868.CartDataSource>(
        () => _i941.CartRemoteDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.singleton<_i150.AuthLocalDataSource>(() => _i422.AuthLocalDataSourceEmpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i12.CategoriesRepository>(() =>
        _i852.CategoriesRepositoryImpl(
            categoriesDataSource: gh<_i162.CategoriesDataSource>()));
    gh.lazySingleton<_i74.ProductDataSource>(
        () => _i196.ProductRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.singleton<_i4.AuthRemoteDataSource>(
        () => _i998.AuthApiRemoteDataSourceEmpl(dio: gh<_i361.Dio>()));
    gh.singleton<_i542.AuthRepository>(() => _i51.AuthRepositoryImpl(
          authRemoteDataSource: gh<_i4.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i150.AuthLocalDataSource>(),
        ));
    gh.singleton<_i252.GetTokenUseCase>(() =>
        _i252.GetTokenUseCase(authRepository: gh<_i542.AuthRepository>()));
    gh.singleton<_i437.SignInUseCase>(
        () => _i437.SignInUseCase(authRepository: gh<_i542.AuthRepository>()));
    gh.singleton<_i321.SignUpUseCase>(
        () => _i321.SignUpUseCase(authRepository: gh<_i542.AuthRepository>()));
    gh.lazySingleton<_i337.ProductRepository>(() => _i154.ProductRepositoryImpl(
        productDataSource: gh<_i74.ProductDataSource>()));
    gh.lazySingleton<_i925.GetAllCategoriesUsecase>(() =>
        _i925.GetAllCategoriesUsecase(
            categoriesRepository: gh<_i12.CategoriesRepository>()));
    gh.singleton<_i118.AuthCubit>(() => _i118.AuthCubit(
          gh<_i437.SignInUseCase>(),
          gh<_i252.GetTokenUseCase>(),
          gh<_i321.SignUpUseCase>(),
        ));
    gh.lazySingleton<_i182.CartRepository>(() =>
        _i84.CartRepositoryImpl(cartDataSource: gh<_i868.CartDataSource>()));
    gh.lazySingleton<_i555.GetCartUsecase>(
        () => _i555.GetCartUsecase(cartRepository: gh<_i182.CartRepository>()));
    gh.lazySingleton<_i229.AddToCartUsecase>(() =>
        _i229.AddToCartUsecase(cartRepository: gh<_i182.CartRepository>()));
    gh.lazySingleton<_i790.DeleteProductFromCartUsecase>(() =>
        _i790.DeleteProductFromCartUsecase(
            cartRepository: gh<_i182.CartRepository>()));
    gh.lazySingleton<_i807.UpdateProductQuantityUsecase>(() =>
        _i807.UpdateProductQuantityUsecase(
            cartRepository: gh<_i182.CartRepository>()));
    gh.lazySingleton<_i303.CategoriesCubit>(
        () => _i303.CategoriesCubit(gh<_i925.GetAllCategoriesUsecase>()));
    gh.factory<_i390.CartCubit>(() => _i390.CartCubit(
          gh<_i555.GetCartUsecase>(),
          gh<_i229.AddToCartUsecase>(),
          gh<_i807.UpdateProductQuantityUsecase>(),
          gh<_i790.DeleteProductFromCartUsecase>(),
        ));
    gh.lazySingleton<_i692.GetProductsListUsecase>(() =>
        _i692.GetProductsListUsecase(
            productRepository: gh<_i337.ProductRepository>()));
    gh.factory<_i338.ProductCubit>(
        () => _i338.ProductCubit(gh<_i692.GetProductsListUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i216.RegisterModule {}
