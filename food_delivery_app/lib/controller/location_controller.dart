// ignore_for_file: unused_field, prefer_final_fields

import 'dart:convert';

import 'package:food_delivery_app/models/AddressModel.dart';
import 'package:food_delivery_app/service/repository/location_repo.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;
  LocationController({required this.locationRepo});

  bool _loading = false;
  bool _updateAddressData = true;
  bool _changeAddress = true;
  late Position _position;
  late Position _pickPosition;

  Placemark _placemark = Placemark();
  Placemark get placemark => _placemark;

  Placemark _pickPlacemark = Placemark();
  Placemark get pickPlacemark => _pickPlacemark;

  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;

  late List<AddressModel> _allAddressList = [];
  List<String> addressTypeList = ['Nhà riêng', 'Cơ quan', 'Khác'];
  int _addressTypeIndex = 0;
  late Map<String, dynamic> _getAddress;
  Map get getAddress => _getAddress;

  String get addressDelivery => placemark.name ?? '';

  late GoogleMapController _mapController;
  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  void updatePos(CameraPosition cameraPosition, bool fromAddress) async {
    if (_updateAddressData) {
      _loading = true;
      update();
      try {
        if (fromAddress) {
          _position = Position(
              longitude: cameraPosition.target.longitude,
              latitude: cameraPosition.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        } else {
          _pickPosition = Position(
              longitude: cameraPosition.target.longitude,
              latitude: cameraPosition.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        }

        if (_changeAddress) {
          String _address = await getAddressfromGeocode(LatLng(
              cameraPosition.target.latitude, cameraPosition.target.longitude));
          fromAddress
              ? _placemark = Placemark(name: _address)
              : _pickPlacemark = Placemark(name: _address);
          update();
        }
      } catch (e) {
        print('error $e');
      }
    }
  }

  Future<String> getAddressfromGeocode(LatLng latLng) async {
    String _address = "Unknow location found";
    await locationRepo.getAddressfromGeocode(latLng).then((value) {
      if (value.statusCode == 200) {
        Map<String, dynamic> res = json.decode(value.body);
        _address =
            res['location']['results'][0]['formatted_address'].toString();
        print('your pick location is $_address');
        update();
      } else {
        print('Error getting the google api');
      }
    });
    return _address;
  }
}
