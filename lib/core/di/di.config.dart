// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/api/api_manager.dart' as _i1023;
import '../../features/auth/data/datasource_contract/auth_datasource.dart'
    as _i707;
import '../../features/auth/data/datasource_impl/auth_datasource_impl.dart'
    as _i500;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/repo_contract/auth_repo.dart' as _i25;
import '../../features/auth/domain/usecases/forget_passsword_use_case.dart'
    as _i877;
import '../../features/auth/domain/usecases/reset_password_use_case.dart'
    as _i825;
import '../../features/auth/domain/usecases/sign_up_usecase.dart' as _i860;
import '../../features/auth/domain/usecases/verification_code_use_case.dart'
    as _i1024;
import '../../features/auth/forget_password/reset_password/presentation/viewModel/reset_password_cubit.dart'
    as _i535;
import '../../features/auth/forget_password/viewModel/forget_password_cubit.dart'
    as _i589;
import '../../features/auth/sign_up/presentation/viewModel/sign_up_cubit.dart'
    as _i1020;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1023.ApiManager>(() => _i1023.ApiManager());
    gh.factory<_i707.AuthDataSource>(
        () => _i500.AuthDataSourceImpl(apiManager: gh<_i1023.ApiManager>()));
    gh.factory<_i25.AuthRepo>(
        () => _i279.AuthRepoImpl(authDataSource: gh<_i707.AuthDataSource>()));
    gh.factory<VerificationCodeCubit>(() => VerificationCodeCubit(
          verificationCodeUseCase: gh<VerificationCodeUseCase>(),
          forgetPasswordUseCase: gh<ForgetPasswordUseCase>(),
        ));
    gh.factory<_i877.ForgetPasswordUseCase>(
        () => _i877.ForgetPasswordUseCase(repo: gh<_i25.AuthRepo>()));
    gh.factory<_i860.SignUpUseCase>(
        () => _i860.SignUpUseCase(repo: gh<_i25.AuthRepo>()));
    gh.factory<_i1024.VerificationCodeUseCase>(
        () => _i1024.VerificationCodeUseCase(repo: gh<_i25.AuthRepo>()));
    gh.factory<_i825.ResetPasswordUseCase>(
        () => _i825.ResetPasswordUseCase(repo: gh<_i25.AuthRepo>()));
    gh.factory<_i1020.SignUpCubit>(
        () => _i1020.SignUpCubit(useCase: gh<_i860.SignUpUseCase>()));
    gh.factory<_i535.ResetPasswordCubit>(() => _i535.ResetPasswordCubit(
        resetPasswordUseCase: gh<_i825.ResetPasswordUseCase>()));
    gh.factory<_i589.ForgetPasswordCubit>(() => _i589.ForgetPasswordCubit(
          forgetPasswordUseCase: gh<_i877.ForgetPasswordUseCase>(),
          verificationCodeUseCase: gh<_i1024.VerificationCodeUseCase>(),
          resetPasswordUseCase: gh<_i825.ResetPasswordUseCase>(),
        ));
    return this;
  }
}
