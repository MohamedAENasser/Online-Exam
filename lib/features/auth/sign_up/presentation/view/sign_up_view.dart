import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/auth/widgets/custom_button.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: 'User name',
              hintText: 'Enter your user name',
              controller: userNameController,
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
              controller: emailController,
            ),
            SizedBox(
              height: 48.h,
            ),
            SizedBox(
              height: 48.h,
              width: double.maxFinite,
              child: CustomButton(
                color: AppColors.darkBlue,
                text: 'SignUp',
                onPressed: () {},
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
    );
  }
}
