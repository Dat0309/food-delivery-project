import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';

import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/home/slider.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
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
      children: [
        SliderCustom(
          pageController: pageController,
          curPageValue: curPageValue,
          scaleFactor: scaleFactor,
        ),
        SizedBox(
          height: Dimensions.heightPadding30,
        ),
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.widthPadding25,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: 'Thịnh hành',
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              Container(
                child: BigText(
                  text: '|',
                  color: AppColors.pargColor,
                ),
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              Container(
                child: SmallText(
                  text: 'Đồ ăn ngon',
                  color: AppColors.pargColor,
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: Dimensions.heightPadding20,
        ),
        // list
        Container(
          height: 1000,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.widthPadding25,
                    right: Dimensions.widthPadding25,
                    bottom: Dimensions.heightPadding10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.pargColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/food1.jpg'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: AppColors.buttoBackgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
