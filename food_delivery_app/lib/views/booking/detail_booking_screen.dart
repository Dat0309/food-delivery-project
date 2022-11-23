import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/table_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/models/Booking.dart';
import 'package:food_delivery_app/models/Restaurant.dart';
import 'package:food_delivery_app/models/TableModel.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/widget/button.dart';
import 'package:food_delivery_app/views/booking/my_booking_screen.dart';
import 'package:food_delivery_app/views/home/home_page.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailBookingScreen extends StatefulWidget {
  final Restaurant restaurant;
  final Booking bookingResult;
  const DetailBookingScreen(
      {Key? key, required this.restaurant, required this.bookingResult})
      : super(key: key);

  @override
  State<DetailBookingScreen> createState() => _DetailBookingScreenState();
}

class _DetailBookingScreenState extends State<DetailBookingScreen> {
  TableModel? table;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<TableController>()
        .getTableById(widget.bookingResult.tableId!)
        .then((value) {
      setState(() {
        table = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableController>(builder: (tableController) {
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
                      height: Dimensions.screenHeight * .25,
                      child: ClipPath(
                        child: ClipRRect(
                          child: Image.network(
                            widget.restaurant.image!,
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
                    Container(
                      margin: EdgeInsets.only(
                        left: 0,
                        right: 0,
                        bottom: Dimensions.heightPadding10,
                      ),
                      child: Column(
                        children: [
                          BigText(text: 'Nhà hàng: ${widget.restaurant.name}'),
                          BigText(
                              text:
                                  'Khách hàng: ${widget.bookingResult.userName}'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 0,
                        right: 0,
                        bottom: Dimensions.heightPadding10,
                      ),
                      child: SmallText(
                          text: 'Liên lạc: ${widget.restaurant.contact}'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 0,
                        right: 0,
                        bottom: Dimensions.heightPadding10,
                      ),
                      child: SmallText(
                        text:
                            '${widget.restaurant.street}, ${widget.restaurant.ward}, ${widget.restaurant.district}, ${widget.restaurant.province}',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.radius15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const BigText(text: 'Ngày'),
                              SmallText(text: widget.bookingResult.date),
                            ],
                          ),
                          Column(
                            children: [
                              const BigText(text: 'Bàn'),
                              SmallText(text: table != null ? table!.code : ''),
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
                              SmallText(text: widget.bookingResult.time),
                            ],
                          ),
                          Column(
                            children: [
                              const BigText(text: 'Thành tiền'),
                              SmallText(
                                  text: widget.bookingResult.totalPrice
                                      .toString())
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.heightPadding10,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 0,
                          right: 0,
                          bottom: Dimensions.heightPadding10),
                      child: const BigText(
                        text: 'Danh sách món ăn:',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.heightPadding45,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: widget.bookingResult.bookingItem!.length,
                          itemBuilder: (context, indexItem) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: Dimensions.widthPadding20 / 2),
                              child: Hero(
                                tag: widget.bookingResult
                                        .bookingItem![indexItem]['_id']! +
                                    "_bookingTag",
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                        widget.bookingResult
                                            .bookingItem![indexItem]['image']!,
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
                                        text: widget.bookingResult
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
                      data:
                          'Khách hàng: ${Get.find<UserController>().getName}, Mã đặt bàn: ${widget.bookingResult.id}',
                      version: QrVersions.auto,
                      size: Dimensions.height140 + 18,
                    ),
                    SizedBox(
                      height: Dimensions.heightPadding20,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.off(() => const MyBookingScreen());
                        },
                        child: const CustomButton(text: 'Trở về')),
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
    });
  }
}
