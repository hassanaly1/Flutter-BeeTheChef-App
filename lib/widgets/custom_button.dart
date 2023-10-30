import 'package:beethechef/utilities/constants.dart';
import 'package:beethechef/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.width,
      this.buttonColor = AppAssets.primaryColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextWidget(
              text: buttonText,
              fSize: 16,
              textColor: textColor ?? Colors.white,
              fWeight: FontWeight.w600,
            ),
          ))),
    );
  }
}
