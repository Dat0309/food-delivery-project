import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/controller/restaurant_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/home/restaurant_list_tile.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class PopularRestaurant extends StatefulWidget {
  const PopularRestaurant({Key? key}) : super(key: key);

  @override
  State<PopularRestaurant> createState() => _PopularRestaurantState();
}

class _PopularRestaurantState extends State<PopularRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.widthPadding25,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(
                text: 'Nhà Hàng Thịnh Hành',
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              const BigText(
                text: '|',
                color: AppColors.pargColor,
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              const SmallText(
                text: 'Nhà hàng đánh giá cao',
                color: AppColors.pargColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.heightPadding20,
        ),
      ],
    );
  }
}
