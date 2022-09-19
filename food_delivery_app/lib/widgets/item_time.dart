import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class ItemTime extends StatelessWidget {
  final String time;
  const ItemTime({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Dimensions.radius8),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.radius15),
          decoration: BoxDecoration(
            color: AppColors.signColor,
            borderRadius: BorderRadius.circular(Dimensions.radius8),
          ),
          child: BigText(text: time),
        ),
      ),
    );
  }
}
