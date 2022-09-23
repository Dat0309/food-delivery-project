import 'dart:convert';

import 'package:food_delivery_app/models/Booking.dart';
import 'package:food_delivery_app/service/repository/booking_repo.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final BookingRepo bookingRepo;

  BookingController({required this.bookingRepo});

  List<dynamic> bookings = [];
  List<dynamic> userBookings = [];
  Booking? booking;

  bool isLoadedBookings = false;
  bool isLoadingBooking = false;
  bool isLoadedUserBookings = false;
  bool isCreated = false;

  Future<void> getSingleBooking(String id) async {
    isLoadingBooking = false;
    await bookingRepo.getBookingByID(id).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);
        if (resData['booking'].length > 0) {
          for (int i = 0; i < resData['booking'].length; i++) {
            if (resData['booking'][i] != null) {
              Map<String, dynamic> map = resData['booking'][i];
              bookings.add(Booking.fromJson(map));
            }
          }
          isLoadedBookings = true;
          update();
        }
      } else {}
    });
  }

  Future<void> getUserBooking() async {
    isLoadedUserBookings = false;
    await bookingRepo.getUserBooking().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);
        if (resData['booking'].length > 0) {
          for (int i = 0; i < resData['booking'].length; i++) {
            if (resData['booking'][i] != null) {
              Map<String, dynamic> map = resData['booking'][i];
              userBookings.add(Booking.fromJson(map));
            }
          }
          isLoadedUserBookings = true;
          update();
        }
      }
    });
  }
}
