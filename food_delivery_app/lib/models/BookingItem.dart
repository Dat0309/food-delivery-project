class BookingItem {
  String? name;
  int? qty;
  String? image;
  int? price;
  String? foodId;

  BookingItem({
    this.name,
    this.qty,
    this.image,
    this.price,
    this.foodId,
  });

  factory BookingItem.fromJson(Map<String, dynamic> res) {
    return BookingItem(
      name: res['name'],
      qty: res['qty'],
      image: res['image'],
      price: res['price'],
      foodId: res['product'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product": foodId,
      "name": name,
      "qty": qty,
      "image": image,
      "price": price,
    };
  }
}
