import 'package:food_delivery_app/models/Table.dart';

class TableList {
  int? count;
  int? page;
  int? pages;
  List<Table>? tables;

  TableList({
    this.count,
    this.page,
    this.pages,
    this.tables,
  });

  factory TableList.fromJson(Map<String, dynamic> responseData) {
    return TableList(
      count: responseData['count'],
      page: responseData['page'],
      pages: responseData['pages'],
      tables: responseData['tables'],
    );
  }
}
