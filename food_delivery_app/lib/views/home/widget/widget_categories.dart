import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/categories_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/categories/product_categories.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class WidgetCategories extends StatefulWidget {
  const WidgetCategories({Key? key}) : super(key: key);

  @override
  State<WidgetCategories> createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<CategoriesController>(builder: (category) {
          return category.isLoaded
              ? Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.widthPadding10,
                    right: Dimensions.widthPadding10,
                  ),
                  height: Dimensions.heightPadding45 + 10,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.find<ProductController>().getProductByCatId(
                                    category.categories[index].id);
                                Get.to(() => const ProductCategories());
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.all(Dimensions.widthPadding10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.radius30)),
                                  color: AppColors.signColor,
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.55),
                                      BlendMode.multiply,
                                    ),
                                    image: NetworkImage(
                                      category.categories[index].image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: BigText(
                                  text: category.categories[index].name,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const VerticalDivider(
                            color: Colors.transparent,
                            width: 5,
                          ),
                      itemCount: category.categories.length),
                )
              : Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.widthPadding10,
                    right: Dimensions.widthPadding10,
                  ),
                  height: Dimensions.heightPadding45,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: Dimensions.widthPadding100,
                                  height: Dimensions.heightPadding45,
                                  padding:
                                      EdgeInsets.all(Dimensions.widthPadding10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black45),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(Dimensions.radius30)),
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const VerticalDivider(
                            color: Colors.transparent,
                            width: 5,
                          ),
                      itemCount: 10),
                );
        }),
      ],
    );
  }
}
