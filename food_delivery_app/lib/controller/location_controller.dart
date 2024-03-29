// ignore_for_file: unused_field, prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/models/AddressModel.dart';
import 'package:food_delivery_app/models/ResponseModel.dart';
import 'package:food_delivery_app/service/repository/location_repo.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;
  LocationController({required this.locationRepo});

  bool _loading = false;
  bool get loading => _loading;
  bool _loadingSignup = false;
  bool get loadingSignup => _loadingSignup;
  bool _updateAddressData = true;
  bool _updateSignUpData = true;
  bool _changeAddress = true;
  bool loadingCurrentPos = false;

  /*
   service zone
   */
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  /*
  whether the user is in service zone or not
   */
  bool _inZone = false;
  bool get inZone => _inZone;
  /*
   Showing and hiding the button as the map loads
   */
  bool _buttonDisabled = false;
  bool get buttonDisabled => _buttonDisabled;

  late Position _position;
  late Position _pickPosition;
  Position get pickPosition => _pickPosition;

  // late Position _signUpPosition;
  // late Position _pickSignUpPosition;
  // Position get pickSignUpPosition => _pickSignUpPosition;

  late Position currentPos;

  Placemark _placemark = Placemark();
  Placemark get placemark => _placemark;
  Placemark _signPlacemark = Placemark();
  Placemark get signPlacemark => _signPlacemark;

  Placemark _pickPlacemark = Placemark();
  Placemark get pickPlacemark => _pickPlacemark;
  Placemark _pickSignPlacemark = Placemark();
  Placemark get pickSignPlacemark => _pickSignPlacemark;

  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;

  late List<AddressModel> _allAddressList = [];
  List<String> addressTypeList = ['Nhà riêng', 'Cơ quan', 'Khác'];
  int _addressTypeIndex = 0;
  late Map<String, dynamic> _getAddress = {};
  Map get getAddress => _getAddress;

  String get addressDelivery => placemark.name ?? '';
  String get addressSignUp => signPlacemark.name ?? '';
  String currentAddress = '';

  late GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;
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

        ResponseModel _responseModel = await getZone(
          cameraPosition.target.latitude.toString(),
          cameraPosition.target.longitude.toString(),
          false,
        );

        _buttonDisabled = !_responseModel.isSuccess;

        if (_changeAddress) {
          Map<String, dynamic> result = await getAddressfromGeocode(LatLng(
              cameraPosition.target.latitude, cameraPosition.target.longitude));
          fromAddress
              ? _placemark = Placemark(name: result['address'])
              : _pickPlacemark = Placemark(name: result["address"]);
          update();
        }
      } catch (e) {
        rethrow;
      }

      _loading = false;
      update();
    } else {
      _updateAddressData = true;
    }
  }

  // void updateSignPos(CameraPosition cameraPosition, bool fromAddress) async {
  //   if (_updateSignUpData) {
  //     _loadingSignup = true;
  //     update();
  //     try {
  //       if (fromAddress) {
  //         _signUpPosition = Position(
  //             longitude: cameraPosition.target.longitude,
  //             latitude: cameraPosition.target.latitude,
  //             timestamp: DateTime.now(),
  //             accuracy: 1,
  //             altitude: 1,
  //             heading: 1,
  //             speed: 1,
  //             speedAccuracy: 1);
  //       } else {
  //         _pickSignUpPosition = Position(
  //             longitude: cameraPosition.target.longitude,
  //             latitude: cameraPosition.target.latitude,
  //             timestamp: DateTime.now(),
  //             accuracy: 1,
  //             altitude: 1,
  //             heading: 1,
  //             speed: 1,
  //             speedAccuracy: 1);
  //       }

  //       ResponseModel _responseModel = await getZone(
  //         cameraPosition.target.latitude.toString(),
  //         cameraPosition.target.longitude.toString(),
  //         false,
  //       );

  //       _buttonDisabled = !_responseModel.isSuccess;

  //       if (_changeAddress) {
  //         Map<String, dynamic> result = await getAddressfromGeocode(LatLng(
  //             cameraPosition.target.latitude, cameraPosition.target.longitude));
  //         fromAddress
  //             ? _signPlacemark = Placemark(name: result['address'])
  //             : _pickSignPlacemark = Placemark(name: result["address"]);
  //         update();
  //       }
  //     } catch (e) {
  //       rethrow;
  //     }

  //     _loadingSignup = false;
  //     update();
  //   } else {
  //     _updateSignUpData = true;
  //   }
  // }

  Future<Map<String, dynamic>> getAddressfromGeocode(LatLng latLng) async {
    Map<String, dynamic> result = {};
    String address = "Unknow address";
    double lat;
    double long;
    await locationRepo.getAddressfromGeocode(latLng).then((value) {
      if (value.statusCode == 200) {
        Map<String, dynamic> res = json.decode(value.body);
        address = res['location']['results'][0]['formatted_address'].toString();
        lat = res['location']['results'][0]['geometry']['location']['lat'];
        long = res['location']['results'][0]['geometry']['location']['lng'];

        result = {"address": address, "lat": lat, "long": long};
        _getAddress = result;
        print('your pick location is $result');
        update();
      } else {
        print('Error getting the google api');
      }
    });
    return result;
  }

  Future<ResponseModel> getZone(String lat, String lng, bool markerLoad) async {
    late ResponseModel _responseModel;
    if (markerLoad) {
      _loading = true;
    } else {
      _isLoading = true;
    }
    update();
    await Future.delayed(const Duration(seconds: 2), () {
      _responseModel = ResponseModel(true, "success");
      if (markerLoad) {
        _loading = true;
      } else {
        _isLoading = true;
      }
    });

    return _responseModel;
  }

  // AddressModel getUserAddress() {
  //   late AddressModel _addressModel;
  //   _getAddress = jsonDecode(addressDelivery);
  //   try {
  //     _addressModel = AddressModel.fromJson(jsonDecode(addressDelivery));
  //   } catch (e) {
  //     rethrow;
  //   }
  //   return _addressModel;
  // }

  void setAddressTypesIndex(int index) {
    _addressTypeIndex = index;
    update();
  }

  void setAddAddressData() {
    _position = _pickPosition;
    _placemark = _pickPlacemark;
    _updateAddressData = false;
    update();
  }

  // void setSignAddressData() {
  //   _signUpPosition = _pickSignUpPosition;
  //   _signPlacemark = _pickSignPlacemark;
  //   _updateSignUpData = false;
  //   update();
  // }

  Future<void> getLocationFromAddress(String address) async {
    if (address.isNotEmpty) {
      try {
        List<Location> location = await locationFromAddress(address);
        print(location[0].latitude);
        update();
      } catch (e) {
        print(e);
      }
    }
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        'Permission Denied',
        'Cho phép quyền truy cập vị trí trên thiết bị để tiếp tục',
        backgroundColor: AppColors.primaryColor,
        colorText: Colors.white,
      );
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Get.snackbar(
          'Permission Denied',
          'Quyền truy cập vị trí bị từ chối',
          backgroundColor: AppColors.primaryColor,
          colorText: Colors.white,
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        'Permission Denied',
        'Chúng tôi không thể kích hoạt quyền truy cập vị trí trên thiết bị cua bạn',
        backgroundColor: AppColors.primaryColor,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  Future<void> getCurrentPos() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position pos) {
      currentPos = pos;
      getAddressFromLatlng(pos);
      loadingCurrentPos = true;
    }).catchError((e) {
      debugPrint(e);
    });
    update();
  }

  Future<void> getAddressFromLatlng(Position pos) async {
    await placemarkFromCoordinates(currentPos.latitude, currentPos.longitude)
        .then((List<Placemark> placeMarks) {
      _signPlacemark = placeMarks[0];
      _placemark = placeMarks[0];
    }).catchError((e) {
      debugPrint(e);
    });
    update();
  }
}
