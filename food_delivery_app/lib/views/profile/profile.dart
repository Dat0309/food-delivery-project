import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/cart/cart_page.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<UserController>(builder: (userController) {
          return Expanded(
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: Dimensions.heightPadding60 + 40,
                    width: Dimensions.widthPadding100,
                    margin: EdgeInsets.only(top: Dimensions.heightPadding30),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: Dimensions.radius50,
                          backgroundImage:
                              NetworkImage(userController.profile!.avatar!),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: Dimensions.heightPadding30,
                            width: Dimensions.widthPadding30,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryBgColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              heightFactor: Dimensions.heightPadding15,
                              widthFactor: Dimensions.widthPadding15,
                              child: Icon(
                                Icons.edit_rounded,
                                color: AppColors.mainBlackColor,
                                size: Dimensions.radius15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.heightPadding20,
                  ),
                  BigText(text: userController.getName),
                  SizedBox(
                    height: Dimensions.heightPadding10,
                  ),
                  SmallText(text: userController.profile!.email),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
