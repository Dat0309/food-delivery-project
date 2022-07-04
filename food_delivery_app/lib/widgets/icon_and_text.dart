import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(
            width: 5,
          ),
          SmallText(
            text: text,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
