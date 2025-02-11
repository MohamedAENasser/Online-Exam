import '../../../../core/utils/result.dart';
import '../model/auth_response/user_dm.dart';

abstract class AuthDataSource {
  Future<Result<UserDM>> signUp({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  });

  Future<Result<void>> forgetPassword({required String email});
}
