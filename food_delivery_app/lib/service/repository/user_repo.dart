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

  String get getProvince => sharedPreferences.getString(AppConstant.PROVINCE)!;
  String get getDistrict => sharedPreferences.getString(AppConstant.DISTRICT)!;
  String get getWard => sharedPreferences.getString(AppConstant.WARD)!;
  String get getStreet => sharedPreferences.getString(AppConstant.STREET)!;
  String get getPhone => sharedPreferences.getString(AppConstant.PHONE_NUMBER)!;
}
