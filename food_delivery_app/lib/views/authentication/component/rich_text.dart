import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class RichTextCustom extends StatelessWidget {
  final String headerText;
  final String footerText;
  final double fontSize;

  const RichTextCustom({
    Key? key,
    required this.headerText,
    required this.footerText,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.white,
          fontSize: fontSize == 0 ? Dimensions.heightPadding20 : fontSize,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: headerText,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: footerText,
            style: const TextStyle(
              color: AppColors.thirthColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
