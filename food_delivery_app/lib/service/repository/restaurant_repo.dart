import 'dart:convert';

import 'package:food_delivery_app/constant/app_url.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantRepo extends GetxService {
  RestaurantRepo();

  var token = "";
  Future<http.Response> getRestaurants() async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.RESTAURANTS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getSingleRestaurant(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.RESTAURANTS + '/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> restaurantReview(
      String id, double rating, String comment) async {
    final Map<String, dynamic> ratingData = {
      'rating': rating,
      'comment': comment,
    };

    String token = await UserPreference().getToken();
    http.Response response = await http.post(
      Uri.parse(AppUrl.RESTAURATN_REVIEW + '$id/review'),
      body: json.encode(ratingData),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    return response;
  }
}
