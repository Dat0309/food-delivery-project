import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/booking_controller.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/models/Product.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/cart/cart_page.dart';
import 'package:food_delivery_app/views/favorite/favorite_screen.dart';
import 'package:food_delivery_app/views/food_detail/rating_screen.dart';
import 'package:food_delivery_app/views/food_detail/widget/rating_overview.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expanable_text_widget.dart';
import 'package:food_delivery_app/widgets/icon_and_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodDetail extends StatefulWidget {
  final Product product;
  const FoodDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().initProduct(widget.product,
        Get.find<CartController>(), Get.find<BookingController>());
    bool checkFavorite = false;
    Get.find<UserController>().favProductList.forEach((e) {
      if (e['product'] == widget.product.id) {
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
              height: Dimensions.height350 + 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.product.image!),
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
                GetBuilder<ProductController>(builder: (productController) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const CartPage());
                        },
                        child: const AppIcon(
                          icon: Icons.shopping_cart_outlined,
                        ),
                      ),
                      productController.cartTotalItem >= 1
                          ? AppIcon(
                              icon: Icons.circle,
                              size: Dimensions.heightPadding20,
                              iconColor: Colors.transparent,
                              backgroundColor: AppColors.secondaryColor,
                            )
                          : Container(),
                      productController.cartTotalItem >= 1
                          ? Positioned(
                              left: 3,
                              child: BigText(
                                text:
                                    productController.cartTotalItem.toString(),
                                size: Dimensions.font16,
                              ),
                            )
                          : Container(),
                    ],
                  );
                }),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: Dimensions.heightPadding10),
                            child: BigText(
                              text: widget.product.name,
                              size: Dimensions.font32,
                            ),
                          ),
                          checkFavorite
                              ? const AppIcon(
                                  icon: Icons.favorite_rounded,
                                  iconColor: Colors.redAccent,
                                )
                              : GestureDetector(
                                  onTap: () {
                                    Get.find<UserController>()
                                        .favoriteProduct(
                                            widget.product.name!,
                                            widget.product.image!,
                                            widget.product.price!,
                                            widget.product.id!)
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
                                )
                        ],
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
                                  '${widget.product.rating}  |  ${widget.product.numReview} Đánh giá',
                              color: AppColors.signColor,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndText(
                            icon: Icons.circle_sharp,
                            text: '${widget.product.price.toString()} Đ',
                            textColor: AppColors.signColor,
                            iconColor: AppColors.primaryIconColor,
                          ),
                          IconAndText(
                            icon: Icons.location_on,
                            text: '1.7km',
                            textColor: AppColors.signColor,
                            iconColor: AppColors.secondaryIconColor,
                          ),
                          IconAndText(
                            icon: Icons.access_time_rounded,
                            text: '32 phút',
                            textColor: AppColors.signColor,
                            iconColor: AppColors.secondaryIconColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.heightPadding20,
                  ),
                  BigText(
                    text: 'Chi tiết sản phẩm',
                    color: AppColors.titleColor,
                    size: Dimensions.font24,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ExpandableTextWidget(
                            text: widget.product.description!,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => RatingScreen(
                                    product: widget.product,
                                  ));
                            },
                            child: RatingOverview(
                                rating: widget.product.rating!,
                                numReviews: widget.product.numReview!),
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
      bottomNavigationBar: GetBuilder<ProductController>(builder: (product) {
        return Container(
          margin: EdgeInsets.only(
            bottom: Dimensions.heightPadding10,
            left: Dimensions.widthPadding10,
            right: Dimensions.widthPadding10,
          ),
          height: Dimensions.height140,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.heightPadding20,
                  bottom: Dimensions.heightPadding20,
                  left: Dimensions.widthPadding20,
                  right: Dimensions.widthPadding20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        product.setQuantity(false);
                      },
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.widthPadding5,
                    ),
                    BigText(text: product.quantity.toString()),
                    SizedBox(
                      width: Dimensions.widthPadding5,
                    ),
                    GestureDetector(
                      onTap: () {
                        product.setQuantity(true);
                      },
                      child: const Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  product.addItem(widget.product);
                },
                child: Container(
                  width: Dimensions.widthPadding100 + 160,
                  padding: EdgeInsets.only(
                    top: Dimensions.heightPadding20,
                    bottom: Dimensions.heightPadding20,
                    left: Dimensions.widthPadding20,
                    right: Dimensions.widthPadding20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.primaryColor,
                  ),
                  child: BigText(
                    text:
                        '${widget.product.price! * product.quantity} đ | Thêm Vào Giỏ',
                    color: Colors.white,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
