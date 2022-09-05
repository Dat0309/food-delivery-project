import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/food_detail/food_detail.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesListProduct extends StatefulWidget {
  const CategoriesListProduct({Key? key}) : super(key: key);

  @override
  State<CategoriesListProduct> createState() => _CategoriesListProductState();
}

class _CategoriesListProductState extends State<CategoriesListProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.heightPadding20,
        ),
        // list
        GetBuilder<ProductController>(builder: (products) {
          return products.isLoadedCategoryProducts
              ? SizedBox(
                  height: Dimensions.height1000 + 500,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: products.categoryProducts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Get.to(() => FoodDetail(
                                  product: products.categoryProducts[index],
                                ));
                          },
                          child: productCard(products, index));
                    },
                  ),
                )
              : SizedBox(
                  height: Dimensions.height1000,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
                            Shimmer.fromColors(
                              child: Container(
                                width: Dimensions.width140,
                                height: Dimensions.height140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: AppColors.pargColor,
                                ),
                              ),
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.height140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                  color: AppColors.buttoBackgroundColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.widthPadding10,
                                    right: Dimensions.widthPadding10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
        }),
      ],
    );
  }

  Container productCard(ProductController products, int index) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.widthPadding25,
        right: Dimensions.widthPadding25,
        bottom: Dimensions.heightPadding10,
      ),
      child: Row(
        children: [
          Container(
            width: Dimensions.width140,
            height: Dimensions.height140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: AppColors.pargColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(products.categoryProducts[index].image),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: Dimensions.height140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  bottomRight: Radius.circular(Dimensions.radius20),
                ),
                color: AppColors.buttoBackgroundColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.widthPadding10,
                  right: Dimensions.widthPadding10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigText(
                      text: products.categoryProducts[index].name,
                    ),
                    SmallText(
                      text: products.categoryProducts[index].description,
                      color: AppColors.pargColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndText(
                          icon: Icons.circle_sharp,
                          text:
                              '${products.categoryProducts[index].price.toString()} VNĐ',
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
                          text: '32\'',
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
