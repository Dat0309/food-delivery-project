import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';

import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/home/popular_list.dart';
import 'package:food_delivery_app/views/home/popular_restaurant.dart';
import 'package:food_delivery_app/views/home/slider.dart';
import 'package:food_delivery_app/views/home/widget_categories.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var curPageValue = 0.0;
  double scaleFactor = 0.8;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        curPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.toString());
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderCustom(
          pageController: pageController,
          curPageValue: curPageValue,
          scaleFactor: scaleFactor,
        ),
        SizedBox(
          height: Dimensions.heightPadding30,
        ),
        const WidgetCategories(),
        SizedBox(
          height: Dimensions.heightPadding30,
        ),
        const PopularRestaurant(),
        SizedBox(
          height: Dimensions.heightPadding30,
        ),
        const PopularList(),
      ],
    );
  }
}
