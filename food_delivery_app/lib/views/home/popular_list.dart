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

class PopularList extends StatefulWidget {
  const PopularList({Key? key}) : super(key: key);

  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<ProductController>(builder: (product) {
          return product.isLoaded
              ? Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.widthPadding25,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const BigText(
                        text: 'Món Ăn Thịnh Hành',
                      ),
                      SizedBox(
                        width: Dimensions.widthPadding10,
                      ),
                      const BigText(
                        text: '|',
                        color: AppColors.pargColor,
                      ),
                      SizedBox(
                        width: Dimensions.widthPadding10,
                      ),
                      const SmallText(
                        text: 'Đồ ăn ngon',
                        color: AppColors.pargColor,
                      ),
                    ],
                  ),
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.widthPadding25,
                    ),
                    width: 300,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius8),
                      color: AppColors.signColor,
                    ),
                  ),
                );
        }),
        SizedBox(
          height: Dimensions.heightPadding20,
        ),
        // list
        GetBuilder<ProductController>(builder: (products) {
          return products.isLoaded
              ? SizedBox(
                  height: Dimensions.height1000 + 500,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: products.popularProducts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Get.to(() => FoodDetail(
                                  product: products.popularProducts[index],
                                ));
                          },
                          child: productCard(products, index));
                    },
                  ),
                )
              : SizedBox(
                  height: Dimensions.height1000 + 500,
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
                image: NetworkImage(products.popularProducts[index].image),
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
                      text: products.popularProducts[index].name,
                    ),
                    SmallText(
                      text: products.popularProducts[index].description,
                      color: AppColors.pargColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndText(
                          icon: Icons.circle_sharp,
                          text:
                              '${products.popularProducts[index].price.toString()} VNĐ',
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
