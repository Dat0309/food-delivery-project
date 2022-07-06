import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expanable_text_widget.dart';
import 'package:food_delivery_app/widgets/icon_and_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({Key? key}) : super(key: key);

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 370,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/food1.jpg',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.heightPadding60 + 5,
            left: Dimensions.widthPadding20,
            right: Dimensions.widthPadding20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.height350,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.widthPadding20,
                right: Dimensions.widthPadding20,
                top: Dimensions.heightPadding20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: Dimensions.heightPadding10),
                        child: BigText(
                          text: 'Food name',
                          size: Dimensions.font32,
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
                  SizedBox(
                    height: Dimensions.heightPadding20,
                  ),
                  BigText(
                    text: 'Chi tiết sản phẩm',
                    color: AppColors.titleColor,
                    size: Dimensions.font24,
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: ExpandableTextWidget(
                        text:
                            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: Dimensions.heightPadding10,
          left: Dimensions.widthPadding10,
          right: Dimensions.widthPadding10,
        ),
        height: Dimensions.height140,
        padding: EdgeInsets.only(
          top: Dimensions.heightPadding30,
          bottom: Dimensions.heightPadding30,
          left: Dimensions.widthPadding20,
          right: Dimensions.widthPadding20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20 * 2),
          color: AppColors.buttoBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.heightPadding20,
                bottom: Dimensions.heightPadding20,
                left: Dimensions.widthPadding20,
                right: Dimensions.widthPadding20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.widthPadding5,
                  ),
                  BigText(text: '0'),
                  SizedBox(
                    width: Dimensions.widthPadding5,
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.heightPadding20,
                bottom: Dimensions.heightPadding20,
                left: Dimensions.widthPadding20,
                right: Dimensions.widthPadding20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.primaryBgColor,
              ),
              child: BigText(
                text: '53.200 đ | Thêm vào giỏ hàng',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
