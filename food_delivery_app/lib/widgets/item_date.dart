import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/models/DateTimeModel.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ItemDate extends StatelessWidget {
  final DateTimeModel date;
  const ItemDate({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(right: Dimensions.radius8),
        child: Container(
          height: Dimensions.height120 - 20,
          width: Dimensions.widthPadding60 + 15,
          decoration: BoxDecoration(
            color: AppColors.signColor,
            borderRadius: BorderRadius.circular(Dimensions.radius15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                color: const Color(0xff21242c).withOpacity(.8),
                size: Dimensions.radius15,
              ),
              SizedBox(
                height: Dimensions.heightPadding10,
              ),
              SmallText(
                text: date.day,
                color: Colors.white,
              ),
              SizedBox(
                height: Dimensions.heightPadding10,
              ),
              BigText(
                text: date.number,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
