import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({Key? key}) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.widthPadding15,
          horizontal: Dimensions.heightPadding30,
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius30),
            topRight: Radius.circular(Dimensions.radius30),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: AppColors.shadowColor!,
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimensions.widthPadding10),
                    height: Dimensions.heightPadding45,
                    width: Dimensions.heightPadding45,
                    decoration: BoxDecoration(
                      color: AppColors.signColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    child: const Icon(Icons.receipt),
                  ),
                  Row(
                    children: const [
                      SmallText(
                        text: "Thêm mã giảm giá",
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: AppColors.pargColor,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: Dimensions.heightPadding20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Tổng tiền:\n",
                      children: [
                        TextSpan(
                          text: "${controller.cartTotalPrice} vnđ",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<CartController>(builder: (cartController) {
                    return SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          cartController.addToHistory();
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            top: Dimensions.heightPadding20,
                            bottom: Dimensions.heightPadding20,
                            left: Dimensions.widthPadding20,
                            right: Dimensions.widthPadding20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: AppColors.primaryColor,
                          ),
                          child: const BigText(
                            text: 'Thanh Toán',
                            color: Colors.white,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
