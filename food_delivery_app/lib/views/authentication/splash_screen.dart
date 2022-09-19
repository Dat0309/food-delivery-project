import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/auth_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/login_screen.dart';
import 'package:food_delivery_app/views/home/home_page.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return AnimatedSplashScreen(
          duration: 3500,
          backgroundColor: AppColors.primaryColor!,
          splash: Lottie.asset('assets/images/foody.json'),
          splashIconSize: Dimensions.screenHeight * 0.4,
          splashTransition: SplashTransition.sizeTransition,
          pageTransitionType: PageTransitionType.rightToLeft,
          nextScreen:
              controller.userLogged ? const HomePage() : const LoginScreen());
    });
  }
}
