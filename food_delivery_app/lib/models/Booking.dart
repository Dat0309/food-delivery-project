// ignore_for_file: file_names

import 'package:food_delivery_app/models/Order.dart';

class Booking {
  String? id;
  String? tableCode;
  String? userName;
  String? userId;
  String? tableId;
  String? restaurantId;
  List<dynamic>? bookingItem;
  String? paymentMethod;
  Map<String, dynamic>? paymentResult;
  num? totalPrice;
  bool? isPaid;
  String? paidAt;
  String? createAt;
  String? updateAt;
  String? date;
  String? time;
  bool? status;

  Booking({
    this.id,
    this.tableCode,
    this.userName,
    this.userId,
    this.tableId,
    this.bookingItem,
    this.paymentMethod,
    this.paymentResult,
    this.totalPrice,
    this.isPaid,
    this.paidAt,
    this.createAt,
    this.updateAt,
    this.date,
    this.time,
    this.status,
    this.restaurantId,
  });

  factory Booking.fromJson(Map<String, dynamic> res) {
    return Booking(
      id: res['id'],
      tableCode: res['table_code'],
      userName: res['user_name'],
      userId: res['user_id'],
      tableId: res['table_id'],
      restaurantId: res['restaurant_id'],
      bookingItem: res['booking_items'],
      paymentMethod: res['payment_method'],
      paymentResult: res['payment_result'],
      totalPrice: res['total_price'],
      date: res['date'],
      time: res['time'],
      isPaid: res['is_paid'],
      paidAt: res['paid_at'],
      createAt: res['createAt'],
      updateAt: res['updateAt'],
      status: res['status'],
    );
  }
}
