import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/booking_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/booking/my_booking_screen.dart';
import 'package:food_delivery_app/views/cart/cart_page.dart';
import 'package:food_delivery_app/views/home/food_page_body.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar custom
        Container(
          margin: EdgeInsets.only(bottom: Dimensions.heightPadding20),
          padding: EdgeInsets.only(
            top: Dimensions.heightPadding10,
            left: Dimensions.widthPadding40,
            right: Dimensions.widthPadding40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: Dimensions.heightPadding60 + 10,
                    width: Dimensions.widthPadding60,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Row(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const CartPage());
                      },
                      child: Container(
                        width: Dimensions.widthPadding60 + 10,
                        height: Dimensions.heightPadding60,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.primaryColor,
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: Dimensions.heightPadding30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.widthPadding5),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.find<BookingController>().getUserBooking();
                        Get.to(() => const MyBookingScreen());
                      },
                      child: Container(
                        width: Dimensions.widthPadding60 + 10,
                        height: Dimensions.heightPadding60,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.primaryColor,
                        ),
                        child: Icon(
                          Icons.card_giftcard_outlined,
                          color: Colors.white,
                          size: Dimensions.heightPadding30,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        // Page body
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: FoodPageBody(),
              );
            },
          ),
        ),
      ],
    );
  }
}
