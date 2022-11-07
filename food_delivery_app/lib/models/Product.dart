import 'package:food_delivery_app/models/Review.dart';

class Product {
  String? id;
  String? name;
  String? image;
  String? categoriesId;
  String? menuId;
  String? description;
  List<dynamic>? reviews;
  num? rating;
  int? numReview;
  int? price;
  String? unit;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Product({
    this.id,
    this.name,
    this.image,
    this.categoriesId,
    this.menuId,
    this.description,
    this.reviews,
    this.rating,
    this.numReview,
    this.price,
    this.unit,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> responseData) {
    return Product(
      id: responseData['_id'],
      name: responseData['name'],
      image: responseData['image'],
      categoriesId: responseData['categories_id'],
      menuId: responseData['menu_id'],
      description: responseData['description'],
      reviews: responseData['reviews'],
      rating: responseData['rating'],
      numReview: responseData['num_reviews'],
      price: responseData['price'],
      unit: responseData['unit'],
      active: responseData['active'],
      createdAt: responseData['createAt'],
      updatedAt: responseData['updateAt'],
    );
  }
}
