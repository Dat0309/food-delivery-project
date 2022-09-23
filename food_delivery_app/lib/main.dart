import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/auth_controller.dart';
import 'package:food_delivery_app/controller/booking_controller.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/categories_controller.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/restaurant_controller.dart';
import 'package:food_delivery_app/controller/table_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/views/authentication/splash_screen.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await dep.AppDependentcies.init();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<AuthController>().checkUserLogged();
    Get.find<ProductController>().getPopularProducts();
    Get.find<RestaurantController>().getRestaurants();
    Get.find<CategoriesController>().getCategories();
    Get.find<CartController>().getCartData();
    Get.find<AuthController>();
    Get.find<OrderController>();
    Get.find<UserController>();
    Get.find<TableController>();
    Get.find<BookingController>().getUserBooking();
    return const GetMaterialApp(
      title: 'ĂN GÌ ĐẶT NGAY!!!',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
