part of 'forget_password_cubit.dart';

class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {}

class ForgetPasswordError extends ForgetPasswordState {
  ApiErrorModel apiErrorModel;

  ForgetPasswordError({
    required this.apiErrorModel,
  });
}
