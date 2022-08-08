import 'package:food_delivery_app/models/Product.dart';

class Cart {
  String? name;
  int? qty;
  String? image;
  int? price;
  String? foodId;
  String? time;

  Cart({
    this.name,
    this.qty,
    this.image,
    this.price,
    this.foodId,
    this.time,
  });

  factory Cart.fromJson(Map<String, dynamic> res) {
    return Cart(
      name: res['name'],
      qty: res['qty'],
      image: res['image'],
      price: res['price'],
      foodId: res['product'],
      time: res['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product": foodId,
      "name": name,
      "qty": qty,
      "image": image,
      "price": price,
      "time": time,
    };
  }
}
