import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class ItemTime extends StatefulWidget {
  final String time;
  const ItemTime({Key? key, required this.time}) : super(key: key);

  @override
  State<ItemTime> createState() => _ItemTimeState();
}

class _ItemTimeState extends State<ItemTime> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Dimensions.radius8),
      child: InkWell(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.radius15),
          decoration: BoxDecoration(
            color: selected ? AppColors.thirthColor : AppColors.signColor,
            borderRadius: BorderRadius.circular(Dimensions.radius8),
          ),
          child: BigText(
            text: widget.time,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
