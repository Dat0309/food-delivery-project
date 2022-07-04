import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String? text;
  final double? size;
  final TextOverflow? textOverflow;

  const BigText({
    Key? key,
    this.color = AppColors.mainBlackColor,
    required this.text,
    this.size = 20,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
