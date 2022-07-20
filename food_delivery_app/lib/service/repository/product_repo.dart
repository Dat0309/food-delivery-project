import 'package:food_delivery_app/constant/app_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductRepo extends GetxService {
  ProductRepo();

  var token = "";
  Future<http.Response> getProductList() async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.GET_PRODUCTS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
