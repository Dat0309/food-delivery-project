import 'dart:convert';

import 'package:food_delivery_app/models/Booking.dart';
import 'package:food_delivery_app/models/BookingItem.dart';
import 'package:food_delivery_app/models/Product.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:food_delivery_app/service/repository/booking_repo.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final BookingRepo bookingRepo;

  BookingController({required this.bookingRepo});

  Map<String, BookingItem> items = {};
  List<BookingItem> storageItems = [];

  List<dynamic> bookings = [];
  List<dynamic> userBookings = [];
  Booking? booking;

  bool isLoadedBookings = false;
  bool isLoadingBooking = false;
  bool isLoadedUserBookings = false;
  bool isCreated = false;

  int get totalItems {
    var totalQuantity = 0;
    items.forEach((key, value) {
      totalQuantity += value.qty!;
    });
    //update();
    return totalQuantity;
  }

  int get totalPrice {
    var price = 0;
    items.forEach((key, value) {
      price += value.price! * value.qty!;
    });
    return price;
  }

  set setBooking(List<BookingItem> listItems) {
    storageItems = listItems;
    for (var item in storageItems) {
      items.putIfAbsent(item.foodId!, () => item);
    }
  }

  void updateItemQty(String id, int qty) {
    if (items.containsKey(id)) {
      items.update(
          id,
          (value) => BookingItem(
                name: value.name,
                foodId: value.foodId,
                image: value.image,
                price: value.price,
                qty: qty,
              ));
    }
    update();
  }

  void removeItem(Product product) {
    items.remove(product.id);
    bookingRepo.addToBookingList(getItems);
    update();
  }

  void addItem(Product product, int qty) {
    if (items.containsKey(product.id)) {
      items.update(product.id!, (value) {
        return BookingItem(
          name: value.name,
          foodId: value.foodId,
          image: value.image,
          price: value.price,
          qty: value.qty! + qty,
        );
      });
    } else {
      items.putIfAbsent(
          product.id!,
          () => BookingItem(
                name: product.name,
                foodId: product.id,
                image: product.image,
                price: product.price,
                qty: qty,
              ));
    }
    bookingRepo.addToBookingList(getItems);
    update();
  }

  bool existInBooking(Product product) {
    if (items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  List<BookingItem> get getItems {
    return items.entries.map((e) {
      return e.value;
    }).toList();
  }

  List<BookingItem> getBookingData() {
    setBooking = bookingRepo.getBookingList();
    return storageItems;
  }

  void clearBooking() {
    bookingRepo.clearBookingStorage();
    items.clear();
    update();
  }

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

  Future<Map<String, dynamic>> createBooking(
    List<BookingItem> booking,
    String paymentMethod,
    String tableId,
    int itemPrice,
    double totalPrice,
    String date,
    String time,
  ) async {
    var result;
    String uid = await UserPreference().getUser().then((value) => value.id!);
    await bookingRepo
        .createBooking(uid, booking, paymentMethod, tableId, itemPrice,
            totalPrice, date, time)
        .then((value) {
      if (value.statusCode == 201) {
        final Map<String, dynamic> resData = json.decode(value.body);
        Booking booking = Booking.fromJson(resData);
        isCreated = true;

        result = {
          'status': true,
          'message': 'Successful',
          'booking': booking,
        };

        clearBooking();
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
