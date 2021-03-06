import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/categories_controller.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/controller/restaurant_controller.dart';
import 'package:food_delivery_app/service/repository/cart_repo.dart';
import 'package:food_delivery_app/service/repository/categories_repo.dart';
import 'package:food_delivery_app/service/repository/product_repo.dart';
import 'package:food_delivery_app/service/repository/restaurant_repo.dart';
import 'package:get/get.dart';

class AppDependentcies {
  static Future<void> init() async {
    Get.lazyPut(() => ProductRepo());
    Get.lazyPut(() => RestaurantRepo());
    Get.lazyPut(() => CategoriesRepo());
    Get.lazyPut(() => CartRepo());

    Get.lazyPut(() => ProductController(productRepo: Get.find()));
    Get.lazyPut(() => RestaurantController(restaurantRepo: Get.find()));
    Get.lazyPut(() => CategoriesController(categoriesRepo: Get.find()));
    Get.lazyPut(() => CartController(cartRepo: Get.find()));
  }
}
