import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/booking_controller.dart';
import 'package:food_delivery_app/controller/restaurant_controller.dart';
import 'package:food_delivery_app/controller/table_controller.dart';
import 'package:food_delivery_app/models/Booking.dart';
import 'package:food_delivery_app/models/Restaurant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/booking/detail_booking_screen.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class ReservationCard extends StatefulWidget {
  final Booking booking;
  const ReservationCard({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
  Restaurant? restaurant;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<RestaurantController>()
        .getSingleRestaurant(widget.booking.restaurantId!)
        .then((value) {
      restaurant = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantController>(builder: (restaurantController) {
      return restaurantController.isLoadedRestaurant && restaurant != null
          ? GestureDetector(
              onTap: () {
                Get.to(() => DetailBookingScreen(
                    restaurant: restaurant!, bookingResult: widget.booking));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryIconColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                ),
                margin: EdgeInsets.only(
                  bottom: Dimensions.heightPadding10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Dimensions.width140,
                      child: AspectRatio(
                        aspectRatio: 0.75,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.pargColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            image: DecorationImage(
                              image: NetworkImage(restaurant!.image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.widthPadding20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.heightPadding10,
                        ),
                        BigText(text: restaurant!.name),
                        SizedBox(
                          height: Dimensions.heightPadding10,
                        ),
                        SizedBox(
                          height: Dimensions.heightPadding10,
                        ),
                        BigText(
                            text:
                                '${widget.booking.time} - ${widget.booking.date}'),
                        SizedBox(
                          height: Dimensions.heightPadding10,
                        ),
                        const BigText(text: 'Danh sách món ăn:'),
                        SizedBox(
                          height: Dimensions.heightPadding10,
                        ),
                        SizedBox(
                          height: Dimensions.heightPadding45,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: widget.booking.bookingItem!.length,
                              itemBuilder: (context, indexItem) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: Dimensions.widthPadding20 / 2),
                                  child: Hero(
                                    tag: widget.booking.bookingItem![indexItem]
                                            ['_id']! +
                                        "_bookingTag",
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                            widget.booking
                                                    .bookingItem![indexItem]
                                                ['image']!,
                                          ),
                                        ),
                                        AppIcon(
                                          size: Dimensions.heightPadding20,
                                          iconColor: Colors.transparent,
                                          backgroundColor:
                                              AppColors.secondaryIconColor,
                                          icon: Icons.circle,
                                        ),
                                        Positioned(
                                          left: 3,
                                          child: BigText(
                                            text: widget.booking
                                                .bookingItem![indexItem]['qty']!
                                                .toString(),
                                            size: Dimensions.font16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Container();
    });
  }
}
