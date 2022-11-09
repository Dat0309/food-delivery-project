class FavoriteProduct {
  String? name;
  String? image;
  num? price;
  String? product;

  FavoriteProduct({
    this.name,
    this.image,
    this.price,
    this.product,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> resData) {
    return FavoriteProduct(
      name: resData['name'],
      image: resData['image'],
      price: resData['price'],
      product: resData['product'],
    );
  }
}
