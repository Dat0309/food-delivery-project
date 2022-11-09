import 'dart:convert';

import 'package:food_delivery_app/models/FavoriteProductModel.dart';
import 'package:food_delivery_app/models/ProfileModel.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:food_delivery_app/service/repository/user_repo.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool isLoadedProfile = false;

  late Profile? profile;
  List<dynamic> favProductList = [];
  List<dynamic> favRestaurantList = [];

  Future<void> getProfile() async {
    await userRepo.getProfile().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData.isNotEmpty) {
          profile = Profile.fromJson(resData);
          UserPreference().saveAddress(
            profile?.phoneNumber! as String,
            profile?.lastName! as String,
            profile?.firstName! as String,
            profile?.province! as String,
            profile?.district! as String,
            profile?.ward! as String,
            profile?.street! as String,
          );
          favProductList.clear();
          favRestaurantList.clear();

          favProductList = resData['favoriteProducts'];
          favRestaurantList = resData['favoriteRestaurants'];
          isLoadedProfile = true;
          update();
        }
      }
    });
  }

  Future<Map<String, dynamic>> favoriteProduct(
      String name, String image, int price, String id) async {
    var result;
    await userRepo.favoriteProducts(name, image, price, id).then((value) {
      if (value.statusCode == 201) {
        final Map<String, dynamic> resData = json.decode(value.body);
        result = {
          'status': true,
          'message': 'Successfull',
          'data': resData,
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

  Future<Map<String, dynamic>> favoriteRestaurant(
      String name, String image, int thumb, String id) async {
    var result;
    await userRepo.favoriteRestaurants(name, image, thumb, id).then((value) {
      if (value.statusCode == 201) {
        final Map<String, dynamic> resData = json.decode(value.body);
        result = {
          'status': true,
          'message': 'Successfull',
          'data': resData,
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

  Future<void> updateAddress(String phoneNumber, String name, String province,
      String district, String ward, String street) async {
    userRepo.updateAddress(phoneNumber, name, province, district, ward, street);
    update();
  }

  String get address =>
      getStreet + ", " + getWard + ", " + getDistrict + ", " + getProvince;

  String get getName => userRepo.getName;
  String get getProvince => userRepo.getProvince;
  String get getDistrict => userRepo.getDistrict;
  String get getWard => userRepo.getWard;
  String get getStreet => userRepo.getStreet;
  String get getPhone => userRepo.getPhone;
}
