import 'package:ecommerce_app/features/auth/data/models/user_response.dart';

class SignInResponce {
  String message;
  UserResponse user;
  String token;

  SignInResponce(
      {required this.message, required this.user, required this.token});

  SignInResponce.fromJson(Map<String, dynamic> json)
      : message = json["message"],
        user = UserResponse.fromJson(json["user"]),
        token = json["token"];

  static List<SignInResponce> fromList(List<Map<String, dynamic>> list) {
    return list.map(SignInResponce.fromJson).toList();
  }
}
