import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/api_constants.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_responce.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_responce.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer';

@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSourceEmpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthApiRemoteDataSourceEmpl({required this.dio});
  @override
  Future<SignInResponce> signIn(SignInParameters parameters) async {
    try {
      log(parameters.toJson().toString());
      var response = await dio.post(ApiConstants.signInEndPoint,
          data: parameters.toJson());
      return SignInResponce.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data is Map
            ? e.response!.data['message']
            : 'some thing went wrong';
        throw AuthException(message: message);
      }
      throw RemoteException(message: message);
    }
  }

  @override
  Future<SignUpResponce> signUp(SignUpParameters parameters) async {
    try {
      log(parameters.toJson());

      var response = await dio.post(ApiConstants.signUpEndPoint,
          data: parameters.toJson());
      return SignUpResponce.fromJson(response.data);
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data is Map
            ? e.response!.data['message']
            : 'some thing went wrong';
        throw AuthException(message: message);
      }
      throw RemoteException(message: message);
    }
  }
}
