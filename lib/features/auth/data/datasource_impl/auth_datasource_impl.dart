import 'package:flutter_application_1/core/utils/result.dart';
import 'package:flutter_application_1/features/auth/data/api/api_executer.dart';
import 'package:flutter_application_1/features/auth/data/api/api_manager.dart';

import 'package:flutter_application_1/features/auth/data/model/auth_response/user_dm.dart';
import 'package:injectable/injectable.dart';

import '../datasource_contract/auth_datasource.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;

  @factoryMethod
  AuthDataSourceImpl({required this.apiManager});

  @override
  Future<Result<UserDM>> signUp({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  }) {
    return apiManager.signUp(
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      phoneNumber: phoneNumber,
    );
  }

  @override
  Future<Result<void>> forgetPassword({required String email}) async {
    return executeApi<void>(() async {
      var response = await apiManager.forgetPassword(email: email);
    });
  }

  @override
  Future<Result<void>> verificationCode({required String code}) async {
    return executeApi<void>(() async {
      var response = await apiManager.verificationCode(code: code);
    });
  }

  @override
  Future<Result<void>> resetPassword({
    required String email,
    required String password,
  }) async {
    return executeApi<void>(() async {
      var response = await apiManager.resetPassword(
        email: email,
        password: password,
      );
    });
  }
}
