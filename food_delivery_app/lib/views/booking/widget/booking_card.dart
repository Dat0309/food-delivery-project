import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/models/Product.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/booking/widget/counter.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class BookingCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;

  const BookingCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(Dimensions.radius20 * 1.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Dimensions.width150 + 50,
              height: Dimensions.height140 + 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.pargColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.image!),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.widthPadding10),
              child: BigText(text: product.name),
            ),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.widthPadding10),
              child: SmallText(text: '${product.price.toString()}Đ'),
            ),
            Center(
              child: BookingCounter(
                onAddQuantity: () {},
                onSubQuantity: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
