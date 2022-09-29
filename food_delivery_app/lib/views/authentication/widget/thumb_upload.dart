import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class ThumUpload extends StatefulWidget {
  const ThumUpload({Key? key}) : super(key: key);

  @override
  State<ThumUpload> createState() => _ThumUploadState();
}

class _ThumUploadState extends State<ThumUpload> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: Dimensions.height200,
            width: Dimensions.screenWidth,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(
                Dimensions.radius15,
              ),
              color: Colors.grey[400]!.withOpacity(0.4),
            ),
            child: Container()),
        Positioned(
          top: Dimensions.screenHeight * 0.15,
          left: Dimensions.screenWidth * 0.76,
          child: Container(
            height: Dimensions.screenWidth * 0.1,
            width: Dimensions.screenWidth * 0.1,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.white, width: Dimensions.widthPadding5 - 3),
            ),
            child: const Icon(
              Icons.photo_camera_front_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
