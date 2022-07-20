import 'package:food_delivery_app/models/Restaurant.dart';

class RestaurantList {
  int? count;
  int? page;
  int? pages;
  List<Restaurant>? restaurants;

  RestaurantList({
    this.count,
    this.page,
    this.pages,
    this.restaurants,
  });

  factory RestaurantList.fromJson(Map<String, dynamic> responseData) {
    return RestaurantList(
      count: responseData['count'],
      page: responseData['page'],
      pages: responseData['pages'],
      restaurants: responseData['restaurant'],
    );
  }
}
