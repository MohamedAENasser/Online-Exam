import 'package:flutter_application_1/features/auth/data/model/auth_response/user_dm.dart';

class AuthResponse {
  AuthResponse({
    this.message,
    this.token,
    this.user,
  });

  AuthResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? UserDM.fromJson(json['user']) : null;
  }

  String? message;
  String? token;
  UserDM? user;
}
