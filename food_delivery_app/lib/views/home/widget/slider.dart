import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/models/Product.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/food_detail/food_detail.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SliderCustom extends StatefulWidget {
  final PageController pageController;
  final double curPageValue;
  final double scaleFactor;

  const SliderCustom({
    Key? key,
    required this.pageController,
    required this.curPageValue,
    required this.scaleFactor,
  }) : super(key: key);

  @override
  State<SliderCustom> createState() => _SliderState();
}

class _SliderState extends State<SliderCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<ProductController>(builder: (products) {
          return products.isLoaded
              ? SizedBox(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: widget.pageController,
                      itemCount: 5,
                      itemBuilder: (context, pos) {
                        return _buildPageItem(
                            pos, products.popularProducts[pos]);
                      }),
                )
              : SizedBox(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: widget.pageController,
                      itemCount: 2,
                      itemBuilder: (context, pos) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: Dimensions.pageViewContainer,
                            margin: EdgeInsets.only(
                              left: Dimensions.widthPadding10,
                              right: Dimensions.widthPadding10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.primaryBgColor,
                            ),
                          ),
                        );
                      }),
                );
        }),
        DotsIndicator(
          dotsCount: 5,
          position: widget.curPageValue,
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

  // make animation for page slider.
  Widget _buildPageItem(int pos, Product product) {
    Matrix4 matrix = Matrix4.identity();

    if (pos == widget.curPageValue.floor()) {
      var curScale = 1 - (widget.curPageValue - pos) * (1 - widget.scaleFactor);
      var curTrans = Dimensions.pageViewContainer * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (pos == widget.curPageValue.floor() + 1) {
      var curScale = widget.scaleFactor +
          (widget.curPageValue - pos + 1) * (1 - widget.scaleFactor);
      var curTrans = Dimensions.pageViewContainer * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (pos == widget.curPageValue.floor() - 1) {
      var curScale = 1 - (widget.curPageValue - pos) * (1 - widget.scaleFactor);
      var curTrans = Dimensions.pageViewContainer * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else {
      var curScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(
            0, Dimensions.pageViewContainer * (1 - widget.scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () {
          Get.to(FoodDetail(product: product));
        },
        child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                left: Dimensions.widthPadding10,
                right: Dimensions.widthPadding10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.signColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.image!),
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
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
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
                          text: product.name,
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
                              text:
                                  '${product.rating}  |  ${product.numReview} Đánh giá',
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
                            text: '${product.price.toString()} Đ',
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
      ),
    );
  }
}
