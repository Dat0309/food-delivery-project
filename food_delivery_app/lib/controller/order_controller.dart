import 'dart:convert';

import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/models/Cart.dart';
import 'package:food_delivery_app/models/Order.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:food_delivery_app/service/repository/order_repo.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final OrderRepo orderRepo;

  OrderController({required this.orderRepo});

  List<dynamic> orders = [];
  List<dynamic> userOrders = [];
  Order? order;
  CartController cartController = Get.find();

  bool isLoadedOrders = false;
  bool isLoadingOrder = false;
  bool isLoadedUserOrder = false;
  bool isCreated = false;

  Future<void> getOrders() async {
    isLoadingOrder = false;
    await orderRepo.getOrders().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData.isNotEmpty) {
          orders.clear();
          for (var item in resData.values) {
            orders.add(Order.fromJson(item));
          }
          isLoadedOrders = true;
          update();
        }
      }
    });
  }

  Future<void> getSingleOrder(String id) async {
    await orderRepo.getOrdersByID(id).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);
        if (resData.isNotEmpty) {
          order = Order.fromJson(resData);
          isLoadingOrder = true;
          update();
        }
      } else {}
    });
  }

  Future<void> getUserOrder() async {
    isLoadedUserOrder = false;
    String uid = await UserPreference().getUser().then((value) => value.id!);
    await orderRepo.getUserOrder(uid).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['order'] != null) {
          userOrders.clear();
          for (var item in resData['order']) {
            userOrders.add(Order.fromJson(item));
          }
          isLoadedUserOrder = true;
          update();
        }
      }
    });
  }

  Future<Map<String, dynamic>> createOrder(
    List<Cart> cart,
    String paymentMethod,
    String phoneNumber,
    double taxPrice,
    int shippingPrice,
    int itemPrice,
    var address,
    double totalPrice,
  ) async {
    var result;
    String uid = await UserPreference().getUser().then((value) => value.id!);
    await orderRepo
        .createOrder(uid, cart, paymentMethod, phoneNumber, taxPrice,
            shippingPrice, itemPrice, address, totalPrice)
        .then((value) {
      print(value.body);
      if (value.statusCode == 201) {
        final Map<String, dynamic> resData = json.decode(value.body);
        Order order = Order.fromJson(resData);
        isCreated = true;

        result = {
          'status': true,
          'message': 'Successful',
          'order': order,
        };
        cartController.clearCart();
        update();
      } else {
        result = {
          'status': false,
          'message': 'error',
        };
        update();
      }
    });
    return result;
  }
}
