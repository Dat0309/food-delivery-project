import 'dart:convert';

import 'package:food_delivery_app/models/Product.dart';
import 'package:food_delivery_app/service/repository/product_repo.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;

  ProductController({required this.productRepo});

  List<dynamic> popularProducts = [];
  bool isLoaded = false;

  Future<void> getPopularProducts() async {
    await productRepo.getProductList().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['products'].length > 0) {
          popularProducts.clear();
          for (int i = 0; i < resData['products'].length; i++) {
            if (resData['products'][i] != null) {
              Map<String, dynamic> map = resData['products'][i];
              popularProducts.add(Product.fromJson(map));
            }
          }
          isLoaded = true;
          update();
        }
      } else {}
      return value;
    });
  }
}
