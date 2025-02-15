import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/auth/data/model/api_error_model.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/result.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  @factoryMethod
  ResetPasswordCubit({required this.resetPasswordUseCase})
      : super(ResetPasswordState());
  ResetPasswordUseCase resetPasswordUseCase;

  void doIntent(ResetPasswordIntent intent) {
    switch (intent) {
      case OnButtonClickedIntent():
        _resetPassword(
          email: intent.email,
          password: intent.password,
        );
    }
  }

  void _resetPassword({required String email, required String password}) async {
    emit(state.copyWith(
      state: ResetPasswordStatus.loading,
    ));
    var result = await resetPasswordUseCase.execute(
      email: email,
      password: password,
    );
    switch (result) {
      case Success<void>():
        emit(state.copyWith(
          state: ResetPasswordStatus.success,
        ));
      case Error<void>():
        emit(state.copyWith(
          state: ResetPasswordStatus.error,
          apiErrorModel: result.apiErrorModel,
        ));
    }
  }
}

sealed class ResetPasswordIntent {}

class OnButtonClickedIntent extends ResetPasswordIntent {
  final String email;
  final String password;

  OnButtonClickedIntent(this.email, this.password);
}
