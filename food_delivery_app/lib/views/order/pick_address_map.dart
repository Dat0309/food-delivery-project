import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/register_screen.dart';
import 'package:food_delivery_app/views/authentication/widget/button.dart';
import 'package:food_delivery_app/views/order/change_address_screen.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromSignup;
  final bool fromAddress;
  final GoogleMapController? googleMapController;

  const PickAddressMap({
    Key? key,
    required this.fromSignup,
    required this.fromAddress,
    this.googleMapController,
  }) : super(key: key);

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late LatLng _initialPosition;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<LocationController>().addressDelivery == null) {
      _initialPosition = const LatLng(11.954310889146619, 108.44416023266137);
      _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
    } else if (Get.find<LocationController>().addressSignUp == null) {
      _initialPosition = const LatLng(11.954310889146619, 108.44416023266137);
      _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
    } else if (Get.find<LocationController>().getAddress['lat'] == null) {
      _initialPosition = const LatLng(11.954310889146619, 108.44416023266137);
      _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
    } else {
      _initialPosition = LatLng(
          Get.find<LocationController>().getAddress['lat'],
          Get.find<LocationController>().getAddress['long']);
      _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _initialPosition,
                      zoom: 17,
                    ),
                    zoomControlsEnabled: false,
                    onCameraMove: (CameraPosition cameraPosition) {
                      _cameraPosition = cameraPosition;
                    },
                    onCameraIdle: () {
                      Get.find<LocationController>()
                          .updatePos(_cameraPosition, false);
                    },
                  ),
                  Center(
                    child: !locationController.loading
                        ? Image.asset(
                            "assets/images/marker.png",
                            height: Dimensions.heightPadding60,
                            width: Dimensions.widthPadding60,
                          )
                        : const CircularProgressIndicator(),
                  ),
                  Positioned(
                    top: Dimensions.heightPadding20,
                    left: Dimensions.widthPadding20,
                    right: Dimensions.widthPadding20,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const AppIcon(
                            icon: Icons.arrow_back_ios,
                            iconColor: Colors.white,
                            backgroundColor: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: Dimensions.widthPadding10),
                        const BigText(text: 'Thay Đổi Địa Chỉ'),
                      ],
                    ),
                  ),
                  Positioned(
                    top: Dimensions.heightPadding60,
                    left: Dimensions.widthPadding20,
                    right: Dimensions.widthPadding20,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.widthPadding10),
                      height: Dimensions.heightPadding60,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: Dimensions.iconSize24,
                            color: AppColors.thirthColor,
                          ),
                          Expanded(
                            child: Text(
                              locationController.pickPlacemark.name ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Dimensions.height120 - 50,
                    left: Dimensions.widthPadding20,
                    right: Dimensions.widthPadding20,
                    child: GestureDetector(
                      onTap: () {
                        if (locationController.pickPosition.latitude != 0 &&
                            locationController.pickPlacemark.name != null) {
                          if (widget.fromAddress) {
                            if (widget.googleMapController != null) {
                              widget.googleMapController!.moveCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: LatLng(
                                      locationController.pickPosition.latitude,
                                      locationController.pickPosition.longitude,
                                    ),
                                  ),
                                ),
                              );
                              locationController.setAddAddressData();
                            }
                            Get.off(() => const ChangeAddressScreen());
                          } else if (widget.fromSignup) {
                            if (widget.googleMapController != null) {
                              widget.googleMapController!.moveCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: LatLng(
                                      locationController
                                          .pickSignUpPosition.latitude,
                                      locationController
                                          .pickSignUpPosition.longitude,
                                    ),
                                  ),
                                ),
                              );
                              locationController.setSignAddressData();
                            }
                            Get.off(() => const RegisterScreen());
                          }
                        }
                      },
                      child: const CustomButton(
                        text: 'Chọn địa chỉ',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
