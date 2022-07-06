import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;

  const AppIcon({
    Key? key,
    required this.icon,
    this.backgroundColor = AppColors.primaryColor,
    this.iconColor = AppColors.secondaryColor,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size == 0 ? Dimensions.iconSize50 : size,
      height: size == 0 ? Dimensions.iconSize50 : size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            size == 0 ? Dimensions.iconSize50 / 2 : size / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: size == 0 ? Dimensions.iconSize16 : size,
      ),
    );
  }
}
