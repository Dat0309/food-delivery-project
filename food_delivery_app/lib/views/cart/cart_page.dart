import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
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
                    Get.to(() => const HomePage());
                  },
                  child: const AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                  ),
                ),
                const AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.primaryColor,
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
              return SizedBox(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.getItems.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.widthPadding10),
                        child: Dismissible(
                          key:
                              Key(controller.getItems[index].foodId.toString()),
                          onDismissed: (direction) {
                            controller.getItems.removeAt(index);
                          },
                          background: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.heightPadding20),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBgColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Dimensions.width150 * 2,
                                ),
                                const AppIcon(
                                    icon: Icons.delete_forever_outlined),
                              ],
                            ),
                          ),
                          child: CartCard(cart: controller.getItems[index]),
                        ),
                      );
                    })),
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
