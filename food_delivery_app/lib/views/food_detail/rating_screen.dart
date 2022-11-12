import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/restaurant_controller.dart';
import 'package:food_delivery_app/models/Product.dart';
import 'package:food_delivery_app/models/Restaurant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/food_detail/food_detail.dart';
import 'package:food_delivery_app/views/food_detail/widget/rating_overview.dart';
import 'package:food_delivery_app/views/food_detail/widget/rating_widget.dart';
import 'package:food_delivery_app/views/home/home_page.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingScreen extends StatefulWidget {
  final Product? product;
  final Restaurant? restaurant;
  const RatingScreen({Key? key, this.product, this.restaurant})
      : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 0.0;
  var commentController = TextEditingController();
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
              child: widget.product != null
                  ? Column(
                      children: [
                        RatingOverview(
                          rating: widget.product!.rating!,
                          numReviews: widget.product!.numReview!,
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return RatingWidget(
                                  image: widget.product!.reviews![index]
                                      ['image'],
                                  name: widget.product!.reviews![index]['name'],
                                  date: widget
                                      .product!.reviews![index]['createdAt']
                                      .toString()
                                      .split('T')[0],
                                  comment: widget.product!.reviews![index]
                                      ['comment'],
                                  rating: widget.product!.reviews![index]
                                      ['rating'],
                                  onPressed: () {},
                                  onTap: () {});
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                thickness: 2.0,
                                color: AppColors.primaryColor,
                              );
                            },
                            itemCount: widget.product!.reviews!.length,
                          ),
                        ),
                      ],
                    )
                  : widget.restaurant != null
                      ? Column(
                          children: [
                            RatingOverview(
                              rating: widget.restaurant!.rating!,
                              numReviews: widget.restaurant!.numReviews!,
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return RatingWidget(
                                      image: widget.restaurant!.reviews![index]
                                          ['image'],
                                      name: widget.restaurant!.reviews![index]
                                          ['name'],
                                      date: widget.restaurant!
                                          .reviews![index]['createdAt']
                                          .toString()
                                          .split('T')[0],
                                      comment: widget.restaurant!
                                          .reviews![index]['comment'],
                                      rating: widget.restaurant!.reviews![index]
                                          ['rating'],
                                      onPressed: () {},
                                      onTap: () {});
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    thickness: 2.0,
                                    color: AppColors.primaryColor,
                                  );
                                },
                                itemCount: widget.restaurant!.reviews!.length,
                              ),
                            ),
                          ],
                        )
                      : Container(),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<ProductController>(builder: (productController) {
        return Container(
          margin: EdgeInsets.only(
            bottom: Dimensions.heightPadding10,
            left: Dimensions.heightPadding10,
            right: Dimensions.heightPadding10,
          ),
          height: Dimensions.height140,
          padding: EdgeInsets.only(
            top: Dimensions.heightPadding30,
            bottom: Dimensions.heightPadding30,
            left: Dimensions.widthPadding20,
            right: Dimensions.widthPadding20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20 + 2),
            color: AppColors.buttoBackgroundColor,
          ),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  isScrollControlled: true,
                  isDismissible: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.heightPadding20,
                      ),
                      child: SizedBox(
                        height: Dimensions.screenHeight * 0.7,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.clear),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.heightPadding20,
                            ),
                            SmoothStarRating(
                              starCount: 5,
                              rating: 0,
                              size: Dimensions.heightPadding60,
                              color: AppColors.yellowColor,
                              borderColor: AppColors.yellowColor,
                              onRated: (v) {
                                setState(() {
                                  rating = v;
                                });
                              },
                            ),
                            SizedBox(
                              height: Dimensions.heightPadding20,
                            ),
                            TextFormField(
                              minLines: 4,
                              controller: commentController,
                              maxLines: 6,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: 'Viết bình luận đánh giá',
                                hintStyle: const TextStyle(
                                  color: AppColors.primaryColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.radius15)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.heightPadding20,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (widget.product != null) {
                                  productController
                                      .productReview(widget.product!.id!,
                                          rating, commentController.text)
                                      .then((value) {
                                    if (value['status']) {
                                      Get.snackbar(
                                          'Hệ thống', value['message']);
                                      Get.off(() => const HomePage());
                                    } else {
                                      Get.snackbar('Hệ thống',
                                          'Có lỗi trong quá trình xử lý, xin thử lại sau!');
                                    }
                                  });
                                } else if (widget.restaurant != null) {
                                  Get.find<RestaurantController>()
                                      .restaurantReview(widget.restaurant!.id!,
                                          rating, commentController.text)
                                      .then((value) {
                                    if (value['status']) {
                                      Get.snackbar(
                                          'Hệ thống', value['message']);
                                      Get.off(() => const HomePage());
                                    } else {
                                      Get.snackbar('Hệ thống',
                                          'Có lỗi trong quá trình xử lý, xin thử lại sau!');
                                    }
                                  });
                                }
                              },
                              child: Container(
                                width: Dimensions.widthPadding100 + 160,
                                padding: EdgeInsets.only(
                                  top: Dimensions.heightPadding20,
                                  bottom: Dimensions.heightPadding20,
                                  left: Dimensions.widthPadding20,
                                  right: Dimensions.widthPadding20,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: AppColors.primaryColor,
                                ),
                                child: const Center(
                                  child: BigText(
                                    text: 'Đánh giá',
                                    color: Colors.white,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              width: Dimensions.widthPadding100 + 160,
              padding: EdgeInsets.only(
                top: Dimensions.heightPadding20,
                bottom: Dimensions.heightPadding20,
                left: Dimensions.widthPadding20,
                right: Dimensions.widthPadding20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.primaryColor,
              ),
              child: const Center(
                child: BigText(
                  text: 'Đánh giá',
                  color: Colors.white,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
