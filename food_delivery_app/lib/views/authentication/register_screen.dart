import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/auth_controller.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/models/User.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/login_screen.dart';
import 'package:food_delivery_app/views/authentication/widget/button.dart';
import 'package:food_delivery_app/views/authentication/widget/rich_text.dart';
import 'package:food_delivery_app/views/authentication/widget/text_field.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var phonenumberController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var provinceController = TextEditingController();
  var districtController = TextEditingController();
  var wardController = TextEditingController();
  var streetController = TextEditingController();

  // CameraPosition _cameraPosition = const CameraPosition(
  //     target: LatLng(11.939374494000166, 108.44515867239255), zoom: 17);
  // LatLng _initialPosition =
  //     const LatLng(11.939374494000166, 108.44515867239255);
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   if (Get.find<LocationController>().addressList.isNotEmpty) {
  //     _cameraPosition = CameraPosition(
  //         target: LatLng(
  //       double.parse(Get.find<LocationController>().getAddress['latitude']),
  //       double.parse(Get.find<LocationController>().getAddress['longitude']),
  //     ));

  //     _initialPosition = LatLng(
  //       double.parse(Get.find<LocationController>().getAddress['latitude']),
  //       double.parse(Get.find<LocationController>().getAddress['longitude']),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    List<String> avatarsUrl = [
      'https://res.cloudinary.com/devdaz/image/upload/v1664527171/4043272-avatar-lazybones-sloth-sluggard_113274_jwoy1u.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527171/4043273-animal-avatar-mutton-sheep_113242_cvfwtq.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527171/4043251-avatar-female-girl-woman_113291_uwiszh.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527170/4043250-avatar-child-girl-kid_113270_bggmhk.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527171/4043269-avatar-male-president-trump_113267_m8wab6.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527170/4043242-avatar-cacti-cactus-pirate_113248_rf7kre.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527171/4043254-avatar-elderly-grandma-nanny_113280_tj7yoe.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527170/4043263-avatar-muslim-paranja-woman_113263_kolkyv.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527170/4043234-animal-avatar-bear-russian_113283_fcg8fx.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527170/4043260-avatar-male-man-portrait_113269_zfbiig.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527170/4043233-anime-away-face-no-nobody-spirited_113254_srhybs.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527170/4043232-avatar-batman-comics-hero_113278_avq40o.png',
      'https://res.cloudinary.com/devdaz/image/upload/v1664527170/4043239-baby-child-kid-toddler_113286_jzuhnk.png',
    ];

    List<String> thumbs = [
      'https://res.cloudinary.com/devdaz/image/upload/v1664528110/wallpapersden.com_nature-sunset-near-mountain-river-artwork_1920x1080_qgijgr.jpg',
      'https://res.cloudinary.com/devdaz/image/upload/v1664528109/images_1_sxkpag.jpg',
      'https://res.cloudinary.com/devdaz/image/upload/v1664528109/e4d2fe20325524f5e1d3b84a11e20496_nhkdid.jpg',
      'https://res.cloudinary.com/devdaz/image/upload/v1664528109/images_cndod8.jpg'
    ];

    void register(
        AuthController controller, LocationController locationController) {
      User user = User(
          firstName: firstnameController.text,
          lastName: lastnameController.text,
          email: emailController.text,
          phoneNumber: phonenumberController.text,
          username: usernameController.text,
          password: passwordController.text,
          province: provinceController.text,
          district: districtController.text,
          ward: wardController.text,
          street: streetController.text,
          avatar: (avatarsUrl..shuffle()).first,
          thumb: (thumbs..shuffle()).first,
          latitude:
              Get.find<LocationController>().currentPos.latitude.toString(),
          longitude:
              Get.find<LocationController>().currentPos.longitude.toString(),
          role: 'guest');
      controller.register(user).then((value) {
        if (value['status']) {
          Get.off(() => const LoginScreen());
        } else {
          Get.snackbar(
            'Đăng ký thất bại',
            'Đã có lỗi sảy ra trong quá trình đăng ký',
            backgroundColor: AppColors.primaryColor,
            colorText: Colors.white,
          );
        }
      });
    }

    return GetBuilder<AuthController>(builder: (authController) {
      return GetBuilder<LocationController>(builder: (locationController) {
        locationController.loadingCurrentPos
            ? {
                provinceController.text =
                    locationController.signPlacemark.subAdministrativeArea!,
                districtController.text =
                    locationController.signPlacemark.locality!,
                wardController.text =
                    locationController.signPlacemark.thoroughfare!,
                streetController.text =
                    locationController.signPlacemark.street!,
              }
            : '';
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: SizedBox(
              width: Dimensions.screenWidth,
              height: Dimensions.screenHeight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.screenWidth * 0.06,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.heightPadding15,
                      ),
                      RichTextCustom(
                        fontSize: Dimensions.screenWidth / 15,
                        headerText: 'Đăng',
                        footerText: 'Ký',
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: Dimensions.heightPadding60 + 20,
                        width: Dimensions.widthPadding60 + 20,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding20,
                      ),
                      const BigText(
                        text: 'Thông tin người dùng',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding20,
                      ),
                      // Stack(
                      //   children: const [
                      //     ThumUpload(),
                      //     Positioned(
                      //       top: 50,
                      //       left: 0,
                      //       right: 0,
                      //       child: AvatarUpload(),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: Dimensions.heightPadding20,
                      // ),
                      TextFieldCustom(
                        hint: 'Họ',
                        icon: Icons.text_fields,
                        controller: lastnameController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Tên',
                        icon: Icons.text_fields,
                        controller: firstnameController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'email',
                        icon: Icons.email,
                        controller: emailController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Số điện thoại',
                        icon: Icons.phone,
                        controller: phonenumberController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding20,
                      ),
                      const BigText(
                        text: 'Thông tin đăng nhập',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding20,
                      ),
                      TextFieldCustom(
                        hint: 'Tên đăng nhập',
                        icon: Icons.text_fields,
                        controller: usernameController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Mật khẩu',
                        icon: Icons.lock,
                        controller: passwordController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding20,
                      ),
                      const BigText(
                        text: 'Thông tin địa chỉ',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding20,
                      ),
                      TextFieldCustom(
                        hint: 'Tỉnh',
                        icon: Icons.location_city,
                        controller: provinceController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Quận/Huyện/Thành Phố',
                        icon: Icons.location_city,
                        controller: districtController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Xã/Phường/Thị trấn',
                        icon: Icons.location_city,
                        controller: wardController,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      TextFieldCustom(
                        hint: 'Đường/Số nhà',
                        icon: Icons.location_city,
                        controller: streetController,
                      ),
                      // GetBuilder<LocationController>(
                      //     builder: (locationController) {
                      //   return Container(
                      //     height: Dimensions.height140,
                      //     width: Dimensions.screenWidth,
                      //     margin: EdgeInsets.only(
                      //       left: Dimensions.widthPadding5,
                      //       right: Dimensions.widthPadding5,
                      //       top: Dimensions.heightPadding8,
                      //     ),
                      //     decoration: BoxDecoration(
                      //       borderRadius:
                      //           BorderRadius.circular(Dimensions.radius8),
                      //       border: Border.all(
                      //         width: 2,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     child: Stack(
                      //       children: [
                      //         GoogleMap(
                      //           onTap: (latlng) {
                      //             Get.to(() => PickAddressMap(
                      //                   fromSignup: true,
                      //                   fromAddress: false,
                      //                   googleMapController:
                      //                       locationController.mapController,
                      //                 ));
                      //           },
                      //           initialCameraPosition: CameraPosition(
                      //               target: _initialPosition, zoom: 17),
                      //           zoomControlsEnabled: false,
                      //           compassEnabled: false,
                      //           indoorViewEnabled: true,
                      //           mapToolbarEnabled: false,
                      //           onCameraIdle: () {
                      //             locationController.updateSignPos(
                      //                 _cameraPosition, true);
                      //           },
                      //           onCameraMove: ((pos) => _cameraPosition = pos),
                      //           onMapCreated: (GoogleMapController controller) {
                      //             locationController
                      //                 .setMapController(controller);
                      //           },
                      //         ),
                      //       ],
                      //     ),
                      //   );
                      // }),
                      SizedBox(
                        height: Dimensions.heightPadding30,
                      ),
                      GestureDetector(
                        onTap: () {
                          register(authController, locationController);
                        },
                        child: const CustomButton(
                          text: 'Đăng ký',
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding15 + 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}
