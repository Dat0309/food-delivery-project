import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/widget/button.dart';
import 'package:food_delivery_app/views/authentication/widget/text_field.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({Key? key}) : super(key: key);

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  var nameController = TextEditingController();
  var phoneNumber = TextEditingController();
  var provinceController = TextEditingController();
  var districtController = TextEditingController();
  var wardController = TextEditingController();
  var streetController = TextEditingController();
  CameraPosition _cameraPosition = const CameraPosition(
      target: LatLng(11.939374494000166, 108.44515867239255), zoom: 17);
  LatLng _initialPosition =
      const LatLng(11.939374494000166, 108.44515867239255);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(
          target: LatLng(
        double.parse(Get.find<LocationController>().getAddress['latitude']),
        double.parse(Get.find<LocationController>().getAddress['longitude']),
      ));

      _initialPosition = LatLng(
        double.parse(Get.find<LocationController>().getAddress['latitude']),
        double.parse(Get.find<LocationController>().getAddress['longitude']),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = Get.find<UserController>().getName;
    phoneNumber.text = Get.find<UserController>().getPhone;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.heightPadding60 + 5,
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
            top: Dimensions.heightPadding20 * 7,
            left: Dimensions.widthPadding20,
            right: Dimensions.widthPadding20,
            bottom: 0,
            child: SizedBox(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: GetBuilder<LocationController>(
                    builder: (locationController) {
                  if (locationController.placemark.name != null) {
                    provinceController.text =
                        locationController.placemark.name!.split(',')[4];
                    districtController.text =
                        locationController.placemark.name!.split(',')[3];
                    wardController.text =
                        locationController.placemark.name!.split(',')[2];
                    streetController.text =
                        '${locationController.placemark.name!.split(',')[0]}, ${locationController.placemark.name!.split(',')[1]}';
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Dimensions.height140,
                        width: Dimensions.screenWidth,
                        margin: EdgeInsets.only(
                          left: Dimensions.widthPadding5,
                          right: Dimensions.widthPadding5,
                          top: Dimensions.heightPadding8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 2,
                            color: AppColors.primaryColor!,
                          ),
                        ),
                        child: Stack(
                          children: [
                            GoogleMap(
                              initialCameraPosition: CameraPosition(
                                  target: _initialPosition, zoom: 17),
                              zoomControlsEnabled: false,
                              compassEnabled: false,
                              indoorViewEnabled: true,
                              mapToolbarEnabled: false,
                              onCameraIdle: () {
                                locationController.updatePos(
                                    _cameraPosition, true);
                              },
                              onCameraMove: ((pos) => _cameraPosition = pos),
                              onMapCreated: (GoogleMapController controller) {
                                locationController.setMapController(controller);
                              },
                            ),
                          ],
                        ),
                      ),
                      const BigText(
                        text: 'Liên hệ',
                        color: AppColors.pargColor,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Họ và Tên',
                        icon: Icons.text_fields,
                        controller: nameController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Số điện thoại',
                        icon: Icons.phone_android,
                        controller: phoneNumber,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding20,
                      ),
                      const BigText(
                        text: 'Địa chỉ',
                        color: AppColors.pargColor,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Tỉnh/Thành phố ',
                        icon: Icons.location_city,
                        controller: provinceController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Quận/Huyện',
                        icon: Icons.location_city,
                        controller: districtController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Phường/Xã',
                        icon: Icons.location_city,
                        controller: wardController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Tên đường, Toà nhà, Số nhà',
                        icon: Icons.location_city,
                        controller: streetController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding60,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.find<UserController>().updateAddress(
                                phoneNumber.text,
                                nameController.text,
                                provinceController.text,
                                districtController.text,
                                wardController.text,
                                streetController.text);
                            Get.back();
                          },
                          child: const CustomButton(text: 'Hoàn Thành')),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
