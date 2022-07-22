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
            width: 150,
            height: 220,
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
            width: 150,
            height: 200,
            child: Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8, top: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black.withOpacity(0.55),
                        ),
                        child: SmallText(
                          text: widget.label,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 8, top: 8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
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
                        margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black.withOpacity(0.55),
                              ),
                              child: BigText(
                                text: widget.restaurantName,
                                size: 16,
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
