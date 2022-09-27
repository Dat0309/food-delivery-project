import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/table_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/models/Booking.dart';
import 'package:food_delivery_app/models/Restaurant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/widget/button.dart';
import 'package:food_delivery_app/views/home/home_page.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailBookingScreen extends StatelessWidget {
  final Restaurant restaurant;
  final Booking bookingResult;
  const DetailBookingScreen(
      {Key? key, required this.restaurant, required this.bookingResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pargColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(Dimensions.radius30),
            child: Container(
              height: Dimensions.screenHeight,
              width: Dimensions.screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.screenHeight * .45,
                    child: ClipPath(
                      child: ClipRRect(
                        child: Image.network(
                          restaurant.image!,
                          height: Dimensions.screenWidth * 0.6,
                          width: Dimensions.screenWidth,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Dimensions.radius15),
                          bottomRight: Radius.circular(Dimensions.radius15),
                          topLeft: Radius.circular(Dimensions.radius15),
                          topRight: Radius.circular(Dimensions.radius15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.heightPadding10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.radius15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const BigText(text: 'Ngày'),
                            SmallText(text: Get.find<TableController>().date),
                          ],
                        ),
                        Column(
                          children: [
                            const BigText(text: 'Bàn'),
                            SmallText(
                                text: Get.find<TableController>().getTableCode),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.radius15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const BigText(text: 'Giờ'),
                            SmallText(text: Get.find<TableController>().time),
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
                  SizedBox(
                    height: Dimensions.heightPadding10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      31,
                      (index) => const Text(
                        '- ',
                        style: TextStyle(
                          color: AppColors.pargColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.heightPadding20,
                  ),
                  QrImage(
                    data: Get.find<UserController>().getName,
                    version: QrVersions.auto,
                    size: 150.0,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.off(() => const HomePage());
                      },
                      child: const CustomButton(text: 'Về Trang chủ')),
                ],
              ),
            ),
          ),
          Positioned(
            top: Dimensions.screenHeight * .695,
            left: Dimensions.widthPadding15,
            child: const Icon(
              Icons.circle,
              color: AppColors.pargColor,
            ),
          ),
          Positioned(
            top: Dimensions.screenHeight * .695,
            right: Dimensions.widthPadding15,
            child: const Icon(
              Icons.circle,
              color: AppColors.pargColor,
            ),
          ),
        ],
      ),
    );
  }
}
