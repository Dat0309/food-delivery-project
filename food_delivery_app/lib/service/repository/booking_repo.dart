import 'dart:convert';

import 'package:food_delivery_app/constant/app_constant.dart';
import 'package:food_delivery_app/constant/app_url.dart';
import 'package:food_delivery_app/controller/booking_controller.dart';
import 'package:food_delivery_app/models/BookingItem.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookingRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  BookingRepo({required this.sharedPreferences});

  List<String> booking = [];

  void addToBookingList(List<BookingItem> bookings) {
    sharedPreferences.remove(AppConstant.BOOKING);
    bookings.clear();

    for (var element in bookings) {
      booking.add(jsonEncode(element));
    }
    sharedPreferences.setStringList(AppConstant.BOOKING, booking);
    getBookingList();
  }

  List<BookingItem> getBookingList() {
    List<String> bookingList = [];
    if (sharedPreferences.containsKey(AppConstant.BOOKING)) {
      bookingList = sharedPreferences.getStringList(AppConstant.BOOKING)!;
    }
    List<BookingItem> bookings = [];
    for (var element in bookingList) {
      bookings.add(BookingItem.fromJson(jsonDecode(element)));
    }

    return bookings;
  }

  void clearBookingStorage() {
    booking.clear();
    sharedPreferences.remove(AppConstant.BOOKING);
  }

  Future<http.Response> getBookingByID(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.BOOKINGS + "/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getUserBooking() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.BOOKINGS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> createBooking(
    String uid,
    List<BookingItem> booking,
    String paymentMethod,
    String tableId,
    int itemPrice,
    double totalPrice,
    String date,
    String time,
  ) async {
    String token = await UserPreference().getToken();
    var bookingItem = jsonEncode(booking.map((e) => e.toJson()).toList());
    print(bookingItem);

    final Map<String, dynamic> bookings = {
      "booking_items": Get.find<BookingController>().getItems,
      "table_id": tableId,
      "paymentMethod": paymentMethod,
      "user": uid,
      "itemsPrice": itemPrice,
      "totalPrice": totalPrice,
      "date": date,
      "time": time,
    };

    http.Response response = await http.post(
      Uri.parse(AppUrl.BOOKINGS),
      body: json.encode(bookings),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
