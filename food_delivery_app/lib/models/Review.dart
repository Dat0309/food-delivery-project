class Review {
  String? name;
  double? rating;
  String? comment;
  String? user;

  Review({this.name, this.rating, this.comment, this.user});

  factory Review.fromJson(Map<String, dynamic> responseData) {
    return Review(
      name: responseData['name'],
      rating: responseData['rating'],
      comment: responseData['comment'],
      user: responseData['user'],
    );
  }
}
