import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, pos) {
            return _buildPageItem(pos);
          }),
    );
  }

  Widget _buildPageItem(int pos) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.primaryBgColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(),
        ),
      ),
    );
  }
}
