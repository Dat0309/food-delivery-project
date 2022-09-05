import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/widget/button.dart';
import 'package:food_delivery_app/views/authentication/widget/text_field.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class AddCartBottomSheet extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController expiryMMController;
  final TextEditingController expiryYYController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  const AddCartBottomSheet({
    Key? key,
    required this.cardNumberController,
    required this.expiryMMController,
    required this.expiryYYController,
    required this.firstNameController,
    required this.lastNameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight * 0.7,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.heightPadding20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.clear_rounded,
                ),
              ),
            ],
          ),
          Row(
            children: const [
              BigText(
                text: 'Thêm Thẻ Tín Dụng/Thẻ Ngân Hàng',
                color: Colors.white,
              ),
            ],
          ),
          Divider(
            color: AppColors.pargColor!.withOpacity(0.5),
            thickness: 1.5,
            height: 40,
          ),
          TextFieldCustom(
            hint: 'Số thẻ',
            controller: cardNumberController,
            icon: Icons.numbers,
          ),
          SizedBox(
            height: Dimensions.heightPadding10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: Dimensions.screenHeight / 13,
                width: Dimensions.widthPadding100 + 50,
                child: TextFieldCustom(
                  controller: expiryMMController,
                  hint: 'MM',
                  icon: Icons.date_range,
                ),
              ),
              SizedBox(
                height: Dimensions.screenHeight / 13,
                width: Dimensions.widthPadding100 + 50,
                child: TextFieldCustom(
                  controller: expiryYYController,
                  hint: 'YY',
                  icon: Icons.date_range,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.heightPadding10,
          ),
          TextFieldCustom(
            hint: 'Họ',
            icon: Icons.text_fields,
            controller: firstNameController,
          ),
          SizedBox(
            height: Dimensions.heightPadding10,
          ),
          TextFieldCustom(
            hint: 'Tên',
            icon: Icons.text_fields,
            controller: lastNameController,
          ),
          SizedBox(
            height: Dimensions.heightPadding10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Dimensions.screenWidth * 0.4,
                child: const BigText(
                  text: 'Bạn có thể xoá thông tin thẻ bất kỳ lúc nào',
                  color: Colors.white,
                  textOverflow: TextOverflow.visible,
                ),
              ),
              Switch(
                value: false,
                onChanged: (_) {},
                thumbColor: MaterialStateProperty.all(
                  AppColors.secondaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.heightPadding30,
          ),
          SizedBox(
            height: 50,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const CustomButton(
                text: 'Thêm Thẻ',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
