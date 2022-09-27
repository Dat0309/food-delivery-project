import 'dart:convert';

import 'package:food_delivery_app/models/TableModel.dart';
import 'package:food_delivery_app/service/repository/table_repo.dart';
import 'package:get/get.dart';

class TableController extends GetxController {
  final TableRepo tableRepo;

  TableController({required this.tableRepo});

  List<dynamic> tables = [];
  TableModel? table;

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
              tables.add(TableModel.fromJson(map));
            }
          }
          isLoadedTable = true;
          update();
        }
      }
    });
  }

  Future<void> saveTable(TableModel table) async {
    await tableRepo.saveTableReserve(table);
    update();
  }

  Future<void> saveDate(String date) async {
    await tableRepo.saveDate(date);
    update();
  }

  Future<void> saveTime(String time) async {
    await tableRepo.saveTime(time);
    update();
  }

  void clearTable() {
    tableRepo.removeTable();
    update();
  }

  void clearDate() {
    tableRepo.removeDate();
    update();
  }

  void clearTime() {
    tableRepo.removeTime();
  }

  String get getTableId {
    return tableRepo.getTableStorage()['table_id'];
  }

  String get getTableCode {
    return tableRepo.getTableStorage()['table_code'];
  }

  String get date {
    return tableRepo.getDate();
  }

  String get time {
    return tableRepo.getTime();
  }
}
