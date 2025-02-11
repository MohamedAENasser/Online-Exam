import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/utils/app_text_styles.dart';
import '../widgets/pin_code_field.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const PinCodeField(),
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
            Text(
              'Resend',
              style: AppTextStyles.alreadyHaveAnAccountLogin,
            ),
          ],
        )
      ],
    );
  }
}
