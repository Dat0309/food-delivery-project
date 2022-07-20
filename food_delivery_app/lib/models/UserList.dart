import 'package:food_delivery_app/models/User.dart';

class UserList {
  int? count;
  int? page;
  int? pages;
  List<User>? users;

  UserList({
    this.count,
    this.page,
    this.pages,
    this.users,
  });

  factory UserList.fromJson(Map<String, dynamic> responseData) {
    return UserList(
      count: responseData['count'],
      page: responseData['page'],
      pages: responseData['pages'],
      users: responseData['users'],
    );
  }
}
