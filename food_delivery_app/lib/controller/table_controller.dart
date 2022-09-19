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

        if (resData['tables'].length > 0) {
          tables.clear();
          for (int i = 0; i < resData['tables'].length; i++) {
            if (resData['tables'][i] != null) {
              Map<String, dynamic> map = resData['tables'][i];
              tables.add(Table.fromJson(map));
            }
          }
          isLoadedTable = true;
          update();
        }
      }
    });
  }
}
