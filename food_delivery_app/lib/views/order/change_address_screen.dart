import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/controller/user_controller.dart';
import 'package:food_delivery_app/service/preferences/user_preferences.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/component/button.dart';
import 'package:food_delivery_app/views/authentication/component/text_field.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({Key? key}) : super(key: key);

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneNumber = TextEditingController();
    var provinceController = TextEditingController();
    var districtController = TextEditingController();
    var wardController = TextEditingController();
    var streetController = TextEditingController();

    nameController.text = Get.find<UserController>().getName;
    phoneNumber.text = Get.find<UserController>().getPhone;
    provinceController.text = Get.find<UserController>().getProvince;
    districtController.text = Get.find<UserController>().getDistrict;
    wardController.text = Get.find<UserController>().getWard;
    streetController.text = Get.find<UserController>().getStreet;

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
