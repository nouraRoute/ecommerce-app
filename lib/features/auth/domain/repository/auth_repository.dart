import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_parameters.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_model.dart';

abstract class AuthRepository {
  Future<(Failure?, UserModel?)> signIn(SignInParameters signInParameters);
  Future<Either<Failure, UserModel>> signUp(SignUpParameters signUpParameters);
  Future<String?> getToken();
}
