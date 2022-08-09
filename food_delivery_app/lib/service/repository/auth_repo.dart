import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.sharedPreferences,
  });

  var token = "";
}
