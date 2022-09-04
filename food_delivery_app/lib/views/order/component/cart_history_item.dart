import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatefulWidget {
  final dynamic item;
  const CartHistory({Key? key, required this.item}) : super(key: key);

  @override
  State<CartHistory> createState() => _CartHistoryState();
}

class _CartHistoryState extends State<CartHistory> {
  var listCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: EdgeInsets.only(bottom: Dimensions.heightPadding20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (() {
            DateTime parseDate =
                DateFormat("yyyy-MM-ddTHH:mm:ss").parse(widget.item.createAt);
            var inputDate = DateTime.parse(parseDate.toString());
            var outputFormat = DateFormat("dd-MM-yyyy HH:mm a");
            var outputDate = outputFormat.format(inputDate);
            return BigText(text: outputDate);
          }()),
          SizedBox(
            height: Dimensions.heightPadding10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                direction: Axis.horizontal,
                children: List.generate(
                  widget.item.orderItems.length,
                  (index) {
                    if (listCounter < widget.item.orderItems.length) {
                      listCounter++;
                    }
                    return index <= 3
                        ? Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.only(
                              right: Dimensions.widthPadding10 / 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget
                                    .item.orderItems[listCounter - 1].image),
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                ),
              ),
              SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SmallText(text: 'Tổng'),
                    BigText(
                      text:
                          '${widget.item.orderItems.length.toString()} Sản phẩm',
                      color: AppColors.pargColor,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.widthPadding10,
                        vertical: Dimensions.heightPadding10 / 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius15,
                        ),
                        border: Border.all(
                          width: 2,
                          color: AppColors.primaryBgColor!,
                        ),
                      ),
                      child: const SmallText(
                        text: "Mua lại",
                        color: AppColors.primaryBgColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
