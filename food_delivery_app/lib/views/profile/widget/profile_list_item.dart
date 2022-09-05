import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.heightPadding45 + 10,
      margin:
          EdgeInsets.symmetric(horizontal: Dimensions.widthPadding40).copyWith(
        bottom: Dimensions.widthPadding20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.widthPadding20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.shadowColor,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: Dimensions.widthPadding25,
          ),
          SizedBox(
            width: Dimensions.widthPadding15,
          ),
          BigText(text: text),
          const Spacer(),
          if (hasNavigation)
            Icon(
              Icons.arrow_right_rounded,
              size: Dimensions.widthPadding25,
            ),
        ],
      ),
    );
  }
}
