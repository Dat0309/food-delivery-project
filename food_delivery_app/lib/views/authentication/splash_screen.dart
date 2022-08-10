import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/login_screen.dart';
import 'package:food_delivery_app/views/home/home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool checkUserLogged() {
      bool check = false;
      UserPreference().getUser().then((value) {
        if (value != null) {
          check = true;
        }
      });
      return check;
    }

    return AnimatedSplashScreen(
        duration: 3000,
        backgroundColor: AppColors.primaryColor!,
        splash: Lottie.asset('assets/images/foody.json'),
        splashIconSize: Dimensions.screenHeight * 0.4,
        splashTransition: SplashTransition.sizeTransition,
        pageTransitionType: PageTransitionType.rightToLeft,
        nextScreen: checkUserLogged() ? const LoginScreen() : const HomePage());
  }
}
