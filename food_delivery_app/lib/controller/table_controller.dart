import 'dart:convert';

import 'package:food_delivery_app/models/Table.dart';
import 'package:food_delivery_app/service/repository/table_repo.dart';
import 'package:get/get.dart';

class TableController extends GetxController {
  final TableRepo tableRepo;

  TableController({required this.tableRepo});

  List<dynamic> tables = [];
  Table? table;

  bool isLoadedTable = false;

  Future<void> getTablesByRestaurantId(String id) async {
    isLoadedTable = false;
    await tableRepo.getTablesByRestaurantID(id).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData.isNotEmpty) {
          tables.clear();
          for (var item in resData.values) {
            tables.add(Table.fromJson(item));
          }
          isLoadedTable = true;
          update();
        }
      }
    });
  }
}
