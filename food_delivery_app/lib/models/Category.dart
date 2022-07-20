class Category {
  String? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  factory Category.fromJson(Map<String, dynamic> res) {
    return Category(
      id: res['_id'],
      name: res['name'],
      image: res['image'],
    );
  }
}
