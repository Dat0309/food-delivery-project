import 'package:food_delivery_app/constant/app_constant.dart';
import 'package:food_delivery_app/constant/app_url.dart';
import 'package:food_delivery_app/models/TableModel.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TableRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  TableRepo({required this.sharedPreferences});

  Future<bool> saveTableReserve(TableModel table) async {
    sharedPreferences.setString(AppConstant.TABLE_ID, table.id!);
    sharedPreferences.setString(AppConstant.TABLE_CODE, table.code!);

    return sharedPreferences.commit();
  }

  Future<bool> saveDate(String date) async {
    sharedPreferences.setString(AppConstant.DATE, date);

    return sharedPreferences.commit();
  }

  Future<bool> saveTime(String time) async {
    sharedPreferences.setString(AppConstant.TIME, time);

    return sharedPreferences.commit();
  }

  void removeTable() async {
    sharedPreferences.remove(AppConstant.TABLE_ID);
    sharedPreferences.remove(AppConstant.TABLE_CODE);
  }

  void removeDate() async {
    sharedPreferences.remove(AppConstant.DATE);
  }

  void removeTime() async {
    sharedPreferences.remove(AppConstant.TIME);
  }

  Map<String, dynamic> getTableStorage() {
    return {
      'table_id': sharedPreferences.getString(AppConstant.TABLE_ID),
      'table_code': sharedPreferences.getString(AppConstant.TABLE_CODE),
    };
  }

  String getDate() {
    return sharedPreferences.getString(AppConstant.DATE).toString();
  }

  String getTime() {
    return sharedPreferences.getString(AppConstant.TIME).toString();
  }

  Future<http.Response> getTablesList() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.TABLES),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getTableById(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.TABLES + '/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getTablesByRestaurantID(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.GET_TABLES_BY_RESID + id),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> updateStatusTable(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.put(
      Uri.parse(AppUrl.UPDATE_STATUS_TABLE + id),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getTableByDate(String date) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.GET_TABLE_BY_DATE + "?date=$date"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
