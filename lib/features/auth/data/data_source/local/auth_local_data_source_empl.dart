import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/app_constants.dart';
import 'package:ecommerce_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthLocalDataSourceEmpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceEmpl({required this.sharedPreferences});
  @override
  String? getToken() {
    try {
      return sharedPreferences.getString(CashKeys.tokenKey);
    } catch (e) {
      throw LocalException(message: 'not able get token!');
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await sharedPreferences.setString(CashKeys.tokenKey, token);
    } catch (e) {
      throw LocalException(message: 'not able to save token!');
    }
  }
}
