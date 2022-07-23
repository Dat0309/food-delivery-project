// ignore_for_file: file_names

import 'package:food_delivery_app/models/Order.dart';

class Booking {
  String? id;
  String? userId;
  String? restaurantId;
  String? tableId;
  List<OrderItem>? orderItems;
  String? paymentMethod;
  PaymentResult? paymentResult;
  double? totalPrice;
  bool? isPaid;
  String? paidAt;
  String? createAt;
  String? updateAt;

  Booking({
    this.id,
    this.userId,
    this.restaurantId,
    this.tableId,
    this.orderItems,
    this.paymentMethod,
    this.paymentResult,
    this.totalPrice,
    this.isPaid,
    this.paidAt,
    this.createAt,
    this.updateAt,
  });

  factory Booking.fromJson(Map<String, dynamic> res) {
    return Booking(
      id: res['id'],
      userId: res['user_id'],
      restaurantId: res['restaurant_id'],
      tableId: res['table_id'],
      orderItems: res['orderItems'],
      paymentMethod: res['payment_method'],
      paymentResult: res['payment_result'],
      totalPrice: res['total_price'],
      isPaid: res['is_paid'],
      paidAt: res['paid_at'],
      createAt: res['createAt'],
      updateAt: res['updateAt'],
    );
  }
}
