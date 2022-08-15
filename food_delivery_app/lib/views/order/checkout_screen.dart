import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/component/button.dart';
import 'package:food_delivery_app/views/home/home_page.dart';
import 'package:food_delivery_app/views/order/component/add_cart.dart';
import 'package:food_delivery_app/views/order/component/payment_cart.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    var cardNumberController = TextEditingController();
    var expiryMMController = TextEditingController();
    var expiryYYController = TextEditingController();
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();

    Future.delayed(Duration.zero, () {
      Get.find<ProductController>();
    });

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
                GestureDetector(
                  onTap: () {},
                  child: const AppIcon(
                    icon: Icons.shopping_cart_outlined,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.heightPadding20 * 7,
            left: Dimensions.widthPadding20,
            right: Dimensions.widthPadding20,
            bottom: 0,
            child: GetBuilder<OrderController>(
              builder: (orderController) {
                return SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BigText(
                        text: 'Địa chỉ giao hàng',
                        color: AppColors.pargColor,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Dimensions.screenWidth * 0.4,
                            child: const BigText(
                              text:
                                  "68 Trần Khánh Dư, Phường 8, Đà Lạt, Lâm Đồng",
                              textOverflow: TextOverflow.visible,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const BigText(
                              text: 'Thay Đổi',
                              color: AppColors.secondaryIconColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      Container(
                        height: Dimensions.heightPadding10,
                        width: double.infinity,
                        color: AppColors.pargColor,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BigText(
                            text: 'Phương thức thanh toán',
                            color: AppColors.pargColor,
                          ),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                  ),
                                  isScrollControlled: true,
                                  isDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AddCartBottomSheet(
                                      cardNumberController:
                                          cardNumberController,
                                      expiryMMController: expiryMMController,
                                      expiryYYController: expiryYYController,
                                      firstNameController: firstNameController,
                                      lastNameController: lastNameController,
                                    );
                                  });
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: AppColors.secondaryIconColor,
                                ),
                                BigText(
                                  text: 'Thêm thẻ',
                                  color: AppColors.secondaryIconColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      PaymentCard(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SmallText(
                              text: 'Thanh toán khi nhận hàng',
                              color: AppColors.pargColor,
                            ),
                            Container(
                              width: 15,
                              height: 15,
                              decoration: ShapeDecoration(
                                shape: CircleBorder(
                                  side: BorderSide(
                                    color: AppColors.thirthColor!,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      PaymentCard(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 30,
                                  child: Image.asset('assets/images/visa.png'),
                                ),
                                SizedBox(
                                  width: Dimensions.widthPadding10,
                                ),
                                const SmallText(
                                  text: '**** **** **** 2187',
                                  color: AppColors.pargColor,
                                ),
                              ],
                            ),
                            Container(
                              width: 15,
                              height: 15,
                              decoration: ShapeDecoration(
                                shape: CircleBorder(
                                  side: BorderSide(
                                    color: AppColors.thirthColor!,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      PaymentCard(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 30,
                                  child:
                                      Image.asset('assets/images/paypal.png'),
                                ),
                                SizedBox(
                                  width: Dimensions.widthPadding10,
                                ),
                                const SmallText(
                                  text: '1914775@gmail.com',
                                  color: AppColors.pargColor,
                                ),
                              ],
                            ),
                            Container(
                              width: 15,
                              height: 15,
                              decoration: ShapeDecoration(
                                shape: CircleBorder(
                                  side: BorderSide(
                                    color: AppColors.thirthColor!,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding20,
                      ),
                      Container(
                        height: Dimensions.heightPadding10,
                        width: double.infinity,
                        color: AppColors.pargColor,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding20,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              BigText(
                                text: 'Đơn giá',
                                color: AppColors.pargColor,
                              ),
                              BigText(
                                text: '120.000đ',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              BigText(
                                text: 'Thuế',
                                color: AppColors.pargColor,
                              ),
                              BigText(
                                text: '120.000đ',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              BigText(
                                text: 'Ship',
                                color: AppColors.pargColor,
                              ),
                              BigText(
                                text: '120.000đ',
                              ),
                            ],
                          ),
                          Divider(
                            height: Dimensions.heightPadding30 + 10,
                            color: AppColors.pargColor!.withOpacity(0.25),
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              BigText(
                                text: 'Thành tiền',
                                color: AppColors.pargColor,
                              ),
                              BigText(
                                text: '120.000đ',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                        ],
                      ),
                      Container(
                        height: Dimensions.heightPadding10,
                        width: double.infinity,
                        color: AppColors.pargColor,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding20,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              isScrollControlled: true,
                              isDismissible: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.heightPadding20,
                                  ),
                                  child: SizedBox(
                                    height: Dimensions.screenHeight * 0.7,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: const Icon(Icons.clear),
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          'assets/images/success.png',
                                          scale: 3,
                                        ),
                                        SizedBox(
                                          height: Dimensions.heightPadding20,
                                        ),
                                        const BigText(
                                          text: 'CẢM ƠN!',
                                          color: AppColors.primaryColor,
                                        ),
                                        SizedBox(
                                          height: Dimensions.heightPadding20,
                                        ),
                                        const BigText(
                                          text:
                                              "Đơn đặt hàng của bạn hiện đang được xử lý. Chúng tôi sẽ cho bạn biết khi đơn đặt hàng được chọn từ cửa hàng. kiểm tra tình trạng đơn hàng của bạn",
                                          textOverflow: TextOverflow.visible,
                                        ),
                                        SizedBox(
                                          height: Dimensions.heightPadding60,
                                        ),
                                        SizedBox(
                                          height: 60,
                                          width: double.infinity,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: const CustomButton(
                                              text: 'Kiểm Tra Đơn Hàng',
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.off(() => const HomePage());
                                          },
                                          child: const BigText(
                                            text: "Về Trang Chủ",
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: const CustomButton(text: 'Xác Nhận'),
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding60,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
