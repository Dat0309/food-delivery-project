import 'package:food_delivery_app/models/Review.dart';

class Restaurant {
  String? id;
  String? name;
  String? description;
  String? province;
  String? district;
  String? ward;
  String? street;
  String? contact;
  String? image;
  String? thumb;
  List<dynamic>? reviews;
  num? rating;
  num? numReviews;
  String? logitude;
  String? latitude;
  String? createdAt;
  String? updatedAt;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.province,
    this.district,
    this.ward,
    this.street,
    this.contact,
    this.image,
    this.thumb,
    this.reviews,
    this.rating,
    this.numReviews,
    this.logitude,
    this.latitude,
    this.createdAt,
    this.updatedAt,
  });

  factory Restaurant.fromJson(Map<String, dynamic> responseData) {
    return Restaurant(
      id: responseData['_id'],
      name: responseData['name'],
      description: responseData['description'],
      province: responseData['province'],
      district: responseData['district'],
      ward: responseData['ward'],
      street: responseData['street'],
      contact: responseData['contact'],
      image: responseData['image'],
      thumb: responseData['thumb'],
      reviews: responseData['revirews'],
      rating: responseData['rating'],
      numReviews: responseData['num_reviews'],
      logitude: responseData['longitude'],
      latitude: responseData['latitude'],
      createdAt: responseData['createAt'],
      updatedAt: responseData['updateAt'],
    );
  }
}
