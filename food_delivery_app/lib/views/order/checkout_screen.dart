import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/widget/button.dart';
import 'package:food_delivery_app/views/home/home_page.dart';
import 'package:food_delivery_app/views/order/change_address_screen.dart';
import 'package:food_delivery_app/views/order/widget/add_cart.dart';
import 'package:food_delivery_app/views/order/widget/payment_cart.dart';
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

    void createOrder(OrderController orderController) {
      Map<String, dynamic> address = {
        "province": Get.find<UserController>().getProvince,
        "district": Get.find<UserController>().getDistrict,
        "ward": Get.find<UserController>().getWard,
        "street": {Get.find<UserController>().getStreet},
      };

      orderController
          .createOrder(
        Get.find<ProductController>().getItems,
        'Thanh toán khi nhận hàng',
        Get.find<UserController>().getPhone,
        Get.find<ProductController>().taxPrice,
        Get.find<ProductController>().shipPrice,
        Get.find<ProductController>().cartTotalPrice,
        address,
        Get.find<ProductController>().amount,
      )
          .then((value) {
        if (value['status']) {
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
                          mainAxisAlignment: MainAxisAlignment.end,
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
        } else {
          Get.snackbar(
            'Không ổn rồi',
            'Đã có lỗi sảy ra trong quá trình thanh toán. Vui lòng kiểm tra lại thông tin!',
            backgroundColor: AppColors.primaryColor,
            colorText: Colors.white,
          );
        }
      });
    }

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
                const BigText(text: 'Thanh toán'),
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
                            child: BigText(
                              text: Get.find<UserController>().address,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.find<LocationController>().getCurrentPos();
                              Get.to(() => const ChangeAddressScreen());
                            },
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
                      SizedBox(
                        height: Dimensions.height200,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: Dimensions.heightPadding10),
                                child: PaymentCard(
                                  widget: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 40,
                                            height: 30,
                                            child: Image.asset(
                                                'assets/images/delivery.png'),
                                          ),
                                          SizedBox(
                                            width: Dimensions.widthPadding10,
                                          ),
                                          const SmallText(
                                            text: 'Thanh toán khi nhận hàng',
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
                              );
                            },
                          ),
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
                      GetBuilder<ProductController>(
                          builder: (productController) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const BigText(
                                  text: 'Đơn giá',
                                  color: AppColors.pargColor,
                                ),
                                BigText(
                                  text: "${productController.cartTotalPrice} Đ",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.heightPadding10,
                            ),
                            SizedBox(
                              height: Dimensions.heightPadding10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const BigText(
                                  text: 'Ship',
                                  color: AppColors.pargColor,
                                ),
                                BigText(
                                  text: "${productController.shipPrice}Đ",
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
                              children: [
                                const BigText(
                                  text: 'Thành tiền',
                                  color: AppColors.pargColor,
                                ),
                                BigText(
                                  text: "${productController.amount}Đ",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.heightPadding20,
                            ),
                          ],
                        );
                      }),
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
                          createOrder(orderController);
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
