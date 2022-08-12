import 'dart:convert';

import 'package:food_delivery_app/models/Cart.dart';
import 'package:food_delivery_app/models/Order.dart';
import 'package:food_delivery_app/service/repository/order_repo.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final OrderRepo orderRepo;

  OrderController({required this.orderRepo});

  List<dynamic> orders = [];
  List<dynamic> userOrders = [];
  Order? order;

  bool isLoadedOrders = false;
  bool isLoadingOrder = false;
  bool isLoadedUserOrder = false;
  bool isCreated = false;

  Future<void> getOrders() async {
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

  Future<void> getUserOrder(String uid) async {
    await orderRepo.getUserOrder(uid).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['order'].isNotEmpty) {
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
    String uid,
    List<Cart> cart,
    String paymentMethod,
    double taxPrice,
    double shippingPrice,
    double itemPrice,
    var address,
    double totalPrice,
  ) async {
    var result;
    await orderRepo
        .createOrder(uid, cart, paymentMethod, taxPrice, shippingPrice,
            itemPrice, address, totalPrice)
        .then((value) {
      if (value.statusCode == 201) {
        final Map<String, dynamic> resData = json.decode(value.body);
        Order order = Order.fromJson(resData);
        isCreated = true;

        result = {
          'status': true,
          'message': 'Successful',
          'order': order,
        };
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
