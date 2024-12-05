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
    gh.singleton<_i150.AuthLocalDataSource>(() => _i422.AuthLocalDataSourceEmpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.singleton<_i4.AuthRemoteDataSource>(
        () => _i998.AuthApiRemoteDataSourceEmpl(dio: gh<_i361.Dio>()));
    gh.singleton<_i542.AuthRepository>(() => _i51.AuthRepositoryImpl(
          authRemoteDataSource: gh<_i4.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i150.AuthLocalDataSource>(),
        ));
    gh.singleton<_i437.SignInUseCase>(
        () => _i437.SignInUseCase(authRepository: gh<_i542.AuthRepository>()));
    gh.singleton<_i321.SignUpUseCase>(
        () => _i321.SignUpUseCase(authRepository: gh<_i542.AuthRepository>()));
    gh.singleton<_i252.GetTokenUseCase>(() =>
        _i252.GetTokenUseCase(authRepository: gh<_i542.AuthRepository>()));
    gh.singleton<_i118.AuthCubit>(() => _i118.AuthCubit(
          gh<_i437.SignInUseCase>(),
          gh<_i252.GetTokenUseCase>(),
          gh<_i321.SignUpUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i216.RegisterModule {}
