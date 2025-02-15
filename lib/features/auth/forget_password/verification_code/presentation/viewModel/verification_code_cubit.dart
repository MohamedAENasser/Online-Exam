import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/auth/data/model/api_error_model.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/forget_passsword_use_case.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/verification_code_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/result.dart';

part 'verification_code_state.dart';

@injectable
class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  @factoryMethod
  VerificationCodeCubit(
      {required this.verificationCodeUseCase,
      required this.forgetPasswordUseCase})
      : super(VerificationCodeState());
  VerificationCodeUseCase verificationCodeUseCase;
  ForgetPasswordUseCase forgetPasswordUseCase;

  void doIntent(VerificationCodeIntent intent) {
    switch (intent) {
      case SendVerificationCodeIntent():
        _sendVerificationCode(code: intent.code);
      case ResendVerificationCodeIntent():
        _resend(email: intent.email);
    }
  }

  void _sendVerificationCode({required String code}) async {
    emit(state.copyWith(
      state: VerificationCodeStatus.sendCodeLoading,
    ));
    var result = await verificationCodeUseCase.execute(code: code);
    switch (result) {
      case Success<void>():
        emit(state.copyWith(
          state: VerificationCodeStatus.sendCodeSuccess,
        ));
      case Error<void>():
        emit(state.copyWith(
          state: VerificationCodeStatus.sendCodeError,
          apiErrorModel: result.apiErrorModel,
        ));
    }
  }

  void _resend({required String email}) async {
    emit(state.copyWith(
      state: VerificationCodeStatus.resendCodeLoading,
    ));
    var result = await forgetPasswordUseCase.execute(email: email);
    switch (result) {
      case Success<void>():
        emit(state.copyWith(
          state: VerificationCodeStatus.resendCodeSuccess,
        ));
      case Error<void>():
        emit(state.copyWith(
          state: VerificationCodeStatus.resendCodeError,
          apiErrorModel: result.apiErrorModel,
        ));
    }
  }
}

sealed class VerificationCodeIntent {}

class SendVerificationCodeIntent extends VerificationCodeIntent {
  final String code;

  SendVerificationCodeIntent(this.code);
}

class ResendVerificationCodeIntent extends VerificationCodeIntent {
  final String email;

  ResendVerificationCodeIntent(this.email);
}
