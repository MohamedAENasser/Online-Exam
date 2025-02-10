import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Widget? widget;
  final VoidCallback? onPressed;
  final Color? color;
  final double? fontSize;

  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.color,
      this.fontSize,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              30,
            ),
          ),
        ),
      ),
      child: widget ??
          Text(
            text,
            style: AppTextStyles.button,
          ),
    );
  }
}
