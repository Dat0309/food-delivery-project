import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/auth_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/login_screen.dart';
import 'package:food_delivery_app/views/profile/widget/profile_list_item.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserController>(builder: (userController) {
        return userController.isLoadedProfile
            ? Center(
                child: Stack(
                  children: [
                    Container(
                      height: Dimensions.screenHeight,
                      width: Dimensions.screenWidth,
                      color: AppColors.mainBlackColor,
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * .7,
                      width: Dimensions.screenWidth,
                      child: ClipPath(
                        child: ClipRRect(
                          child: Image.network(
                            userController.profile!.thumb!,
                            height: Dimensions.screenHeight / 2,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.radius30),
                            bottomRight: Radius.circular(Dimensions.radius30),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            const Color(0xff21242c),
                            const Color(0xff21242c).withOpacity(.9),
                            const Color(0xff21242c).withOpacity(.1),
                          ],
                        ),
                      ),
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: Dimensions.radius20,
                            sigmaY: Dimensions.radius20,
                          ),
                          child: Container(
                            color: const Color(0xff21242c).withOpacity(0.1),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Dimensions.height120 - 20,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Container(
                            height: Dimensions.heightPadding60 + 40,
                            width: Dimensions.widthPadding100,
                            margin: EdgeInsets.only(
                                top: Dimensions.heightPadding10),
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: Dimensions.radius50,
                                  backgroundImage: NetworkImage(
                                      userController.profile!.avatar as String),
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
                          SizedBox(
                            height: Dimensions.heightPadding30,
                          ),
                          const ProfileListItem(
                            icon: Icons.privacy_tip_rounded,
                            text: 'Điều khoản',
                          ),
                          const ProfileListItem(
                            icon: Icons.support_agent_rounded,
                            text: 'Hỗ trợ',
                          ),
                          const ProfileListItem(
                            icon: Icons.settings,
                            text: 'Cài đặt',
                          ),
                          const ProfileListItem(
                            icon: Icons.person_add_alt_rounded,
                            text: 'Mời bạn bè',
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.find<AuthController>().logout().then(
                                    (value) =>
                                        Get.to(() => const LoginScreen()),
                                  );
                            },
                            child: const ProfileListItem(
                              icon: Icons.logout_rounded,
                              text: 'Đăng xuất',
                              hasNavigation: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container();
      }),
    );
  }
}
