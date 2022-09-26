import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/table_controller.dart';
import 'package:food_delivery_app/models/DateTimeModel.dart';
import 'package:food_delivery_app/models/Restaurant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/booking/booking_screen.dart';
import 'package:food_delivery_app/views/tables/widget/item_description.dart';
import 'package:food_delivery_app/views/tables/widget/paint_chair.dart';
import 'package:food_delivery_app/views/tables/widget/painter.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/item_date.dart';
import 'package:food_delivery_app/widgets/item_time.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class TableReservationScreen extends StatefulWidget {
  final Restaurant restaurant;

  const TableReservationScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  State<TableReservationScreen> createState() => _TableReservationScreenState();
}

class _TableReservationScreenState extends State<TableReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TableController>(builder: (tableController) {
        return Stack(
          children: [
            Container(
              height: Dimensions.screenHeight,
              width: Dimensions.screenWidth,
              color: AppColors.mainBlackColor,
            ),
            SizedBox(
              height: Dimensions.screenHeight * .7,
              width: Dimensions.screenWidth,
              child: ClipPath(
                child: ClipRRect(
                  child: Image.network(
                    widget.restaurant.image!,
                    height: Dimensions.screenHeight / 2,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Dimensions.radius30),
                    bottomRight: Radius.circular(Dimensions.radius30),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    const Color(0xff21242c),
                    const Color(0xff21242c).withOpacity(.9),
                    const Color(0xff21242c).withOpacity(.1),
                  ],
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: Dimensions.radius20,
                    sigmaY: Dimensions.radius20,
                  ),
                  child: Container(
                    color: const Color(0xff21242c).withOpacity(0.1),
                  ),
                ),
              ),
            ),
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
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child:
                            const AppIcon(icon: Icons.favorite_border_outlined),
                      ),
                      GestureDetector(
                        child:
                            const AppIcon(icon: Icons.money_off_csred_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: Dimensions.height140,
              child: SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: Dimensions.radius20),
                      height: Dimensions.heightPadding60 + 30,
                      width: Dimensions.screenWidth,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: DateTimeModel.dates.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (contex, index) => ItemDate(
                          date: DateTimeModel.dates[index],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.heightPadding15,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: Dimensions.radius20),
                      height: Dimensions.heightPadding45,
                      width: Dimensions.screenWidth,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: DateTimeModel.times.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (contex, index) => ItemTime(
                          time: DateTimeModel.times[index],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.heightPadding15,
                    ),
                    const PainterDoor(),
                    const BigText(
                      text: 'Cửa vào',
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: Dimensions.heightPadding10,
                    ),
                    SizedBox(
                        height: Dimensions.height350,
                        width: Dimensions.screenWidth,
                        child: tableController.isLoadedTable
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.0,
                                  crossAxisCount:
                                      (tableController.tables.length / 2)
                                          .round(),
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: tableController.tables.length,
                                itemBuilder: (context, index) {
                                  if (tableController.tables[index].status) {
                                    return PaintChair(
                                      text: tableController
                                          .tables[index].capacity
                                          .toString(),
                                    );
                                  }
                                  return PaintChair(
                                    color: Colors.white,
                                    text: tableController.tables[index].capacity
                                        .toString(),
                                  );
                                },
                              )
                            : const SizedBox()),
                    SizedBox(
                      height: Dimensions.heightPadding10,
                    ),
                    const ItemDescription(),
                  ],
                ),
              ),
            ),
            Positioned(
              left: Dimensions.widthPadding60,
              right: Dimensions.widthPadding60,
              bottom: Dimensions.heightPadding20,
              child: InkWell(
                onTap: () {
                  Get.find<ProductController>()
                      .getRestaurantProduct(widget.restaurant.id!);
                  Get.to(() => const BookingScreen());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: Dimensions.heightPadding60,
                  decoration: BoxDecoration(
                    color: AppColors.thirthColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                  ),
                  child: const BigText(text: 'Tiếp tục'),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
