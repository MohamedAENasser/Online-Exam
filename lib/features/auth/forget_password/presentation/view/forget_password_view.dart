import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/extensions/validate_ex.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/auth/forget_password/verification_code/presentation/view/verification_code_view.dart';
import 'package:flutter_application_1/features/auth/forget_password/viewModel/forget_password_cubit.dart';
import 'package:flutter_application_1/features/auth/widgets/custom_button.dart';
import 'package:flutter_application_1/features/auth/widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey();
  var cubit = getIt<ForgetPasswordCubit>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Password',
        ),
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccess) {
              log('Successsss');
            }
          },
          builder: (context, state) {
            switch (state) {
              case ForgetPasswordInitial():
                return Padding(
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
                          'Forget passsword',
                          style: AppTextStyles.forgetPassword,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Please enter your email associated to\nyour account',
                          style: AppTextStyles.forgetPasswordDesc,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomTextFormField(
                          hintText: 'Enter your email',
                          controller: emailController,
                          labelText: 'Email',
                          validator: (input) {
                            if (input == null ||
                                input.trim().isEmpty ||
                                !input.validate) {
                              return 'Email is not valid';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        SizedBox(
                          height: 48.h,
                          child: CustomButton(
                            color: AppColors.darkBlue,
                            text: 'Continue',
                            widget: state is ForgetPasswordLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.white,
                                    ),
                                  )
                                : null,
                            onPressed: () {
                              if (!formKey.currentState!.validate()) return;
                              cubit.forgetPassword(email: emailController.text);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              case ForgetPasswordLoading():
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.darkBlue,
                  ),
                );
              case ForgetPasswordSuccess():
                return const VerificationCodeView();
              case ForgetPasswordError():
                return Text(
                  state.message ?? state.exception.toString(),
                );
            }
          },
        ),
      ),
    );
  }
}
