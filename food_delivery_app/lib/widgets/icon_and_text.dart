import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Color? textColor;
  final Color? iconColor;

  const IconAndText({
    Key? key,
    required this.icon,
    required this.text,
    required this.textColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        SizedBox(
          width: Dimensions.widthPadding5,
        ),
        SmallText(
          text: text,
          color: textColor,
        ),
      ],
    );
  }
}
