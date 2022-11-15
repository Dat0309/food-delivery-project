import 'dart:convert';

import 'package:food_delivery_app/models/Restaurant.dart';
import 'package:food_delivery_app/service/repository/restaurant_repo.dart';
import 'package:get/get.dart';

class RestaurantController extends GetxController {
  final RestaurantRepo restaurantRepo;

  RestaurantController({required this.restaurantRepo});

  List<dynamic> restaurants = [];
  late Restaurant restaurant;
  bool isLoaded = false;
  bool isLoadedRestaurant = false;

  Future<void> getRestaurants() async {
    await restaurantRepo.getRestaurants().then((value) {
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

  Future<Restaurant> getSingleRestaurant(String id) async {
    isLoadedRestaurant = false;
    Restaurant result = Restaurant();
    await restaurantRepo.getSingleRestaurant(id).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData.isNotEmpty) {
          result = Restaurant.fromJson(resData);
        }
        isLoadedRestaurant = true;
        update();
      }
    });
    return result;
  }

  Future<Map<String, dynamic>> restaurantReview(
      String id, double rating, String comment) async {
    var result;
    await restaurantRepo.restaurantReview(id, rating, comment).then((value) {
      if (value.statusCode == 201) {
        final Map<String, dynamic> resData = json.decode(value.body);
        Restaurant restaurant = Restaurant.fromJson(resData);
        getRestaurants();
        result = {
          'status': true,
          'message': 'Đánh giá thành công',
          'restaurant': restaurant,
        };
        update();
      } else if (value.statusCode == 400) {
        result = {
          'status': true,
          'message': 'Bạn đã đánh giá sản phẩm này',
        };
        update();
      } else {
        result = {
          'status': false,
          'message': 'Error',
        };
        update();
      }
    });
    return result;
  }
}
