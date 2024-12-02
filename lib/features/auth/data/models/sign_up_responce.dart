import 'package:ecommerce_app/features/auth/data/models/user_model.dart';

class SignUpResponce {
  String message;
  UserModel user;
  String token;

  SignUpResponce(
      {required this.message, required this.user, required this.token});

  SignUpResponce.fromJson(Map<String, dynamic> json)
      : message = json["message"],
        user = UserModel.fromJson(json["user"]),
        token = json["token"];
}
