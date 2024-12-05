class UserResponse {
  String? name;
  String? email;
  String? role;

  UserResponse({this.name, this.email, this.role});

  UserResponse.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
  }
}
