import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_parameters.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class SignUpUseCase {
  AuthRepository authRepository;
  SignUpUseCase({
    required this.authRepository,
  });
  Future<Either<Failure, UserModel>> call(SignUpParameters signUpParameters) =>
      authRepository.signUp(signUpParameters);
}
