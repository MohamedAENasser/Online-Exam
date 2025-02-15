part of 'verification_code_cubit.dart';

enum VerificationCodeStatus {
  sendCodeInitial,
  sendCodeLoading,
  sendCodeSuccess,
  sendCodeError,
  resendCodeLoading,
  resendCodeSuccess,
  resendCodeError,
}

extension VerificationCodeStatusEx on VerificationCodeState {
  bool get isSendCodeInitial => state == VerificationCodeStatus.sendCodeInitial;

  bool get isSendCodeLoading => state == VerificationCodeStatus.sendCodeLoading;

  bool get isSendCodeSuccess => state == VerificationCodeStatus.sendCodeSuccess;

  bool get isSendCodeError => state == VerificationCodeStatus.sendCodeError;

  bool get isResendCodeLoading =>
      state == VerificationCodeStatus.resendCodeLoading;
}

class VerificationCodeState extends Equatable {
  VerificationCodeStatus state;
  final ApiErrorModel? apiErrorModel;

  VerificationCodeState({
    this.apiErrorModel,
    this.state = VerificationCodeStatus.sendCodeInitial,
  });

  VerificationCodeState copyWith({
    VerificationCodeStatus? state,
    ApiErrorModel? apiErrorModel,
  }) {
    return VerificationCodeState(
      state: state ?? this.state,
      apiErrorModel: apiErrorModel ?? this.apiErrorModel,
    );
  }

  @override
  List<Object?> get props => [
        state,
        apiErrorModel,
      ];
}
// class VerificationCodeState {}
//
// class VerificationCodeInitial extends VerificationCodeState {}
//
// class VerificationCodeLoading extends VerificationCodeState {}
//
// class VerificationCodeSuccess extends VerificationCodeState {}
//
// class VerificationCodeError extends VerificationCodeState {
//   ApiErrorModel apiErrorModel;
//
//   VerificationCodeError({required this.apiErrorModel});
// }
//
// class ResendVerificationCodeLoading extends VerificationCodeState {}
//
// class ResendVerificationCodeSuccess extends VerificationCodeState {}
//
// class ResendVerificationCodeError extends VerificationCodeState {
//   ApiErrorModel apiErrorModel;
//
//   ResendVerificationCodeError({required this.apiErrorModel});
// }
