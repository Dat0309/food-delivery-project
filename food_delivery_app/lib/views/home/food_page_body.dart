import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
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
      children: [
        SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, pos) {
                return _buildPageItem(pos);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: curPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryBgColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int pos) {
    Matrix4 matrix = Matrix4.identity();

    if (pos == curPageValue.floor()) {
      var curScale = 1 - (curPageValue - pos) * (1 - scaleFactor);
      var curTrans = Dimensions.pageViewContainer * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (pos == curPageValue.floor() + 1) {
      var curScale = scaleFactor + (curPageValue - pos + 1) * (1 - scaleFactor);
      var curTrans = Dimensions.pageViewContainer * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (pos == curPageValue.floor() - 1) {
      var curScale = 1 - (curPageValue - pos) * (1 - scaleFactor);
      var curTrans = Dimensions.pageViewContainer * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else {
      var curScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(
            0, Dimensions.pageViewContainer * (1 - scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
              left: Dimensions.widthPadding10,
              right: Dimensions.widthPadding10,
            ),
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
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimensions.widthPadding30,
                right: Dimensions.widthPadding30,
                bottom: Dimensions.heightPadding30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.buttoBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor!,
                    blurRadius: 5.0,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.heightPadding15,
                  left: Dimensions.widthPadding15,
                  right: Dimensions.widthPadding15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: Dimensions.heightPadding10),
                      child: BigText(
                        text: 'Food name',
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: Dimensions.heightPadding20),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: Dimensions.heightPadding10),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
