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
    if (responseData['product'] != null) {
      List<Product> productsList = [];
      productsList.clear();
      responseData['product']
          .forEach((e) => {productsList.add(Product.fromJson(e))});
      return ProductList(
        count: responseData['count'],
        page: responseData['page'],
        pages: responseData['pages'],
        products: productsList,
      );
    } else {
      return ProductList(
        count: responseData['count'],
        page: responseData['page'],
        pages: responseData['pages'],
        products: [],
      );
    }
  }
}
