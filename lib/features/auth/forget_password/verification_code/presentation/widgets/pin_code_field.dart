import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';

class PinCodeField extends StatefulWidget {
  const PinCodeField({super.key});

  @override
  State<PinCodeField> createState() => _PinCodeFieldState();
}

class _PinCodeFieldState extends State<PinCodeField> {
  final defaultPinTheme = PinTheme(
    width: 74.w,
    height: 68.h,
    textStyle: const TextStyle(
      fontSize: 20,
      color: AppColors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: AppColors.babyBlue,
      borderRadius: BorderRadius.circular(10),
    ),
  );
  final focusedPinTheme = PinTheme(
    width: 74.w,
    height: 68.h,
    textStyle: const TextStyle(
      fontSize: 20,
      color: AppColors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: AppColors.babyBlue,
      borderRadius: BorderRadius.circular(10),
    ),
  );
  final errorPinTheme = PinTheme(
    width: 74.w,
    height: 68.h,
    textStyle: const TextStyle(
      fontSize: 20,
      color: AppColors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(
        color: AppColors.error,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      errorPinTheme: errorPinTheme,
      errorBuilder: (a, b) {
        return errorBuilder();
      },
      onCompleted: (pin) => log(pin),
      validator: (pin) {
        if (pin == '1111') {
          return 'not valid';
        }
        return null;
      },
    );
  }

  Widget errorBuilder() => Padding(
    padding:  REdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.error_outline,
          color: AppColors.error,
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          'Invalid code',
          style: AppTextStyles.invalidCode,
        )
      ],
    ),
  );
}
