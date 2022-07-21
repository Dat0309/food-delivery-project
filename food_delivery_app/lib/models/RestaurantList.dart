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
    if (responseData['restaurant'] != null) {
      List<Restaurant> restaurantList = [];
      restaurantList.clear();
      responseData['restaurant']
          .forEach((e) => {restaurantList.add(Restaurant.fromJson(e))});
      return RestaurantList(
        count: responseData['count'],
        page: responseData['page'],
        pages: responseData['pages'],
        restaurants: restaurantList,
      );
    } else {
      return RestaurantList(
        count: responseData['count'],
        page: responseData['page'],
        pages: responseData['pages'],
        restaurants: [],
      );
    }
  }
}
