import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/mapper/user_mapper.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_parameters.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });
  @override
  Future<(Failure?, UserModel?)> signIn(SignInParameters parameters) async {
    try {
      var response = await authRemoteDataSource.signIn(parameters);
      authLocalDataSource.saveToken(response.token);
      return (null, response.user.userResponseToUserModel());
    } on AppExceptions catch (e) {
      Failure failure = Failure(message: e.message);
      return (failure, null);
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(SignUpParameters parameters) async {
    try {
      var response = await authRemoteDataSource.signUp(parameters);
      authLocalDataSource.saveToken(response.token);
      return Right(response.user.userResponseToUserModel());
    } on AppExceptions catch (e) {
      Failure failure = Failure(message: e.message);
      return Left(failure);
    }
  }

  @override
  Future<String?> getToken() async {
    return authLocalDataSource.getToken();
  }
}
