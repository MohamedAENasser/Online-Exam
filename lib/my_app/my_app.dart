import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/app_router.dart';
import 'package:flutter_application_1/core/routing/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          initialRoute: AppRoutes.forgetPassword,
          onGenerateRoute: AppRouter.router,
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
