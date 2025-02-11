import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/utils/result.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/forget_passsword_use_case.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/verification_code_use_case.dart';
import 'package:injectable/injectable.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  @factoryMethod
  ForgetPasswordCubit({
    required this.forgetPasswordUseCase,
    required this.verificationCodeUseCase,
    required this.resetPasswordUseCase,
  }) : super(ForgetPasswordInitial());
  ForgetPasswordUseCase forgetPasswordUseCase;
  VerificationCodeUseCase verificationCodeUseCase;
  ResetPasswordUseCase resetPasswordUseCase;

  void forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    var result = await forgetPasswordUseCase.execute(email: email);
    switch (result) {
      case Success<void>():
        emit(ForgetPasswordSuccess());
      case ServerError<void>():
        emit(ForgetPasswordError(message: result.message));
      case Error<void>():
        emit(ForgetPasswordError(exception: result.exception));
    }
  }

  // void verificationCode({required String code}) async {
  //   emit(VerificationCodeLoading());
  //   var result = await verificationCodeUseCase.execute(code: code);
  //   switch (result) {
  //     case Success<void>():
  //       emit(VerificationCodeSuccess());
  //     case ServerError<void>():
  //       emit(VerificationCodeError(message: result.message));
  //     case Error<void>():
  //       emit(VerificationCodeError(exception: result.exception));
  //   }
  // }

  // void resetPassword({required String email, required String password}) async {
  //   emit(ResetPasswordLoading());
  //   var result = await resetPasswordUseCase.execute(
  //     email: email,
  //     password: password,
  //   );
  //   switch (result) {
  //     case Success<void>():
  //       emit(ResetPasswordSuccess());
  //     case ServerError<void>():
  //       emit(ResetPasswordError(message: result.message));
  //     case Error<void>():
  //       emit(ResetPasswordError(exception: result.exception));
  //   }
  // }
}
