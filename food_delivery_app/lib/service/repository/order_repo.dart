import 'dart:convert';

import 'package:food_delivery_app/constant/app_url.dart';
import 'package:food_delivery_app/models/Cart.dart';
import 'package:food_delivery_app/models/Order.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderRepo extends GetxService {
  OrderRepo();

  var token = UserPreference().getToken();

  Future<http.Response> adminGetOrders() async {
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
    double taxPrice,
    double shippingPrice,
    double itemPrice,
    var address,
    double totalPrice,
  ) async {
    var orderItems = jsonEncode(cart.map((e) => e.toJson()).toList());

    final Map<String, dynamic> orders = {
      "orderItems": [orderItems],
      "shipping_address": {
        "address": {
          address,
        },
      },
      "payment_method": paymentMethod,
      "user": uid,
      "items_price": itemPrice,
      "tax_price": taxPrice,
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
