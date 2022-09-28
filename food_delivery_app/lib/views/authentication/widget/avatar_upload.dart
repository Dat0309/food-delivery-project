import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class AvatarUpload extends StatefulWidget {
  const AvatarUpload({Key? key}) : super(key: key);

  @override
  State<AvatarUpload> createState() => _AvatarUploadState();
}

class _AvatarUploadState extends State<AvatarUpload> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: CircleAvatar(
                radius: Dimensions.screenWidth * 0.14,
                backgroundColor: Colors.grey[400]!.withOpacity(0.4),
                child: Icon(
                  Icons.location_history,
                  color: Colors.white,
                  size: Dimensions.screenWidth * 0.1,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: Dimensions.screenHeight * 0.08,
          left: Dimensions.screenWidth * 0.49,
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
