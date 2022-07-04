import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // AppBar custom
            Container(
              margin: EdgeInsets.only(bottom: Dimensions.heightPadding20),
              padding: EdgeInsets.only(
                top: Dimensions.heightPadding10,
                left: Dimensions.widthPadding40,
                right: Dimensions.widthPadding40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Quốc gia',
                        color: AppColors.primaryColor,
                        size: Dimensions.widthPaddinh25,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Thành phố',
                            size: Dimensions.widthPadding17,
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
                      width: Dimensions.widthPadding60,
                      height: Dimensions.heightPadding60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primaryColor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.heightPadding30,
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
      ),
    );
  }
}
