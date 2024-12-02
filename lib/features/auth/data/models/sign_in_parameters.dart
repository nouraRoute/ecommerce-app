class SignInParameters {
  final String email;
  final String password;

  SignInParameters({required this.email, required this.password});
  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}
