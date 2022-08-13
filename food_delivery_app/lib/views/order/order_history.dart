import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/cart/cart_page.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
                BigText(
                  text: 'Lịch Sử Mua Hàng',
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
                                  height: 140,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.heightPadding20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      (() {
                                        DateTime parseDate =
                                            DateFormat("yyyy-MM-ddTHH:mm:ss")
                                                .parse(item.createAt);
                                        var inputDate = DateTime.parse(
                                            parseDate.toString());
                                        var outputFormat =
                                            DateFormat("dd-MM-yyyy HH:mm a");
                                        var outputDate =
                                            outputFormat.format(inputDate);
                                        return BigText(text: outputDate);
                                      }()),
                                      SizedBox(
                                        height: Dimensions.heightPadding10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                return index <= 3
                                                    ? Container(
                                                        height: 100,
                                                        width: 100,
                                                        margin: EdgeInsets.only(
                                                          right: Dimensions
                                                                  .widthPadding10 /
                                                              2,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  Dimensions
                                                                      .radius15),
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(item
                                                                .orderItems[
                                                                    listCounter -
                                                                        1]
                                                                .image),
                                                          ),
                                                        ),
                                                      )
                                                    : const SizedBox();
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 80,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const SmallText(text: 'Tổng'),
                                                BigText(
                                                  text:
                                                      '${item.orderItems.length.toString()} Sản phẩm',
                                                  color: AppColors.pargColor,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: Dimensions
                                                        .widthPadding10,
                                                    vertical: Dimensions
                                                            .heightPadding10 /
                                                        2,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimensions.radius15,
                                                    ),
                                                    border: Border.all(
                                                      width: 2,
                                                      color: AppColors
                                                          .primaryBgColor!,
                                                    ),
                                                  ),
                                                  child: const SmallText(
                                                    text: "Mua lại",
                                                    color: AppColors
                                                        .primaryBgColor,
                                                  ),
                                                ),
                                              ],
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
