import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String image;
  const NoDataPage({
    Key? key,
    required this.text,
    this.image = "assets/images/cart-is-empty.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: Dimensions.screenHeight * 0.22,
          width: Dimensions.screenWidth * 0.22,
        ),
        SizedBox(
          height: Dimensions.screenHeight * 0.03,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: Dimensions.screenHeight * 0.0175,
            color: AppColors.pargColor,
          ),
        )
      ],
    );
  }
}
