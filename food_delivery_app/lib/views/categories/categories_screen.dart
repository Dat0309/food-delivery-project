import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/categories_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/categories/product_categories.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(builder: (categoriesController) {
      return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: Dimensions.heightPadding60 + 5,
              left: Dimensions.widthPadding20,
              right: Dimensions.widthPadding20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ),
                  const BigText(text: 'Danh mục món ăn'),
                  SizedBox(
                    width: Dimensions.widthPadding20 * 8,
                  ),
                ],
              ),
            ),
            Positioned(
                top: Dimensions.heightPadding20 * 7,
                left: Dimensions.widthPadding5,
                right: Dimensions.widthPadding5,
                bottom: 0,
                child: SizedBox(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: Dimensions.widthPadding10,
                            crossAxisSpacing: Dimensions.widthPadding10,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.find<ProductController>()
                                        .getProductByCatId(categoriesController
                                            .categories[index].id);
                                    Get.to(() => const ProductCategories());
                                  },
                                  child: Container(
                                    height: Dimensions.height140,
                                    width: Dimensions.widthPadding100 + 80,
                                    padding: EdgeInsets.all(
                                        Dimensions.widthPadding10),
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
                                          categoriesController
                                              .categories[index].image,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Center(
                                      child: BigText(
                                        text: categoriesController
                                            .categories[index].name,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          itemCount: categoriesController.categories.length),
                    ),
                  ),
                )),
          ],
        ),
      );
    });
  }
}
