class Review {
  String? name;
  String? image;
  double? rating;
  String? comment;
  String? user;

  Review({this.name, this.image, this.rating, this.comment, this.user});

  factory Review.fromJson(Map<String, dynamic> responseData) {
    return Review(
      name: responseData['name'],
      image: responseData['image'],
      rating: responseData['rating'],
      comment: responseData['comment'],
      user: responseData['user'],
    );
  }
}
