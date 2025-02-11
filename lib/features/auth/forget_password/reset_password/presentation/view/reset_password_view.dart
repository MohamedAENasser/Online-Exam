import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/features/auth/widgets/custom_button.dart';
import 'package:flutter_application_1/features/auth/widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_text_styles.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Reset password',
              style: AppTextStyles.forgetPassword,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              AppStrings.resetPasswordDesc,
              style: AppTextStyles.forgetPasswordDesc,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomTextFormField(
              hintText: 'Enter your password',
              controller: newPasswordController,
              labelText: 'New password',
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextFormField(
              hintText: 'Confirm password',
              controller: confirmPasswordController,
              labelText: 'Confirm password',
            ),
            SizedBox(
              height: 48.h,
            ),
            CustomButton(
              color: AppColors.darkBlue,
              text: 'Continue',
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
