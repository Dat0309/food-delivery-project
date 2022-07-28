import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class RestaurantListTile extends StatefulWidget {
  final String label;
  final String restaurantName;
  final num rating;
  final String image;

  const RestaurantListTile({
    Key? key,
    required this.label,
    required this.restaurantName,
    required this.rating,
    required this.image,
  }) : super(key: key);

  @override
  State<RestaurantListTile> createState() => _RestaurantListTileState();
}

class _RestaurantListTileState extends State<RestaurantListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.widthPadding25,
      ),
      child: Stack(
        children: [
          Container(
            width: Dimensions.width150,
            height: Dimensions.height220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.image,
                ),
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.width150,
            height: Dimensions.height200,
            child: Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.widthPadding8,
                            top: Dimensions.widthPadding8),
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.widthPadding5,
                            horizontal: Dimensions.widthPadding8),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius8),
                          color: Colors.black.withOpacity(0.55),
                        ),
                        child: SmallText(
                          text: widget.label,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: EdgeInsets.only(
                          right: Dimensions.widthPadding8,
                          top: Dimensions.heightPadding8,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.widthPadding8,
                            vertical: Dimensions.widthPadding5),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius3),
                          color: Colors.black.withOpacity(0.55),
                        ),
                        child: Column(
                          children: [
                            IconAndText(
                              icon: Icons.star,
                              text: widget.rating.toString(),
                              textColor: Colors.white,
                              iconColor: Colors.yellow[800],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          bottom: Dimensions.heightPadding10,
                          left: Dimensions.widthPadding8,
                          right: Dimensions.widthPadding8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              padding: EdgeInsets.symmetric(
                                vertical: Dimensions.widthPadding5,
                                horizontal: Dimensions.widthPadding8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius8),
                                color: Colors.black.withOpacity(0.55),
                              ),
                              child: BigText(
                                text: widget.restaurantName,
                                size: Dimensions.font16,
                                color: Colors.white,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
