part of 'sign_up_cubit.dart';

sealed class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpError extends SignUpState {
ApiErrorModel apiErrorModel;
  SignUpError({
required this.apiErrorModel
  });
}
