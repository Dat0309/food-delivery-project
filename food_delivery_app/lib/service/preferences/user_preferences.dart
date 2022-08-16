import 'package:food_delivery_app/constant/app_constant.dart';
import 'package:food_delivery_app/models/AuthModel.dart';
import 'package:food_delivery_app/models/ProfileModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(AuthModel auth) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('id', auth.id!);
    sharedPreferences.setString('role', auth.role!);
    sharedPreferences.setString('token', auth.token!);
    sharedPreferences.setString('email', auth.email!);
    sharedPreferences.setString('createdAt', auth.createAt!);

    return sharedPreferences.commit();
  }

  Future<bool> saveAddress(Profile profile) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString(AppConstant.PROVINCE, profile.province!);
    sharedPreferences.setString(AppConstant.DISTRICT, profile.district!);
    sharedPreferences.setString(AppConstant.WARD, profile.ward!);
    sharedPreferences.setString(AppConstant.STREET, profile.street!);
    sharedPreferences.setString(AppConstant.PHONE_NUMBER, profile.phoneNumber!);

    return sharedPreferences.commit();
  }

  Future<AuthModel> getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? id = sharedPreferences.getString("id");
    String? email = sharedPreferences.getString("email");
    String? role = sharedPreferences.getString("role");
    String? createAt = sharedPreferences.getString("createAt");
    String? token = sharedPreferences.getString("token");

    return AuthModel(
      id: id,
      email: email,
      role: role,
      createAt: createAt,
      token: token,
    );
  }

  void removeUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.remove("id");
    sharedPreferences.remove("email");
    sharedPreferences.remove("role");
    sharedPreferences.remove("createAt");
    sharedPreferences.remove("token");
  }

  void removeAddress() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.remove(AppConstant.PROVINCE);
    sharedPreferences.remove(AppConstant.DISTRICT);
    sharedPreferences.remove(AppConstant.WARD);
    sharedPreferences.remove(AppConstant.STREET);
    sharedPreferences.remove(AppConstant.PHONE_NUMBER);
  }

  Future<String> getToken() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    String result = "";
    if (sharedPreference.containsKey(AppConstant.TOKEN)) {
      result = sharedPreference.getString(AppConstant.TOKEN)!;
    }
    return result;
  }
}
