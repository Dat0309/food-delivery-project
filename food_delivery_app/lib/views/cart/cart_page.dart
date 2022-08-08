import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Dimensions.width140,
                                child: AspectRatio(
                                  aspectRatio: 0.95,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.pargColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius15),
                                        image: DecorationImage(
                                          image: NetworkImage(controller
                                              .getItems[index].image!),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.widthPadding20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: controller.getItems[index].name!,
                                  ),
                                  SizedBox(height: Dimensions.heightPadding10),
                                  Text.rich(
                                    TextSpan(
                                      text:
                                          "${controller.getItems[index].price} vnđ",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryColor,
                                      ),
                                      children: [
                                        TextSpan(
                                            text:
                                                " x${controller.getItems[index].qty.toString()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ],
                                    ),
                                  ),
                                  GetBuilder<CartController>(
                                      builder: (cartController) {
                                    return Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            cartController.updateItemQty(
                                                controller
                                                    .getItems[index].foodId!,
                                                -1);
                                          },
                                          child: const Icon(
                                            Icons.remove,
                                            color: AppColors.signColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions.widthPadding5,
                                        ),
                                        BigText(
                                            text: controller.getItems[index].qty
                                                .toString()),
                                        SizedBox(
                                          width: Dimensions.widthPadding5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            cartController.updateItemQty(
                                                controller
                                                    .getItems[index].foodId!,
                                                1);
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: AppColors.signColor,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
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
