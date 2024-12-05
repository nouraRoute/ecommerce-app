import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_parameters.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class SignInUseCase {
  AuthRepository authRepository;
  SignInUseCase({
    required this.authRepository,
  });
  Future<(Failure?, UserModel?)> call(SignInParameters signInParameters) =>
      authRepository.signIn(signInParameters);
}
