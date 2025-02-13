import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/features/auth/forget_password/reset_password/presentation/viewModel/reset_password_cubit.dart';
import 'package:flutter_application_1/features/auth/forget_password/verification_code/presentation/viewModel/verification_code_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../reset_password/presentation/view/reset_password_view.dart';
import '../widgets/pin_code_field.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCodeCubit, VerificationCodeState>(
      builder: (context, state) {
        switch (state) {
          case VerificationCodeLoading():
            return const LoadingWidget();
          case VerificationCodeSuccess():
            return BlocProvider(
              create: (context) => getIt<ResetPasswordCubit>(),
              child: ResetPasswordView(
                email: email,
              ),
            );
          case ResendVerificationCodeLoading():
            return const LoadingWidget();
        }
        return buildVerificationCodeView(context);
      },
    );
  }

  Widget buildVerificationCodeView(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Text(
            'Email verification',
            style: AppTextStyles.forgetPassword,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            AppStrings.verificationCodeDesc,
            style: AppTextStyles.forgetPasswordDesc,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 32.h,
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: const PinCodeField(),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive code ? ",
                style: AppTextStyles.alreadyHaveAnAccount,
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<VerificationCodeCubit>(context).doIntent(
                    ResendVerificationCodeIntent(email),
                  );
                },
                child: Text(
                  'Resend',
                  style: AppTextStyles.alreadyHaveAnAccountLogin,
                ),
              ),
            ],
          )
        ],
      );
}
