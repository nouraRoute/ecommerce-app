import 'package:ecommerce_app/features/auth/data/models/sign_in_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_responce.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_responce.dart';

abstract class AuthApiRemoteDataSource {
  Future<SignInResponce> signIn(SignInParameters parameters);
  Future<SignUpResponce> signUp(SignUpParameters parameters);
}
