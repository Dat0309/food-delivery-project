import 'package:food_delivery_app/constant/app_url.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductRepo extends GetxService {
  ProductRepo();

  var token = UserPreference().getToken();
  Future<http.Response> getProductList() async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.PRODUCTS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getProductsByCategory(String catId) async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.GET_PRODUCT_BY_CATID + catId),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getProductByRestaurantId(String resId) async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.GET_PRODUCT_BY_RESTAURANTID + resId),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
