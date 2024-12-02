class SignUpParameters {
  final String email;
  final String password;
  final String rePassword;
  final String phone;
  final String name;

  SignUpParameters(
      {required this.name,
      required this.email,
      required this.password,
      required this.rePassword,
      required this.phone});

  toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": password,
      "phone": phone
    };
  }
}
