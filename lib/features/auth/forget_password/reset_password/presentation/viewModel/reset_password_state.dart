part of 'reset_password_cubit.dart';

enum ResetPasswordStatus {
  initial,
  loading,
  success,
  error,
}

extension ResetPasswordStatusEx on ResetPasswordState {
  bool get isInitial => state == ResetPasswordStatus.initial;

  bool get isLoading => state == ResetPasswordStatus.loading;

  bool get isSuccess => state == ResetPasswordStatus.success;

  bool get isError => state == ResetPasswordStatus.error;
}

class ResetPasswordState extends Equatable {
  ResetPasswordStatus state;
  final ApiErrorModel? apiErrorModel;

  ResetPasswordState({
    this.apiErrorModel,
    this.state = ResetPasswordStatus.initial,
  });

  ResetPasswordState copyWith({
    ResetPasswordStatus? state,
    ApiErrorModel? apiErrorModel,
  }) {
    return ResetPasswordState(
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

// class ResetPasswordState {}
//
// class ResetPasswordInitial extends ResetPasswordState {}
//
// class ResetPasswordLoading extends ResetPasswordState {}
//
// class ResetPasswordSuccess extends ResetPasswordState {}
//
// class ResetPasswordError extends ResetPasswordState {
// ApiErrorModel apiErrorModel;
//
//   ResetPasswordError({required this.apiErrorModel});
// }
