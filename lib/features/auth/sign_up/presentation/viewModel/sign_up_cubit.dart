import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/utils/result.dart';
import 'package:flutter_application_1/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  @factoryMethod
  SignUpCubit({required this.useCase}) : super(SignUpInitial());
  SignUpUseCase useCase;

  void signUp({
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
      case Success<UserEntity>():
        emit(SignUpSuccess());
      case ServerError<UserEntity>():
        emit(SignUpError(message: result.message));
      case Error<UserEntity>():
        emit(SignUpError(exception: result.exception));
    }
  }
}
