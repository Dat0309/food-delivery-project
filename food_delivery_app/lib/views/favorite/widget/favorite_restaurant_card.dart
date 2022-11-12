import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class FavoriteRestaurantCard extends StatefulWidget {
  final UserController controller;
  const FavoriteRestaurantCard({Key? key, required this.controller})
      : super(key: key);

  @override
  State<FavoriteRestaurantCard> createState() => _FavoriteRestaurantCardState();
}

class _FavoriteRestaurantCardState extends State<FavoriteRestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: widget.controller.favRestaurantList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.widthPadding10,
              ),
              child: Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  widget.controller.deletedFavoriteRestaurant(
                      widget.controller.favRestaurantList[index]['_id']);
                },
                background: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.heightPadding20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBgColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
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
                child: Stack(
                  children: [
                    Container(
                      height: Dimensions.height350,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: Dimensions.height350 * 2 / 3,
                            decoration: BoxDecoration(
                              color: AppColors.pargColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.radius15),
                                topRight: Radius.circular(Dimensions.radius15),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.controller
                                      .favRestaurantList[index]['thumb']
                                      .toString()
                                      .split(',')[0],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: Dimensions.height350 * 1 / 3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(Dimensions.radius15),
                                bottomRight:
                                    Radius.circular(Dimensions.radius15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: Dimensions.widthPadding100,
                                    height: Dimensions.widthPadding100,
                                    decoration: BoxDecoration(
                                      color: AppColors.pargColor,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius15),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          widget.controller
                                                  .favRestaurantList[index]
                                              ['image'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.widthPadding10,
                                  ),
                                  BigText(
                                    text: widget.controller
                                        .favRestaurantList[index]['name'],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
