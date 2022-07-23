import 'dart:convert';

import 'package:food_delivery_app/models/Category.dart';
import 'package:food_delivery_app/service/repository/categories_repo.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final CategoriesRepo categoriesRepo;

  CategoriesController({required this.categoriesRepo});

  List<dynamic> categories = [];
  bool isLoaded = false;

  Future<void> getCategories() async {
    await categoriesRepo.getCategoriesList().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['categories'].length > 0) {
          categories.clear();
          for (int i = 0; i < resData['categories'].length; i++) {
            if (resData['categories'][i] != null) {
              Map<String, dynamic> map = resData['categories'][i];
              categories.add(Category.fromJson(map));
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
