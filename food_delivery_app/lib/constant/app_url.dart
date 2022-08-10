// ignore_for_file: constant_identifier_names

class AppUrl {
  static const int APP_VERSION = 1;
  static const String BASEURL = "https://smart-fooding.herokuapp.com";

  static const String GET_PRODUCTS = BASEURL + "/api/product";
  static const String GET_RESTAURANTS = BASEURL + "/api/restaurants";
  static const String GET_CATEGORIES = BASEURL + "/api/categories";

  static const String LOGIN = BASEURL + "/api/users/login";
  static const String REGISTER = BASEURL + "api/users";
  static const String PROFILE = BASEURL + "api/users/profile";
}
