import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/di/di.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/auth/sign_up/presentation/viewModel/sign_up_cubit.dart';
import 'package:flutter_application_1/features/auth/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_text_form_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late TextEditingController userNameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
  }

  var cubit = getIt<SignUpCubit>();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'User name',
                  hintText: 'Enter your user name',
                  controller: userNameController,
                  validator: (input) {
                    return validate(
                      input: input,
                      textError: 'this user name is not valid',
                    );
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'First name',
                        hintText: 'Enter first name',
                        controller: firstNameController,
                        validator: (input) {
                          return validate(
                            input: input,
                            textError: 'first name is empty',
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'Last name',
                        hintText: 'Enter last name',
                        controller: lastNameController,
                        validator: (input) {
                          return validate(
                            input: input,
                            textError: 'last name is empty',
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormField(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  controller: emailController,
                  validator: (input) {
                    return validate(
                      input: input,
                      textError: 'this Email is not valid',
                    );
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'password',
                        hintText: 'Enter password',
                        controller: passwordController,
                        obscureText: true,
                        validator: (input) {
                          return validate(
                            input: input,
                            textError: 'password is empty',
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'Confirm password',
                        hintText: 'Confirm password',
                        controller: confirmPasswordController,
                        obscureText: true,
                        validator: (input) {
                          if (input == null ||
                              input.trim().isEmpty ||
                              passwordController.text !=
                                  confirmPasswordController.text) {
                            return 'password not matched';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormField(
                  labelText: 'Phone number',
                  hintText: 'Enter phone number',
                  controller: phoneNumberController,
                  validator: (input) {
                    return validate(
                      input: input,
                      textError: 'phone number is empty',
                    );
                  },
                ),
                SizedBox(
                  height: 48.h,
                ),
                BlocProvider(
                  create: (context) => cubit,
                  child: BlocConsumer<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      // TODO: navigation to login or home view
                      if (state is SignUpSuccess) {
                        log('Successssssss');
                      } else if (state is SignUpError) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              state.apiErrorModel.message ?? '',
                            ),
                          ),
                        );
                        log(state.apiErrorModel.message ?? '');
                      }
                    },
                    builder: (context, state) {
                      return SizedBox(
                        height: 48.h,
                        width: double.maxFinite,
                        child: CustomButton(
                          color: AppColors.darkBlue,
                          text: 'SignUp',
                          widget: state is SignUpLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.white,
                                  ),
                                )
                              : null,
                          onPressed: () {
                            if (!formKey.currentState!.validate()) return;

                            cubit.doIntent(
                              OnSignUpButtonClicked(
                                userName: userNameController.text,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                phoneNumber: phoneNumberController.text,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ? ',
                      style: AppTextStyles.alreadyHaveAnAccount,
                    ),
                    Text(
                      'login',
                      style: AppTextStyles.alreadyHaveAnAccountLogin,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validate({
    required String? input,
    required String textError,
  }) {
    if (input == null || input.trim().isEmpty) {
      return textError;
    }
    return null;
  }
}
