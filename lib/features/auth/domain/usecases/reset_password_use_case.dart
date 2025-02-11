import 'package:flutter_application_1/features/auth/domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepo repo;

  @factoryMethod
  ResetPasswordUseCase({required this.repo});

  Future<Result<void>> execute(
      {required String email, required String password}) {
    return repo.resetPassword(email: email, password: password);
  }
}
