import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  var listCounter = 0;
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
                const BigText(text: 'Lịch Sử Mua Hàng'),
                SizedBox(
                  width: Dimensions.widthPadding20 * 8,
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
            top: Dimensions.heightPadding20 * 4,
            left: Dimensions.widthPadding20,
            right: Dimensions.widthPadding20,
            bottom: 0,
            child: GetBuilder<OrderController>(
              builder: (controller) {
                return controller.isLoadedUserOrder
                    ? SizedBox(
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              for (var item in controller.userOrders)
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.heightPadding20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(text: item.createAt),
                                      SizedBox(
                                        height: Dimensions.heightPadding10,
                                      ),
                                      Row(
                                        children: [
                                          Wrap(
                                            direction: Axis.horizontal,
                                            children: List.generate(
                                              item.orderItems.length,
                                              (index) {
                                                if (listCounter <
                                                    item.orderItems.length) {
                                                  listCounter++;
                                                }
                                                return Container(
                                                  height: 100,
                                                  width: 100,
                                                  margin: EdgeInsets.only(
                                                    right: Dimensions
                                                            .widthPadding10 /
                                                        2,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius15),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(item
                                                          .orderItems[
                                                              listCounter - 1]
                                                          .image),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )
                    : Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
