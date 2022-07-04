import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String? text;
  final double? size;
  final double? height;

  const SmallText({
    Key? key,
    this.color = AppColors.mainBlackColor,
    required this.text,
    this.size = 15,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: 1,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}
