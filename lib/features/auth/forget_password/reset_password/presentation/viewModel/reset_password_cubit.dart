import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/result.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  @factoryMethod
  ResetPasswordCubit({required this.resetPasswordUseCase})
      : super(ResetPasswordInitial());
  ResetPasswordUseCase resetPasswordUseCase;

  void resetPassword({required String email, required String password}) async {
    emit(ResetPasswordLoading());
    var result = await resetPasswordUseCase.execute(
      email: email,
      password: password,
    );
    switch (result) {
      case Success<void>():
        emit(ResetPasswordSuccess());
      case ServerError<void>():
        emit(ResetPasswordError(message: result.message));
      case Error<void>():
        emit(ResetPasswordError(exception: result.exception));
    }
  }
}
