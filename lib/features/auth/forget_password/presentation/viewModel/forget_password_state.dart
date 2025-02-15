part of 'forget_password_cubit.dart';

enum ForgetPasswordStatus {
  initial,
  loading,
  success,
  error,
}

extension ForgetPasswordStatusEx on ForgetPasswordState {
  bool get isInitial => state == ForgetPasswordStatus.initial;

  bool get isLoading => state == ForgetPasswordStatus.loading;

  bool get isSuccess => state == ForgetPasswordStatus.success;

  bool get isError => state == ForgetPasswordStatus.error;
}

class ForgetPasswordState extends Equatable {
  ForgetPasswordStatus state;
  final ApiErrorModel? apiErrorModel;

  ForgetPasswordState({
    this.apiErrorModel,
    this.state = ForgetPasswordStatus.initial,
  });

  ForgetPasswordState copyWith({
    ForgetPasswordStatus? state,
    ApiErrorModel? apiErrorModel,
  }) {
    return ForgetPasswordState(
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

// class ForgetPasswordInitial extends ForgetPasswordState {}
//
// class ForgetPasswordLoading extends ForgetPasswordState {}
//
// class ForgetPasswordSuccess extends ForgetPasswordState {}
//
// class ForgetPasswordError extends ForgetPasswordState {
//   ApiErrorModel apiErrorModel;
//
//   ForgetPasswordError({
//     required this.apiErrorModel,
//   });
// }
