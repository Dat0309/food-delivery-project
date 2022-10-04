import 'dart:convert';

import 'package:food_delivery_app/models/AuthModel.dart';
import 'package:food_delivery_app/models/User.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:food_delivery_app/service/repository/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  bool isLogged = false;
  bool userLogged = false;
  bool isRegistated = false;

  Future<Map<String, dynamic>> login(String username, String password) async {
    var result;
    await authRepo.login(username, password).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);
        AuthModel authUser = AuthModel.fromJson(resData);
        UserPreference().saveUser(authUser);
        authRepo.saveUserToken(authUser.token!);
        isLogged = true;
        result = {
          'status': true,
          'message': 'Successful',
          'user': authUser,
        };
        update();
      } else {
        result = {
          'status': false,
          'message': 'error',
        };
        update();
      }
    });
    return result;
  }

  Future<Map<String, dynamic>> register(User user) async {
    var result;
    await authRepo.register(user).then((value) {
      if (value.statusCode == 201) {
        final Map<String, dynamic> resData = json.decode(value.body);
        User userRegister = User.fromJson(resData);
        isRegistated = true;
        result = {
          'status': true,
          'message': 'Successful',
          'user': userRegister,
        };
        update();
      } else {
        result = {
          'status_code': value.statusCode,
          'status': false,
          'message': value.body,
        };
        update();
      }
    });
    return result;
  }

  void saveUsernamePassword(String username, String password) {
    authRepo.saveUsernamePassword(username, password);
  }

  void checkUserLogged() {
    UserPreference().getUser().then((value) {
      if (value.token != null) {
        userLogged = true;
        update();
      } else {
        userLogged = false;
        update();
      }
    });
    update();
  }
}
