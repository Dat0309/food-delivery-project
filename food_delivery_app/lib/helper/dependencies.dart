import 'package:food_delivery_app/controller/animation_controller.dart';
import 'package:food_delivery_app/controller/auth_controller.dart';
import 'package:food_delivery_app/controller/booking_controller.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/categories_controller.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/restaurant_controller.dart';
import 'package:food_delivery_app/controller/table_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/service/repository/auth_repo.dart';
import 'package:food_delivery_app/service/repository/booking_repo.dart';
import 'package:food_delivery_app/service/repository/cart_repo.dart';
import 'package:food_delivery_app/service/repository/categories_repo.dart';
import 'package:food_delivery_app/service/repository/location_repo.dart';
import 'package:food_delivery_app/service/repository/order_repo.dart';
import 'package:food_delivery_app/service/repository/product_repo.dart';
import 'package:food_delivery_app/service/repository/restaurant_repo.dart';
import 'package:food_delivery_app/service/repository/table_repo.dart';
import 'package:food_delivery_app/service/repository/user_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependentcies {
  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    Get.lazyPut(() => sharedPreferences);
    Get.lazyPut(() => ProductRepo());
    Get.lazyPut(() => RestaurantRepo());
    Get.lazyPut(() => CategoriesRepo());
    Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
    Get.lazyPut(() => AuthRepo(sharedPreferences: Get.find()));
    Get.lazyPut(() => OrderRepo());
    Get.lazyPut(() => UserRepo(sharedPreferences: Get.find()));
    Get.lazyPut(() => TableRepo(sharedPreferences: Get.find()));
    Get.lazyPut(() => LocationRepo(sharedPreferences: Get.find()));
    Get.lazyPut(() => BookingRepo(sharedPreferences: Get.find()));

    Get.lazyPut(() => ProductController(productRepo: Get.find()));
    Get.lazyPut(() => RestaurantController(restaurantRepo: Get.find()));
    Get.lazyPut(() => CategoriesController(categoriesRepo: Get.find()));
    Get.lazyPut(() => CartController(cartRepo: Get.find()));
    Get.lazyPut(() => AuthController(authRepo: Get.find()));
    Get.lazyPut(() => OrderController(orderRepo: Get.find()));
    Get.lazyPut(() => UserController(userRepo: Get.find()));
    Get.lazyPut(() => TableController(tableRepo: Get.find()));
    Get.lazyPut(() => LocationController(locationRepo: Get.find()));
    Get.lazyPut(() => BookingController(bookingRepo: Get.find()));
    Get.lazyPut(() => AnimController());
  }
}
