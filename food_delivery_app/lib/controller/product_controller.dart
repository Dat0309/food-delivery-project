import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/models/Cart.dart';
import 'package:food_delivery_app/models/Product.dart';
import 'package:food_delivery_app/service/repository/product_repo.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;

  ProductController({required this.productRepo});

  List<dynamic> popularProducts = [];
  bool isLoaded = false;
  CartController _cart = Get.find<CartController>();

  int _quantity = 1;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;

  bool _itemExist = false;
  bool get itemExist => _itemExist;

  int get cartTotalItem => _cart.totalItems;
  int get cartTotalPrice => _cart.totalPrice;

  void initProduct(Product product, CartController cartController) {
    _cart = cartController;
    _quantity = 1;
    _inCartItem = 0;
    _itemExist = cartController.existInCart(product);
  }

  Future<void> getPopularProducts() async {
    await productRepo.getProductList().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['products'].length > 0) {
          popularProducts.clear();
          for (int i = 0; i < resData['products'].length; i++) {
            if (resData['products'][i] != null) {
              Map<String, dynamic> map = resData['products'][i];
              popularProducts.add(Product.fromJson(map));
            }
          }
          isLoaded = true;
          update();
        }
      } else {}
      return value;
    });
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQty(_quantity + 1);
    } else {
      _quantity = checkQty(_quantity - 1);
    }
    update();
  }

  int checkQty(int qty) {
    if (qty < 0) {
      return 0;
    } else if (qty > 20) {
      Get.snackbar(
        'Số lượng mua',
        'Bạn chỉ được mua số lượng tối đa là 20 của một sản phẩm!',
        backgroundColor: AppColors.primaryColor,
        colorText: Colors.white,
      );
      return 20;
    }
    return qty;
  }

  void addItem(Product product) {
    if (_quantity > 0) {
      _cart.addItem(product, _quantity);
    } else {
      Get.snackbar(
        'Lỗi',
        'Xin hãy chọn số lượng sản phẩm trước khi thêm vào giỏ hàng!',
        backgroundColor: AppColors.primaryColor,
        colorText: Colors.white,
      );
    }
    update();
  }

  void removeItem(Cart cart) {
    _cart.removeItem(cart);
  }

  List<Cart> get getItems {
    return _cart.getItems;
  }
}
