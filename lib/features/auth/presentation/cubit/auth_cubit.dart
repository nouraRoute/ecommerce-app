import 'package:ecommerce_app/features/auth/data/data_source/local/auth_local_data_source_empl.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_api_remote_data_source_empl.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_in_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_parameters.dart';
import 'package:ecommerce_app/features/auth/data/repository/auth_repository.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthRepository authRepository = AuthRepository(
      authRemoteDataSource: AuthApiRemoteDataSourceEmpl(),
      authLocalDataSource: AuthLocalDataSourceEmpl());
  AuthCubit() : super(AuthInitialState());
  signIn(SignInParameters parameters) async {
    try {
      emit(AuthSignInLoadingState());
      await authRepository.signIn(parameters);
      emit(AuthSignInSuccessState());
      print('success');
    } catch (e) {
      print('error');

      emit(AuthSignInErrorState());
      print(e.toString());
    }
  }

  signUp(SignUpParameters parameters) async {
    try {
      emit(AuthSignInLoadingState());
      await authRepository.signUp(parameters);
      emit(AuthSignInSuccessState());
      print('success');
    } catch (e) {
      print('error');
      emit(AuthSignInErrorState());
      print(e.toString());
    }
  }
}
