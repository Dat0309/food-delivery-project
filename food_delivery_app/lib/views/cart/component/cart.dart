import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/models/Cart.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class CartCard extends StatefulWidget {
  final Cart cart;
  const CartCard({Key? key, required this.cart}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  image: DecorationImage(
                    image: NetworkImage(widget.cart.image!),
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
              text: widget.cart.name!,
            ),
            SizedBox(height: Dimensions.heightPadding10),
            Text.rich(
              TextSpan(
                text: "${widget.cart.price} vnđ",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
                children: [
                  TextSpan(
                      text: " x${widget.cart.qty}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
