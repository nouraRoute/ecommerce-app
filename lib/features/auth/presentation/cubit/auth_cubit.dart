// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:ecommerce_app/features/auth/domain/use_case/get_token_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:ecommerce_app/features/auth/data/models/sign_in_parameters.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_parameters.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/sign_in_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit_status.dart';

@singleton
class AuthCubit extends Cubit<AuthCubitState> {
  SignInUseCase _signInUseCase;
  SignUpUseCase _signUpUseCase;
  GetTokenUseCase _getToken;
  String? token;
  AuthCubit(
    this._signInUseCase,
    this._getToken,
    this._signUpUseCase,
  ) : super(AuthInitialState());
  signIn(SignInParameters parameters) async {
    emit(AuthSignInLoadingState());
    var response = await _signInUseCase(parameters);

    if (response.$1 != null) {
      log('error');

      emit(AuthSignInErrorState(message: response.$1!.message));
      log(response.$1!.message);
    } else {
      emit(AuthSignInSuccessState());
      log('success');
    }
  }

  signUp(SignUpParameters parameters) async {
    emit(AuthSignInLoadingState());
    var response = await _signUpUseCase(parameters);
    response.fold(
      (l) {
        log('error');
        emit(AuthSignInErrorState(message: l.message));
      },
      (r) {
        emit(AuthSignInSuccessState());
        log('success');
      },
    );
  }

  Future<void> checkToken() async {
    String? _token = await _getToken();
    if (_token == null) {
      emit(AuthCheckTokenFail());
    } else {
      token = _token;
      emit(AuthCheckTokenSuccess());
    }
  }
}
