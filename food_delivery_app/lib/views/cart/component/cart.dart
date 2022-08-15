import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class CartCard extends StatefulWidget {
  final ProductController controller;
  const CartCard({Key? key, required this.controller}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.controller.getItems.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.widthPadding10),
            child: Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                widget.controller.removeItem(widget.controller.getItems[index]);
              },
              background: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.heightPadding20),
                decoration: BoxDecoration(
                  color: AppColors.primaryBgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: Dimensions.width150 * 2,
                    ),
                    const AppIcon(icon: Icons.delete_forever_outlined),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Dimensions.width140,
                    child: AspectRatio(
                      aspectRatio: 0.95,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.pargColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            image: DecorationImage(
                              image: NetworkImage(
                                  widget.controller.getItems[index].image!),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.widthPadding20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BigText(
                        text: widget.controller.getItems[index].name!,
                      ),
                      SizedBox(height: Dimensions.heightPadding10),
                      Text.rich(
                        TextSpan(
                          text:
                              "${widget.controller.getItems[index].price} vnđ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                          children: [
                            TextSpan(
                                text:
                                    " x${widget.controller.getItems[index].qty.toString()}",
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                      GetBuilder<CartController>(builder: (cartController) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  cartController.updateItemQty(
                                      widget.controller.getItems[index].foodId!,
                                      -1);
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                color: AppColors.signColor,
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.widthPadding5,
                            ),
                            BigText(
                                text: widget.controller.getItems[index].qty
                                    .toString()),
                            SizedBox(
                              width: Dimensions.widthPadding5,
                            ),
                            GestureDetector(
                              onTap: () {
                                cartController.updateItemQty(
                                    widget.controller.getItems[index].foodId!,
                                    1);
                              },
                              child: const Icon(
                                Icons.add,
                                color: AppColors.signColor,
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
