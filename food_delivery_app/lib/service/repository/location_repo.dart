import 'package:food_delivery_app/constant/app_url.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LocationRepo {
  final SharedPreferences sharedPreferences;
  LocationRepo({required this.sharedPreferences});

  Future<http.Response> getAddressfromGeocode(LatLng latLng) async {
    var token = UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.GEOCODE_URI +
          '?lat=${latLng.latitude}&long=${latLng.longitude}&key=${AppUrl.GEOCODE_KEY}'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
