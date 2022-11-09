import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/no_data_page.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/cart/cart_page.dart';
import 'package:food_delivery_app/views/favorite/widget/favorite_cart.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.heightPadding10,
            left: Dimensions.widthPadding20,
            right: Dimensions.widthPadding20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: 'Danh sách yêu thích',
                  size: Dimensions.font24,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: Dimensions.widthPadding20 * 8,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const CartPage());
                      },
                      child: const AppIcon(
                        icon: Icons.shopping_cart_outlined,
                      ),
                    ),
                    Get.find<ProductController>().cartTotalItem >= 1
                        ? AppIcon(
                            icon: Icons.circle,
                            size: Dimensions.heightPadding20,
                            iconColor: Colors.transparent,
                            backgroundColor: AppColors.secondaryColor,
                          )
                        : Container(),
                    Get.find<ProductController>().cartTotalItem >= 1
                        ? Positioned(
                            left: 3,
                            child: BigText(
                              text: Get.find<ProductController>()
                                  .cartTotalItem
                                  .toString(),
                              size: Dimensions.font16,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.heightPadding20 * 6,
            left: Dimensions.widthPadding20,
            right: Dimensions.widthPadding20,
            bottom: 0,
            child: GetBuilder<UserController>(builder: (controller) {
              return controller.favProductList.isNotEmpty
                  ? FavoriteCart(controller: controller)
                  : const NoDataPage(
                      text: 'Hiện không có sản phẩm nào tỏng mục Yêu thích');
            }),
          ),
        ],
      ),
    );
  }
}
