import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class CardShordView extends StatelessWidget {
  const CardShordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productController) {
      return Row(
        children: [
          const BigText(text: 'Booking:'),
          SizedBox(
            width: Dimensions.widthPadding20,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: Dimensions.heightPadding60,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: productController.getBookingItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: Dimensions.widthPadding20 / 2),
                        child: Hero(
                          tag:
                              productController.getBookingItems[index].foodId! +
                                  "_bookingTag",
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                  productController
                                      .getBookingItems[index].image!,
                                ),
                              ),
                              AppIcon(
                                size: Dimensions.heightPadding20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.secondaryIconColor,
                                icon: Icons.circle,
                              ),
                              Positioned(
                                left: 3,
                                child: BigText(
                                  text: productController
                                      .getBookingItems[index].qty!
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
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Dimensions.heightPadding30 + 5,
                width: Dimensions.widthPadding60 + 25,
                decoration: BoxDecoration(
                  color: AppColors.signColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                ),
                child: Center(
                  child: SmallText(
                    text: productController.bookingTotalItem.toString(),
                  ),
                ),
              ),
              Container(
                height: Dimensions.heightPadding30 + 5,
                width: Dimensions.widthPadding60 + 25,
                decoration: BoxDecoration(
                  color: AppColors.signColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                ),
                child: Center(
                  child: SmallText(
                    text: productController.bookingTotalPrice.toString(),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
