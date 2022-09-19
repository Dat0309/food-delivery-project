import 'dart:convert';

import 'package:food_delivery_app/models/ProfileModel.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:food_delivery_app/service/repository/user_repo.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool isLoadedProfile = false;

  late Profile? profile;

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
          isLoadedProfile = true;
          update();
        }
      }
    });
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
