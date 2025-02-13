import 'package:bloc/bloc.dart';
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
      : super(VerificationCodeInitial());
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
    emit(VerificationCodeLoading());
    var result = await verificationCodeUseCase.execute(code: code);
    switch (result) {
      case Success<void>():
        emit(VerificationCodeSuccess());
      case ServerError<void>():
        emit(VerificationCodeError(message: result.message));
      case Error<void>():
        emit(VerificationCodeError(exception: result.exception));
    }
  }

  void _resend({required String email}) async {
    emit(ResendVerificationCodeLoading());
    var result = await forgetPasswordUseCase.execute(email: email);
    switch (result) {
      case Success<void>():
        emit(ResendVerificationCodeSuccess());
      case ServerError<void>():
        emit(ResendVerificationCodeError(message: result.message));
      case Error<void>():
        emit(ResendVerificationCodeError(exception: result.exception));
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
