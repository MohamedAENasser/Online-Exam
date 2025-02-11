import 'package:flutter_application_1/features/auth/domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';

@injectable
class ForgetPasswordUseCase {
  AuthRepo repo;

  @factoryMethod
  ForgetPasswordUseCase({required this.repo});

  Future<Result<void>> execute({required String email}) {
    return repo.forgetPassword(email: email);
  }
}
