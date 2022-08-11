// ignore_for_file: constant_identifier_names

class AppUrl {
  static const int APP_VERSION = 1;
  static const String BASEURL = "https://smart-fooding.herokuapp.com";

  static const String PRODUCTS = BASEURL + "/api/product";
  static const String RESTAURANTS = BASEURL + "/api/restaurants";
  static const String CATEGORIES = BASEURL + "/api/categories";
  static const String ORDERS = BASEURL + "/api/orders";
  static const String USERS = BASEURL + "/api/users";
  static const String BOOKINGS = BASEURL + "/api/bookings";

  static const GET_PRODUCT_BY_CATID = PRODUCTS + "/category-id/";
  static const GET_USER_ORDER = ORDERS + "/user/";
  static const ADMIN_GET_PRODUCTS = PRODUCTS + "/all";
  static const ADMIN_GET_RESTAURANTS = RESTAURANTS + "/all";
  static const ADMIN_GET_ORDERS = ORDERS + "/all";
  static const ADMIN_GET_BOOKING = BOOKINGS + "/all";

  static const String LOGIN = BASEURL + "/api/users/login";
  static const String REGISTER = BASEURL + "/api/users";
  static const String PROFILE = BASEURL + "/api/users/profile";
}
