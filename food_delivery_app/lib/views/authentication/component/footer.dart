import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class BuildFooter extends StatelessWidget {
  final Function function;
  const BuildFooter({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          function;
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
