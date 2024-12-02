import 'package:ecommerce_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';

class AuthRepository {
  AuthApiRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  AuthRepository({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });
  Future<UserModel> signIn(SignInParameters parameters) async {
    var response = await authRemoteDataSource.signIn(parameters);
    authLocalDataSource.saveToken(response.token);
    return response.user;
  }

  signUp(SignUpParameters parameters) async {
    var response = await authRemoteDataSource.signUp(parameters);
    authLocalDataSource.saveToken(response.token);
    return response.user;
  }
}
