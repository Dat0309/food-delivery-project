import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/table_controller.dart';
import 'package:food_delivery_app/models/DateTimeModel.dart';
import 'package:food_delivery_app/models/Restaurant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/tables/widget/item_description.dart';
import 'package:food_delivery_app/views/tables/widget/paint_chair.dart';
import 'package:food_delivery_app/views/tables/widget/painter.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/item_date.dart';
import 'package:get/get.dart';

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
              top: Dimensions.heightPadding30,
              child: SizedBox(
                width: Dimensions.screenWidth,
                child: IconButton(
                  onPressed: (() => Get.back()),
                  icon: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: Dimensions.widthPadding20,
                      ),
                      BigText(
                        text: widget.restaurant.name,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: Dimensions.height120 - 20,
              child: SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: Dimensions.radius20),
                      height: Dimensions.heightPadding60 + 30,
                      width: Dimensions.screenWidth,
                      child: ListView.builder(
                        itemBuilder: (_, index) => ItemDate(
                          date: DateTimeModel.dates[index],
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
                      height: Dimensions.heightPadding45,
                    ),
                    SizedBox(
                      height: Dimensions.height220 + 20,
                      width: Dimensions.screenWidth,
                      child: tableController.isLoadedTable
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.0,
                                crossAxisCount: 3,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: tableController.tables.length,
                              itemBuilder: (context, index) {
                                if (tableController.tables[index].status) {
                                  return const PaintChair(
                                    color: Colors.white,
                                  );
                                }
                                return const PaintChair();
                              },
                            )
                          : Container(),
                    ),
                    SizedBox(
                      height: Dimensions.heightPadding10,
                    ),
                    const ItemDescription(),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 60,
              right: 60,
              bottom: 20,
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.thirthColor,
                    borderRadius: BorderRadius.circular(8.0),
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
