import 'package:flutter_application_1/core/utils/result.dart';
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
}
