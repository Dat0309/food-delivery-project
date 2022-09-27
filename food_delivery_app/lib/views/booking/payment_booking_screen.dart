import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/booking_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/table_controller.dart';
import 'package:food_delivery_app/models/Restaurant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/widget/button.dart';
import 'package:food_delivery_app/views/home/home_page.dart';
import 'package:food_delivery_app/views/order/widget/add_cart.dart';
import 'package:food_delivery_app/views/order/widget/payment_cart.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class PaymentBookingScreen extends StatefulWidget {
  final Restaurant restaurant;
  const PaymentBookingScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<PaymentBookingScreen> createState() => _PaymentBookingScreenState();
}

class _PaymentBookingScreenState extends State<PaymentBookingScreen> {
  @override
  Widget build(BuildContext context) {
    var cardNumberController = TextEditingController();
    var expiryMMController = TextEditingController();
    var expiryYYController = TextEditingController();
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();

    void createBooking(BookingController bookingController) {
      bookingController
          .createBooking(
        Get.find<ProductController>().getBookingItems,
        'Thanh toán tại nhà hàng',
        Get.find<TableController>().getTableId,
        Get.find<ProductController>().bookingTotalPrice,
        Get.find<ProductController>().amountBooking,
        Get.find<TableController>().date,
        Get.find<TableController>().time,
      )
          .then((value) {
        if (value['status']) {
          print(value);
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
                const BigText(text: 'Đặt bàn'),
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
            child: GetBuilder<BookingController>(
              builder: (bookingController) {
                return SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Dimensions.height200,
                        width: Dimensions.screenWidth,
                        decoration: BoxDecoration(
                          color: AppColors.signColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          image: DecorationImage(
                            image: NetworkImage(widget.restaurant.image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      BigText(text: 'Nhà Hàng: ${widget.restaurant.name}'),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      Container(
                        height: Dimensions.height200,
                        width: Dimensions.screenWidth,
                        decoration: BoxDecoration(
                          color: AppColors.signColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.all(Dimensions.widthPadding10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const BigText(text: 'Ngày'),
                                      SmallText(
                                          text:
                                              Get.find<TableController>().date),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const BigText(text: 'Bàn'),
                                      SmallText(
                                          text: Get.find<TableController>()
                                              .getTableCode),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.all(Dimensions.widthPadding10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const BigText(text: 'Giờ'),
                                      SmallText(
                                          text:
                                              Get.find<TableController>().time),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const BigText(text: 'Thành tiền'),
                                      SmallText(
                                          text: Get.find<ProductController>()
                                              .amountBooking
                                              .toString())
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                                            text: 'Thanh toán tại nhà hàng',
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
                          createBooking(bookingController);
                        },
                        child: const CustomButton(text: 'Xác Nhận'),
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
