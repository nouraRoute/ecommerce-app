import 'package:ecommerce_app/features/auth/data/models/user_response.dart';

class SignUpResponce {
  String message;
  UserResponse user;
  String token;

  SignUpResponce(
      {required this.message, required this.user, required this.token});

  SignUpResponce.fromJson(Map<String, dynamic> json)
      : message = json["message"],
        user = UserResponse.fromJson(json["user"]),
        token = json["token"];
}
