import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/restaurant_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/home/widget/restaurant_list_tile.dart';
import 'package:food_delivery_app/views/restaurant_detail/restaurant_detail.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
        GetBuilder<RestaurantController>(builder: (restaurant) {
          return restaurant.isLoaded
              ? Container(
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
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.widthPadding25,
                    ),
                    width: 300,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius8),
                      color: AppColors.signColor,
                    ),
                  ),
                );
        }),
        SizedBox(
          height: Dimensions.heightPadding20,
        ),
        GetBuilder<RestaurantController>(builder: (restaurant) {
          return restaurant.isLoaded
              ? SizedBox(
                  height: Dimensions.height220 + 20,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(RestaurantDetail(
                                    restaurant: restaurant.restaurants[index]));
                              },
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
              : SizedBox(
                  height: Dimensions.height220 + 20,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: Dimensions.widthPadding25,
                                  ),
                                  child: Container(
                                    width: Dimensions.width150,
                                    height: Dimensions.height220,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius15),
                                      color: AppColors.signColor,
                                    ),
                                  ),
                                ),
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
                );
        })
      ],
    );
  }
}
