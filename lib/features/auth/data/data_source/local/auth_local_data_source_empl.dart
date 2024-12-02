import 'package:ecommerce_app/core/resources/app_constants.dart';
import 'package:ecommerce_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceEmpl extends AuthLocalDataSource {
  @override
  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getString(CashKeys.tokenKey);
  }

  @override
  Future<void> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString(CashKeys.tokenKey, token);
  }
}
