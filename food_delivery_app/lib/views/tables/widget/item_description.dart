import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: Colors.white,
                size: 10,
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              const BigText(
                text: 'Trống',
                color: Colors.white,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: AppColors.signColor,
                size: Dimensions.radius15,
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              const BigText(
                text: 'Đã được đặt',
                color: AppColors.signColor,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: AppColors.thirthColor,
                size: Dimensions.radius15,
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              const BigText(
                text: 'Bạn chọn',
                color: AppColors.thirthColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
