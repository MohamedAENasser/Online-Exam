part of 'verification_code_cubit.dart';
 class VerificationCodeState {}

class VerificationCodeInitial extends VerificationCodeState {}

class VerificationCodeLoading extends VerificationCodeState {}

class VerificationCodeSuccess extends VerificationCodeState {}

class VerificationCodeError extends VerificationCodeState {
  String? message;

  Exception? exception;

  VerificationCodeError({this.message, this.exception});
}


class ResendVerificationCodeLoading extends VerificationCodeState {}

class ResendVerificationCodeSuccess extends VerificationCodeState {}

class ResendVerificationCodeError extends VerificationCodeState {
  String? message;

  Exception? exception;

  ResendVerificationCodeError({this.message, this.exception});
}

