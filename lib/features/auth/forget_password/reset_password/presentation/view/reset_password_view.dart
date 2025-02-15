import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/features/auth/forget_password/reset_password/presentation/viewModel/reset_password_cubit.dart';
import 'package:flutter_application_1/features/auth/widgets/custom_button.dart';
import 'package:flutter_application_1/features/auth/widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../widgets/loading_widget.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey();

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
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state.isSuccess) {
          /// navigate to login
          log('successsss');
        } else if (state.isError) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                state.apiErrorModel?.message ?? '',
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingWidget();
        }
        return buildResetPasswordView();
      },
    );
  }

  Widget buildResetPasswordView() => Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
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
                obscureText: true,
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextFormField(
                hintText: 'Confirm password',
                controller: confirmPasswordController,
                labelText: 'Confirm password',
                obscureText: true,
                validator: (input) {
                  if (input == null ||
                      input.trim().isEmpty ||
                      newPasswordController.text !=
                          confirmPasswordController.text) {
                    return 'password not matched';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 48.h,
              ),
              CustomButton(
                color: AppColors.darkBlue,
                text: 'Continue',
                onPressed: () {
                  if (!formKey.currentState!.validate()) return;

                  BlocProvider.of<ResetPasswordCubit>(context).doIntent(
                    OnButtonClickedIntent(
                        widget.email, newPasswordController.text),
                  );
                },
              )
            ],
          ),
        ),
      );
}
