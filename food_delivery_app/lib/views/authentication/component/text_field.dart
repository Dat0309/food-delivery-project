import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class TextFieldCustom extends StatelessWidget {
  final String hint;
  final IconData icon;

  const TextFieldCustom({
    Key? key,
    required this.hint,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Dimensions.screenHeight / 13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        color: AppColors.primaryBgColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.heightPadding15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white70,
            ),
            SizedBox(
              width: Dimensions.widthPadding30,
            ),
            Expanded(
              child: TextField(
                maxLines: 1,
                cursorColor: Colors.white70,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: Dimensions.font16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: Dimensions.font16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
