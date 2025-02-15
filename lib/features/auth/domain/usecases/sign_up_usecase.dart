import 'package:flutter_application_1/features/auth/domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../entity/user_entity.dart';

@injectable
class SignUpUseCase {
  AuthRepo repo;

  @factoryMethod
  SignUpUseCase({required this.repo});

  Future<Result<UserEntity?>> execute({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  }) {
    return repo.signUp(
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      phoneNumber: phoneNumber,
    );
  }
}
