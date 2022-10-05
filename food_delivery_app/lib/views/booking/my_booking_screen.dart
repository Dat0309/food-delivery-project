import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/booking_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/booking/widget/reservation_card.dart';
import 'package:food_delivery_app/views/home/home_page.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(builder: (bookingController) {
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
                      Get.off(() => const HomePage());
                    },
                    child: const AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ),
                  const BigText(text: 'Lịch đặt bàn'),
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
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const AppIcon(
                          icon: Icons.card_giftcard_outlined,
                        ),
                      ),
                      Get.find<BookingController>().userBookings.isNotEmpty
                          ? AppIcon(
                              icon: Icons.circle,
                              size: Dimensions.heightPadding20,
                              iconColor: Colors.transparent,
                              backgroundColor: AppColors.secondaryColor,
                            )
                          : Container(),
                      Get.find<BookingController>().userBookings.isNotEmpty
                          ? Positioned(
                              left: 3,
                              child: BigText(
                                text: Get.find<BookingController>()
                                    .userBookings
                                    .length
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
              child: bookingController.isLoadedUserBookings
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: bookingController.userBookings.length,
                      itemBuilder: ((context, index) {
                        return ReservationCard(
                          booking: bookingController.userBookings[index],
                        );
                      }),
                    )
                  : SizedBox(
                      height: Dimensions.height1000 + 500,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: Dimensions.widthPadding25,
                                right: Dimensions.widthPadding25,
                                bottom: Dimensions.heightPadding10,
                              ),
                              child: Row(
                                children: [
                                  Shimmer.fromColors(
                                    child: Container(
                                      width: Dimensions.width140,
                                      height: Dimensions.height200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Dimensions.radius20,
                                        ),
                                        color: AppColors.pargColor,
                                      ),
                                    ),
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: Dimensions.height200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              Dimensions.radius20),
                                          bottomRight: Radius.circular(
                                              Dimensions.radius20),
                                        ),
                                        color: AppColors.buttoBackgroundColor,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: Dimensions.widthPadding10,
                                          right: Dimensions.widthPadding10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
            ),
          ],
        ),
      );
    });
  }
}
