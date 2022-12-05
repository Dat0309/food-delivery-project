import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/models/Restaurant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/booking/payment_booking_screen.dart';
import 'package:food_delivery_app/views/booking/widget/booking_card.dart';
import 'package:food_delivery_app/views/booking/widget/cart_short_view.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class BookingScreen extends StatefulWidget {
  final Restaurant restaurant;
  const BookingScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductController>(builder: (productController) {
        return Stack(
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
                      productController.clearBooking();
                      Get.back();
                    },
                    child: const AppIcon(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: Dimensions.height140,
              child: Container(
                width: Dimensions.screenWidth,
                height: Dimensions.height350 + 200,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.radius20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Dimensions.radius20 * 1.5),
                    bottomRight: Radius.circular(Dimensions.radius20 * 1.5),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: productController.isLoadedRestaurantProduct
                          ? GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemCount:
                                  productController.restaurantProducts.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                mainAxisSpacing: Dimensions.widthPadding20,
                                crossAxisSpacing: Dimensions.widthPadding20,
                              ),
                              itemBuilder: (context, index) => BookingCard(
                                product:
                                    productController.restaurantProducts[index],
                                press: () {},
                              ),
                            )
                          : const SizedBox()),
                ),
              ),
            ),
            Positioned(
              bottom: Dimensions.heightPadding60 + 20,
              left: Dimensions.widthPadding20,
              right: Dimensions.widthPadding20,
              child: const CardShordView(),
            ),
            Positioned(
              bottom: 0,
              left: Dimensions.widthPadding20,
              right: Dimensions.widthPadding20,
              child: GestureDetector(
                onTap: () {
                  Get.to(() =>
                      PaymentBookingScreen(restaurant: widget.restaurant));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: Dimensions.widthPadding10),
                  alignment: Alignment.center,
                  height: Dimensions.heightPadding60,
                  decoration: BoxDecoration(
                    color: AppColors.thirthColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                  ),
                  child: const BigText(text: 'Đặt bàn'),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
