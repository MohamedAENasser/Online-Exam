import 'package:flutter_application_1/core/utils/result.dart';
import 'package:flutter_application_1/features/auth/data/datasource_contract/auth_datasource.dart';
import 'package:flutter_application_1/features/auth/data/model/auth_response/user_dm.dart';
import 'package:flutter_application_1/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_application_1/features/auth/domain/repo_contract/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthDataSource authDataSource;

  @factoryMethod
  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Result<UserEntity>> signUp(
      {required String userName,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String confirmPassword,
      required String phoneNumber}) async {
    var result = await authDataSource.signUp(
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      phoneNumber: phoneNumber,
    );
    switch (result) {
      case Success<UserDM>():
        return Success(data: result.data.toEntity());
      case ServerError<UserDM>():
        return ServerError(message: result.message);
      case Error<UserDM>():
        return Error(exception: result.exception);
    }
  }

  @override
  Future<Result<void>> forgetPassword({required String email}) {
    return authDataSource.forgetPassword(email: email);
  }
}
