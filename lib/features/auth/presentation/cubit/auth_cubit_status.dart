abstract class AuthCubitState {}

class AuthInitialState extends AuthCubitState {}

class AuthSignInSuccessState extends AuthCubitState {}

class AuthSignInLoadingState extends AuthCubitState {}

class AuthCheckTokenSuccess extends AuthCubitState {}

class AuthCheckTokenFail extends AuthCubitState {}

class AuthSignInErrorState extends AuthCubitState {
  final String message;

  AuthSignInErrorState({required this.message});
}

class AuthSignUpSuccessState extends AuthCubitState {}

class AuthSignUpLoadingState extends AuthCubitState {}

class AuthSignUpErrorState extends AuthCubitState {
  final String message;

  AuthSignUpErrorState({required this.message});
}
