part of 'verification_code_cubit.dart';

class VerificationCodeState {}

class VerificationCodeInitial extends VerificationCodeState {}

class VerificationCodeLoading extends VerificationCodeState {}

class VerificationCodeSuccess extends VerificationCodeState {}

class VerificationCodeError extends VerificationCodeState {
ApiErrorModel apiErrorModel;
  VerificationCodeError({required this.apiErrorModel});
}


class ResendVerificationCodeLoading extends VerificationCodeState {}

class ResendVerificationCodeSuccess extends VerificationCodeState {}

class ResendVerificationCodeError extends VerificationCodeState {
ApiErrorModel apiErrorModel;
  ResendVerificationCodeError({required this.apiErrorModel});
}
