import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/app_routes.dart';
import 'package:flutter_application_1/features/auth/forget_password/presentation/view/forget_password_view.dart';
import 'package:flutter_application_1/features/auth/forget_password/reset_password/presentation/view/reset_password_view.dart';
import 'package:flutter_application_1/features/auth/forget_password/verification_code/presentation/view/verification_code_view.dart';
import 'package:flutter_application_1/features/auth/sign_up/presentation/view/sign_up_view.dart';

abstract class AppRouter {
  static Route? router(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
        );

      case AppRoutes.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView(),
        );


    }
    return null;
  }
}
