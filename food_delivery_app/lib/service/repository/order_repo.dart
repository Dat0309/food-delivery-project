import 'dart:convert';

import 'package:food_delivery_app/constant/app_url.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/models/Cart.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderRepo extends GetxService {
  OrderRepo();

  Future<http.Response> adminGetOrders() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.ADMIN_GET_ORDERS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getOrders() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.ORDERS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getOrdersByID(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.ORDERS + "/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getUserOrder(String uid) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.GET_USER_ORDER + "/$uid"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> createOrder(
    String uid,
    List<Cart> cart,
    String paymentMethod,
    String phoneNumber,
    double taxPrice,
    int shippingPrice,
    int itemPrice,
    var address,
    double totalPrice,
  ) async {
    String token = await UserPreference().getToken();
    var orderItems = jsonEncode(cart.map((e) => e.toJson()).toList());
    print(orderItems);

    final Map<String, dynamic> orders = {
      "orderItems": Get.find<CartController>().getItems,
      "shipping_address": {"address": address},
      "payment_method": paymentMethod,
      "user": uid,
      "items_price": itemPrice,
      "tax_price": taxPrice,
      "phone_number": phoneNumber,
      "shipping_price": shippingPrice,
      "total_price": totalPrice,
    };

    http.Response response = await http.post(
      Uri.parse(AppUrl.ORDERS),
      body: json.encode(orders),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
