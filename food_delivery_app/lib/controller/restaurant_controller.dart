import 'dart:convert';

import 'package:food_delivery_app/models/Restaurant.dart';
import 'package:food_delivery_app/service/repository/restaurant_repo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController {
  final RestaurantRepo restaurantRepo;

  RestaurantController({required this.restaurantRepo});

  List<dynamic> restaurants = [];
  bool isLoaded = false;

  Future<void> getRestaurants() async {
    http.Response res = await restaurantRepo.getRestaurants().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['restaurant'].length > 0) {
          restaurants.clear();
          for (int i = 0; i < resData['restaurant'].length; i++) {
            if (resData['restaurant'][i] != null) {
              Map<String, dynamic> map = resData['restaurant'][i];
              restaurants.add(Restaurant.fromJson(map));
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
