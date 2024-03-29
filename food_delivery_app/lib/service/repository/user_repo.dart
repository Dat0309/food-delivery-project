import 'dart:convert';

import 'package:food_delivery_app/constant/app_constant.dart';
import 'package:food_delivery_app/constant/app_url.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  UserRepo({required this.sharedPreferences});

  Future<http.Response> getProfile() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.PROFILE),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getAllUser() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.USERS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> favoriteProducts(
      String name, String image, int price, String id) async {
    final Map<String, dynamic> favData = {
      'name': name,
      'image': image,
      'price': price,
      'product': id,
    };

    String token = await UserPreference().getToken();
    http.Response res = await http.post(
      Uri.parse(AppUrl.FAVORITE_PRODUCTS),
      body: json.encode(favData),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> favoriteRestaurants(
      String name, String image, String thumb, String id) async {
    final Map<String, dynamic> favData = {
      'name': name,
      'image': image,
      'thumb': thumb,
      'restaurant': id,
    };

    String token = await UserPreference().getToken();
    http.Response res = await http.post(
      Uri.parse(AppUrl.FAVORITE_RESTAURANT),
      body: json.encode(favData),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> deletedFavoriteProduct(String id) async {
    final Map<String, dynamic> data = {
      'id': id,
    };

    String token = await UserPreference().getToken();
    http.Response res = await http.post(
      Uri.parse(AppUrl.DELETE_FAVORITE_PRODUCT),
      body: json.encode(data),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> deletedFavoriteRestaurant(String id) async {
    final Map<String, dynamic> data = {
      'id': id,
    };

    String token = await UserPreference().getToken();
    http.Response res = await http.post(
      Uri.parse(AppUrl.DELETE_FAVORITE_RESTAURANT),
      body: json.encode(data),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<void> updateAddress(String phoneNumber, String name, String province,
      String district, String ward, String street) async {
    UserPreference()
        .updateAddress(phoneNumber, name, province, district, ward, street);
  }

  String get getName => sharedPreferences.containsKey(AppConstant.NAME)
      ? sharedPreferences.getString(AppConstant.NAME)!
      : "";
  String get getProvince => sharedPreferences.containsKey(AppConstant.PROVINCE)
      ? sharedPreferences.getString(AppConstant.PROVINCE)!
      : "";
  String get getDistrict => sharedPreferences.containsKey(AppConstant.DISTRICT)
      ? sharedPreferences.getString(AppConstant.DISTRICT)!
      : "";
  String get getWard => sharedPreferences.containsKey(AppConstant.WARD)
      ? sharedPreferences.getString(AppConstant.WARD)!
      : "";
  String get getStreet => sharedPreferences.containsKey(AppConstant.STREET)
      ? sharedPreferences.getString(AppConstant.STREET)!
      : "";
  String get getPhone => sharedPreferences.containsKey(AppConstant.PHONE_NUMBER)
      ? sharedPreferences.getString(AppConstant.PHONE_NUMBER)!
      : "";
}
