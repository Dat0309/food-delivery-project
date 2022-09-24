import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/booking/widget/booking_card.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:get/get.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

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
              child: Container(
                width: Dimensions.screenWidth,
                height: 550,
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
                  child: productController.isLoadedRestaurantProduct
                      ? Expanded(
                          child: GridView.builder(
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
                          ),
                        )
                      : Container(),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
