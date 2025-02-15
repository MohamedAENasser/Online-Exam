part of 'sign_up_cubit.dart';

enum SignUpStatus {
  initial,
  loading,
  success,
  error,
}

extension SignUpStatusEx on SignUpState {
  bool get isInitial => state == SignUpStatus.initial;

  bool get isLoading => state == SignUpStatus.loading;

  bool get isSuccess => state == SignUpStatus.success;

  bool get isError => state == SignUpStatus.error;
}

class SignUpState extends Equatable {
  SignUpStatus state;
  final ApiErrorModel? apiErrorModel;

  SignUpState({
    this.apiErrorModel,
    this.state = SignUpStatus.initial,
  });

  SignUpState copyWith({
    SignUpStatus? state,
    ApiErrorModel? apiErrorModel,
  }) {
    return SignUpState(
      state: state ?? this.state,
      apiErrorModel: apiErrorModel ?? this.apiErrorModel,
    );
  }

  @override
  List<Object?> get props => [
        state,
        apiErrorModel,
      ];
}

// sealed class SignUpState {}
//
// class SignUpInitial extends SignUpState {}
//
// class SignUpLoading extends SignUpState {}
//
// class SignUpSuccess extends SignUpState {}
//
// class SignUpError extends SignUpState {
// ApiErrorModel apiErrorModel;
//   SignUpError({
// required this.apiErrorModel
//   });
// }
