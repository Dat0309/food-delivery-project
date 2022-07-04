import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
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
    return Container(
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, pos) {
            return _buildPageItem(pos);
          }),
    );
  }

  Widget _buildPageItem(int pos) {
    Matrix4 matrix = Matrix4.identity();

    if (pos == curPageValue.floor()) {
      var curScale = 1 - (curPageValue - pos) * (1 - scaleFactor);
      var curTrans = 240 * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (pos == curPageValue.floor() + 1) {
      var curScale = scaleFactor + (curPageValue - pos + 1) * (1 - scaleFactor);
      var curTrans = 240 * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (pos == curPageValue.floor() - 1) {
      var curScale = 1 - (curPageValue - pos) * (1 - scaleFactor);
      var curTrans = 240 * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else {
      var curScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, 240 * (1 - scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 240,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.primaryBgColor,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/food1.jpg'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.buttoBackgroundColor,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: BigText(
                        text: 'Food name',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Wrap(
                              children: List.generate(
                                5,
                                (index) => const Icon(
                                  Icons.star,
                                  color: AppColors.yellowColor,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                          SmallText(
                            text: '4.5  |  1287 Đánh giá',
                            color: AppColors.signColor,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconAndText(
                          icon: Icons.circle_sharp,
                          text: 'Bình thường',
                          textColor: AppColors.signColor,
                          iconColor: AppColors.primaryIconColor,
                        ),
                        IconAndText(
                          icon: Icons.location_on,
                          text: '1.7km',
                          textColor: AppColors.signColor,
                          iconColor: AppColors.secondaryIconColor,
                        ),
                        IconAndText(
                          icon: Icons.access_time_rounded,
                          text: '32 phút',
                          textColor: AppColors.signColor,
                          iconColor: AppColors.secondaryIconColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
