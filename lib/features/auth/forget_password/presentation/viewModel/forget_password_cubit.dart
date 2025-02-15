import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/utils/result.dart';
import 'package:flutter_application_1/features/auth/data/model/api_error_model.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/forget_passsword_use_case.dart';
import 'package:injectable/injectable.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  @factoryMethod
  ForgetPasswordCubit({
    required this.forgetPasswordUseCase,
  }) : super(ForgetPasswordState());
  ForgetPasswordUseCase forgetPasswordUseCase;

  void doIntent(ForgetPasswordIntent intent) {
    switch (intent) {
      case OnButtonCLickedIntent():
        _forgetPassword(email: intent.email);
    }
  }

  void _forgetPassword({required String email}) async {
    emit(state.copyWith(
      state: ForgetPasswordStatus.loading,
    ));
    var result = await forgetPasswordUseCase.execute(email: email);
    switch (result) {
      case Success<void>():
        emit(state.copyWith(
          state: ForgetPasswordStatus.success,
        ));
      case Error<void>():
        emit(state.copyWith(
          state: ForgetPasswordStatus.error,
          apiErrorModel: result.apiErrorModel,
        ));
    }
  }
}

sealed class ForgetPasswordIntent {}

class OnButtonCLickedIntent extends ForgetPasswordIntent {
  final String email;

  OnButtonCLickedIntent(this.email);
}
