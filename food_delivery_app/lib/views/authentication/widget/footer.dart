import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/register_screen.dart';
import 'package:get/get.dart';

class BuildFooter extends StatelessWidget {
  const BuildFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Get.to(() => const RegisterScreen());
        },
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: Dimensions.font24 - 4,
              color: Colors.white,
            ),
            children: const [
              TextSpan(
                text: 'Chưa có tài khoản? ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'Đăng ký',
                style: TextStyle(
                  color: AppColors.thirthColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
