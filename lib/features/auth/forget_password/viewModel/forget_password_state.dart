part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {}

class ForgetPasswordError extends ForgetPasswordState {
  String? message ;
  Exception? exception;
  ForgetPasswordError({this.message,this.exception});
}
