import 'package:flutter_application_1/features/auth/domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';

@injectable
class VerificationCodeUseCase {
  AuthRepo repo;

  @factoryMethod
  VerificationCodeUseCase({required this.repo});

  Future<Result<void>> execute({required String code}) {
    return repo.verificationCode(code: code);
  }
}
