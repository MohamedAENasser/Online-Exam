import 'package:flutter_application_1/features/auth/domain/entity/user_entity.dart';

class UserDM {
  UserDM({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  factory UserDM.fromJson(Map<String, dynamic> json) {
    return UserDM(
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      isVerified: json['isVerified'],
      id: json['_id'],
      createdAt: json['createdAt'],
    );
  }

  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? id;
  String? createdAt;

  UserEntity toEntity() => UserEntity(
        phone: phone,
        lastName: lastName,
        firstName: firstName,
        email: email,
        username: username,
      );
}
