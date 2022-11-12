import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/table_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/models/Restaurant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/favorite/favorite_screen.dart';
import 'package:food_delivery_app/views/food_detail/rating_screen.dart';
import 'package:food_delivery_app/views/food_detail/widget/rating_overview.dart';
import 'package:food_delivery_app/views/tables/table_reservation_screen.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expanable_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class RestaurantDetail extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantDetail({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  @override
  Widget build(BuildContext context) {
    List<String>? thumbs = widget.restaurant.thumb?.split(',');
    bool checkFavorite = false;
    Get.find<UserController>().favRestaurantList.forEach((e) {
      if (e['restaurant'] == widget.restaurant.id) {
        checkFavorite = true;
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 370,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.restaurant.image!),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.heightPadding60 + 5,
            left: Dimensions.widthPadding20,
            right: Dimensions.widthPadding20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                Row(
                  children: [
                    checkFavorite
                        ? const AppIcon(
                            icon: Icons.favorite_rounded,
                            iconColor: Colors.redAccent,
                          )
                        : GestureDetector(
                            onTap: () {
                              Get.find<UserController>()
                                  .favoriteRestaurant(
                                      widget.restaurant.name!,
                                      widget.restaurant.image!,
                                      widget.restaurant.thumb!,
                                      widget.restaurant.id!)
                                  .then((value) {
                                if (value['status']) {
                                  Get.off(() => const FavoriteScreen());
                                  Get.snackbar('Thành công',
                                      'Đã thêm vào danh mục yêu thích');
                                } else {
                                  Get.snackbar('Lỗi',
                                      'Đã có lỗi trong quá trình xử lý.');
                                }
                              });
                            },
                            child: const AppIcon(
                              icon: Icons.favorite_rounded,
                            ),
                          ),
                    GestureDetector(
                      child: const AppIcon(icon: Icons.money_off_csred_rounded),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.height350,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.widthPadding20,
                right: Dimensions.widthPadding20,
                top: Dimensions.heightPadding20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: Dimensions.heightPadding10),
                        child: BigText(
                          text: widget.restaurant.name,
                          size: Dimensions.font32,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: Dimensions.heightPadding10),
                        child: SmallText(
                          text:
                              '${widget.restaurant.province}, ${widget.restaurant.district}, ${widget.restaurant.ward}, ${widget.restaurant.street}',
                          color: AppColors.pargColor,
                          textOverflow: TextOverflow.visible,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: Dimensions.heightPadding20),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: Dimensions.heightPadding10),
                              child: Wrap(
                                children: List.generate(
                                  5,
                                  (index) => const Icon(
                                    Icons.star,
                                    color: AppColors.yellowColor,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            SmallText(
                              text:
                                  '${widget.restaurant.rating}  |  ${widget.restaurant.numReviews} Đánh giá',
                              color: AppColors.signColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  BigText(
                    text: 'Chi tiết nhà hàng',
                    color: AppColors.titleColor,
                    size: Dimensions.font24,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ExpandableTextWidget(
                            text: widget.restaurant.description!,
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          SizedBox(
                            height: Dimensions.height220 + 20,
                            child: ListView.builder(
                              itemCount: thumbs?.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      right: Dimensions.widthPadding8),
                                  child: Container(
                                    height: Dimensions.height220,
                                    width: Dimensions.width150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          thumbs![index].trim(),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => RatingScreen(
                                  restaurant: widget.restaurant,
                                ),
                              );
                            },
                            child: RatingOverview(
                              rating: widget.restaurant.rating!,
                              numReviews: widget.restaurant.numReviews!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: Dimensions.heightPadding10,
          left: Dimensions.widthPadding10,
          right: Dimensions.widthPadding10,
        ),
        height: Dimensions.height120,
        padding: EdgeInsets.only(
          top: Dimensions.heightPadding30,
          bottom: Dimensions.heightPadding30,
          left: Dimensions.widthPadding20,
          right: Dimensions.widthPadding20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20 * 2),
          color: AppColors.buttoBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.find<TableController>()
                    .getTablesByRestaurantId(widget.restaurant.id!);
                Get.to(() =>
                    TableReservationScreen(restaurant: widget.restaurant));
              },
              child: Container(
                padding: EdgeInsets.all(Dimensions.radius20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.thirthColor),
                child: const BigText(
                  text: 'Đặt Bàn',
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
