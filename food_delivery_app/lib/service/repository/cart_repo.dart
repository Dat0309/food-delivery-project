import 'dart:convert';

import 'package:food_delivery_app/constant/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_delivery_app/models/Cart.dart';

class CartRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<Cart> carts) {
    sharedPreferences.remove(AppConstant.CART);
    cart.clear();
    /**
     * Chuyển định dạng dữ liệu từ json sang string vì sharedPreference chỉ nhậN dữ liệu string
     */
    carts.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstant.CART, cart);
    getCartList();
  }

  List<Cart> getCartList() {
    List<String> cartList = [];
    if (sharedPreferences.containsKey(AppConstant.CART)) {
      cartList = sharedPreferences.getStringList(AppConstant.CART)!;
    }
    List<Cart> carts = [];

    cartList
        .forEach((element) => carts.add(Cart.fromJson(jsonDecode(element))));

    return carts;
  }

  List<Cart> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstant.CART_HISTORY)) {
      cartHistory.clear();
      cartHistory = sharedPreferences.getStringList(AppConstant.CART_HISTORY)!;
    }
    List<Cart> cartListHistory = [];
    cartHistory.forEach(
        (element) => cartListHistory.add(Cart.fromJson(jsonDecode(element))));

    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstant.CART_HISTORY)) {
      cartHistory = sharedPreferences.getStringList(AppConstant.CART_HISTORY)!;
    }
    for (var item in cart) {
      cartHistory.add(item);
    }
    cart.clear();
    sharedPreferences.remove(AppConstant.CART);
    sharedPreferences.setStringList(AppConstant.CART_HISTORY, cartHistory);
  }
}
