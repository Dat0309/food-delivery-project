import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/controller/restaurant_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/home/restaurant_list_tile.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class PopularRestaurant extends StatefulWidget {
  const PopularRestaurant({Key? key}) : super(key: key);

  @override
  State<PopularRestaurant> createState() => _PopularRestaurantState();
}

class _PopularRestaurantState extends State<PopularRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.widthPadding25,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(
                text: 'Nhà Hàng Thịnh Hành',
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              const BigText(
                text: '|',
                color: AppColors.pargColor,
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              const SmallText(
                text: 'Nhà hàng đánh giá cao',
                color: AppColors.pargColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.heightPadding20,
        ),
        GetBuilder<RestaurantController>(builder: (restaurant) {
          return restaurant.isLoaded
              ? Container(
                  height: 240,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: RestaurantListTile(
                                label: 'HOT',
                                image: restaurant.restaurants[index].image,
                                rating: restaurant.restaurants[index].rating,
                                restaurantName:
                                    restaurant.restaurants[index].name,
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const VerticalDivider(
                            color: Colors.transparent,
                            width: 5,
                          ),
                      itemCount: 10),
                )
              : CircularProgressIndicator();
        })
      ],
    );
  }
}
