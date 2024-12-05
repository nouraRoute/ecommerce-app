import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
