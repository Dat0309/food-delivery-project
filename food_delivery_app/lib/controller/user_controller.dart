import 'dart:convert';

import 'package:food_delivery_app/models/ProfileModel.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:food_delivery_app/service/repository/user_repo.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool isLoadedProfile = false;

  Profile? profile;

  Future<void> getProfile() async {
    await userRepo.getProfile().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData.isNotEmpty) {
          profile = Profile.fromJson(resData);
          isLoadedProfile = true;
          UserPreference().saveAddress(profile!);
          update();
        }
      }
    });
  }

  String get getProvince => userRepo.getProvince;
  String get getDistrict => userRepo.getDistrict;
  String get getWard => userRepo.getWard;
  String get getStreet => userRepo.getStreet;
  String get getPhone => userRepo.getPhone;
}
