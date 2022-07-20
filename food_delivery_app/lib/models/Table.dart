class Table {
  String? id;
  String? restaurantId;
  String? code;
  bool? status;
  int? capacity;

  Table({this.id, this.restaurantId, this.code, this.status, this.capacity});

  factory Table.fromJson(Map<String, dynamic> res) {
    return Table(
      id: res['_id'],
      restaurantId: res['restaurant_id'],
      code: res['code'],
      status: res['status'],
      capacity: res['capacity'],
    );
  }
}
