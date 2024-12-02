import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/api_constants.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_responce.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_responce.dart';

class AuthApiRemoteDataSourceEmpl extends AuthApiRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<SignInResponce> signIn(SignInParameters parameters) async {
    print(parameters.toJson());
    var response =
        await dio.post(ApiConstants.signInEndPoint, data: parameters.toJson());
    return SignInResponce.fromJson(response.data);
  }

  @override
  Future<SignUpResponce> signUp(SignUpParameters parameters) async {
    print(parameters.toJson());

    var response =
        await dio.post(ApiConstants.signUpEndPoint, data: parameters.toJson());
    return SignUpResponce.fromJson(response.data);
  }
}
