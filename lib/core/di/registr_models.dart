import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/api_constants.dart';
import 'package:ecommerce_app/core/resources/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
    Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        var sharedPreferences = await SharedPreferences.getInstance();
        String? token = sharedPreferences.getString(CashKeys.tokenKey);
        if (token != null) {
          options.headers['token'] = token;
        }
        print("###=>" + options.uri.toString());
        print("###=>" + options.headers.toString());

        return handler.next(options);
      },
    ));
    return dio;
  }

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
