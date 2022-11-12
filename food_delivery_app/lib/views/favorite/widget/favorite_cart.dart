import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FavoriteCart extends StatefulWidget {
  final UserController controller;
  const FavoriteCart({Key? key, required this.controller}) : super(key: key);

  @override
  State<FavoriteCart> createState() => _FavoriteCartState();
}

class _FavoriteCartState extends State<FavoriteCart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.controller.favProductList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Dimensions.widthPadding10),
              child: Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  widget.controller.deletedFavoriteProduct(
                      widget.controller.favProductList[index]['_id']);
                },
                background: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.heightPadding20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBgColor,
                    borderRadius: BorderRadius.circular(15),
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
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15)),
                  child: Row(
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
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                              image: DecorationImage(
                                image: NetworkImage(widget
                                    .controller.favProductList[index]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.widthPadding20,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: Dimensions.heightPadding10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BigText(
                              text: widget.controller.favProductList[index]
                                  ['name'],
                            ),
                            SizedBox(height: Dimensions.heightPadding10),
                            SmallText(
                              text:
                                  "${widget.controller.favProductList[index]['price']} vnđ",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
