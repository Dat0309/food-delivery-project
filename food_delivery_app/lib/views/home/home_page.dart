import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/views/home/food_page_body.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // AppBar custom
          Container(
            margin: EdgeInsets.only(
                top: size.height / 15, bottom: size.height / 48),
            padding:
                EdgeInsets.only(left: size.width / 24, right: size.width / 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: 'Quốc gia',
                      color: AppColors.primaryColor,
                      size: size.width / 18,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: 'Thành phố',
                          size: size.width / 28,
                        ),
                        const Icon(
                          Icons.arrow_drop_down_rounded,
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: size.width / 8,
                    height: size.height / 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryColor,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: size.height / 32,
                    ),
                  ),
                )
              ],
            ),
          ),
          // Slider custom
          const FoodPageBody(),
        ],
      ),
    );
  }
}
