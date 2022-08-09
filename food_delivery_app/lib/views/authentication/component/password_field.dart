import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class PasswordField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final IconData suffixIcon;
  final TextEditingController controller;

  const PasswordField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.suffixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
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
              widget.icon,
              color: Colors.white70,
            ),
            SizedBox(
              width: Dimensions.widthPadding30,
            ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                maxLines: 1,
                cursorColor: Colors.white70,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: Dimensions.font16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    fontSize: Dimensions.font16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    widget.suffixIcon,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
