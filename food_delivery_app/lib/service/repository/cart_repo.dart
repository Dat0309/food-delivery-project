import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_delivery_app/models/Cart.dart';

class CartRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<Cart> carts) {
    cart.clear();
    /**
     * Chuyển định dạng dữ liệu từ json sang string vì sharedPreference chỉ nhậN dữ liệu string
     */
    carts.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList("CARTS", cart);
    getCartList();
  }

  List<Cart> getCartList() {
    List<String> cartList = [];
    if (sharedPreferences.containsKey('CARTS')) {
      cartList = sharedPreferences.getStringList('CARTS')!;
    }
    List<Cart> carts = [];

    cartList
        .forEach((element) => carts.add(Cart.fromJson(jsonDecode(element))));

    return carts;
  }

  void addToCartHistoryList() {}
}
