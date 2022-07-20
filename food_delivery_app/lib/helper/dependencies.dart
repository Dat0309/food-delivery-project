import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/service/repository/product_repo.dart';
import 'package:get/get.dart';

class AppDependentcies {
  static Future<void> init() async {
    Get.lazyPut(() => ProductRepo());

    Get.lazyPut(() => ProductController(productRepo: Get.find()));
  }
}
