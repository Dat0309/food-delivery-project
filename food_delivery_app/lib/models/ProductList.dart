import 'package:food_delivery_app/models/Product.dart';

class ProductList {
  int? count;
  int? page;
  int? pages;
  List<Product>? products;

  ProductList({
    this.count,
    this.page,
    this.pages,
    this.products,
  });

  factory ProductList.fromJson(Map<String, dynamic> responseData) {
    return ProductList(
      count: responseData['count'],
      page: responseData['page'],
      pages: responseData['pages'],
      products: responseData['products'],
    );
  }
}
