import 'package:flutter_application_1/features/auth/domain/entity/user_entity.dart';

import '../../../../core/utils/result.dart';

abstract class AuthRepo{
  Future<Result<UserEntity>> signUp({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  });
}