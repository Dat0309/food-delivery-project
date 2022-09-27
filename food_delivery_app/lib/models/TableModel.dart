class TableModel {
  String? id;
  String? restaurantId;
  String? code;
  bool? status;
  int? capacity;

  TableModel(
      {this.id, this.restaurantId, this.code, this.status, this.capacity});

  factory TableModel.fromJson(Map<String, dynamic> res) {
    return TableModel(
      id: res['_id'],
      restaurantId: res['restaurant_id'],
      code: res['code'],
      status: res['status'],
      capacity: res['capacity'],
    );
  }
}
