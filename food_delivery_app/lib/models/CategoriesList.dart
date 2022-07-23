// ignore_for_file: file_names

import 'package:food_delivery_app/models/Category.dart';

class CategoriesList {
  int? count;
  int? page;
  int? pages;
  List<Category>? categories;

  CategoriesList({
    this.count,
    this.page,
    this.pages,
    this.categories,
  });

  factory CategoriesList.fromJson(Map<String, dynamic> responseData) {
    return CategoriesList(
      count: responseData['count'],
      page: responseData['page'],
      pages: responseData['pages'],
      categories: responseData['categories'],
    );
  }
}
