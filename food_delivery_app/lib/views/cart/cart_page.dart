import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/no_data_page.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/cart/component/cart.dart';
import 'package:food_delivery_app/views/cart/component/checkout_card.dart';
import 'package:food_delivery_app/views/home/home_page.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
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
                const BigText(text: 'Giỏ Hàng'),
                SizedBox(
                  width: Dimensions.widthPadding20 * 8,
                ),
                GestureDetector(
                  onTap: () {
                    Get.off(() => const HomePage());
                  },
                  child: const AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                  ),
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {},
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
            child: GetBuilder<ProductController>(builder: (controller) {
              return controller.getItems.isNotEmpty
                  ? CartCard(controller: controller)
                  : const NoDataPage(
                      text: 'Hiện không có sản phẩm nào trong giỏ hàng!');
            }),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<ProductController>(builder: (controller) {
        return controller.getItems.isNotEmpty
            ? const CheckoutCard()
            : const CheckoutCard(
                enable: false,
              );
      }),
    );
  }
}
