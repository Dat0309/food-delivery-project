import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class BookingCounter extends StatefulWidget {
  final VoidCallback onAddQuantity;
  final VoidCallback onSubQuantity;
  const BookingCounter({
    Key? key,
    required this.onAddQuantity,
    required this.onSubQuantity,
  }) : super(key: key);

  @override
  State<BookingCounter> createState() => _BookingCounterState();
}

class _BookingCounterState extends State<BookingCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.buttoBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.radius30 + 10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {},
            child: const AppIcon(
              icon: Icons.remove,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.radius20),
            child: SmallText(text: '1'),
          ),
          GestureDetector(
            onTap: () {},
            child: const AppIcon(
              icon: Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
