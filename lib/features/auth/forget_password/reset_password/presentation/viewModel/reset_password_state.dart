part of 'reset_password_cubit.dart';

class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
ApiErrorModel apiErrorModel;

  ResetPasswordError({required this.apiErrorModel});
}
