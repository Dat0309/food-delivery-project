import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/models/Product.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/food_detail/widget/rating_overview.dart';
import 'package:food_delivery_app/views/food_detail/widget/rating_widget.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class RatingScreen extends StatefulWidget {
  final Product product;
  const RatingScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.heightPadding60 + 5,
            left: Dimensions.widthPadding20,
            right: Dimensions.widthPadding20,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                SizedBox(
                  width: Dimensions.widthPadding10,
                ),
                const BigText(text: 'Đánh giá'),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.heightPadding20 * 7,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.widthPadding20,
                right: Dimensions.widthPadding20,
                top: Dimensions.heightPadding20,
              ),
              child: Column(
                children: [
                  RatingOverview(
                    rating: widget.product.rating!,
                    numReviews: widget.product.numReview!,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return RatingWidget(
                            image: widget.product.reviews![index].image,
                            name: widget.product.reviews![index].name,
                            date: '01/11/2022',
                            comment: widget.product.reviews![index].comment,
                            rating: widget.product.reviews![index].rating,
                            onPressed: () {},
                            onTap: () {});
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 2.0,
                          color: AppColors.primaryColor,
                        );
                      },
                      itemCount: widget.product.reviews!.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
