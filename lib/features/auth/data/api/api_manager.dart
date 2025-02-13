import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/app_constants.dart';
import 'package:flutter_application_1/features/auth/data/model/auth_response/auth_response.dart';
import 'package:flutter_application_1/features/auth/data/model/forget_password_response/forget_password_response.dart';
import 'package:flutter_application_1/features/auth/data/model/sign_up_request/sign_up_request.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../model/auth_response/user_dm.dart';

@singleton
class ApiManager {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
    ),
  )..interceptors.add(LogInterceptor(
      request: true,
      // Log the request
      requestHeader: true,
      // Log request headers
      requestBody: true,
      // Log request body
      responseHeader: true,
      // Log response headers
      responseBody: true,
      // Log response body
      error: true, // Log errors
    ));

  Future<Result<UserDM>> signUp({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  }) async {
    try {
      var result = await dio.post(
        AppConstants.signUpEndPoint,
        data: SignUpRequest(
          username: userName,
          password: password,
          email: email,
          firstName: firstName,
          lastName: lastName,
          phone: phoneNumber,
          rePassword: confirmPassword,
        ).toJson(),
      );
      AuthResponse authResponse = AuthResponse.fromJson(result.data);
      if (authResponse.message == 'success') {
        return Success(
          data: authResponse.user ?? UserDM(),
        );
      } else {
        return ServerError(message: authResponse.message ?? '');
      }
    } on DioException catch (e) {
      return Error(exception: e);
    } catch (e) {
      return ServerError(message: e.toString());
    }
  }

  Future<void> forgetPassword({required String email}) async {
    var response = await dio.post(
      AppConstants.forgetPasswordEndPoint,
      data: {
        'email': email,
      },
    );
  }

  Future<void> verificationCode({required String code}) async {
    var response = await dio.post(
      AppConstants.verificationCodeEndPoint,
      data: {
        'resetCode': code,
      },
    );
  }

  Future<void> resetPassword({
    required String email,
    required String password,
  }) async {
    var response = await dio.put(
      AppConstants.resetPasswordEndPoint,
      data: {
        'email': email,
        'newPassword': password,
      },
    );
  }
}
