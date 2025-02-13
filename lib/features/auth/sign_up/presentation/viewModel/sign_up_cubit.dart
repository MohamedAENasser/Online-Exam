import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/utils/result.dart';
import 'package:flutter_application_1/features/auth/data/model/api_error_model.dart';
import 'package:flutter_application_1/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  @factoryMethod
  SignUpCubit({required this.useCase}) : super(SignUpInitial());
  SignUpUseCase useCase;

  void doIntent(SignUpIntent intent) {
    switch (intent) {
      case OnSignUpButtonClicked():
        _signUp(
          userName: intent.userName,
          firstName: intent.firstName,
          lastName: intent.lastName,
          email: intent.email,
          password: intent.password,
          confirmPassword: intent.confirmPassword,
          phoneNumber: intent.phoneNumber,
        );
    }
  }

  void _signUp({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  }) async {
    emit(SignUpLoading());
    var result = await useCase.execute(
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      phoneNumber: phoneNumber,
    );
    switch (result) {
      case Success<UserEntity?>():
        emit(SignUpSuccess());
      case Error<UserEntity?>():
        emit(SignUpError(apiErrorModel: result.apiErrorModel));
    }
  }
}

sealed class SignUpIntent {}

class OnSignUpButtonClicked extends SignUpIntent {
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;

  OnSignUpButtonClicked({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
  });
}
