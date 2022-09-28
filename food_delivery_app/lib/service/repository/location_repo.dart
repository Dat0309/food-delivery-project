import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LocationRepo {
  final SharedPreferences sharedPreferences;
  LocationRepo({required this.sharedPreferences});

  getAddressfromGeocode(LatLng latLng) async {}
}
