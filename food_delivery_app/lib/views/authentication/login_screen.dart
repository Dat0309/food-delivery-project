import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/auth_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/widget/button.dart';
import 'package:food_delivery_app/views/authentication/widget/check_box.dart';
import 'package:food_delivery_app/views/authentication/widget/continues_text.dart';
import 'package:food_delivery_app/views/authentication/widget/footer.dart';
import 'package:food_delivery_app/views/authentication/widget/password_field.dart';
import 'package:food_delivery_app/views/authentication/widget/rich_text.dart';
import 'package:food_delivery_app/views/authentication/widget/signInGoogleFacebook.dart';
import 'package:food_delivery_app/views/authentication/widget/text_field.dart';
import 'package:food_delivery_app/views/home/home_page.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();

    void login(AuthController authController) {
      authController
          .login(usernameController.text, passwordController.text)
          .then((value) {
        if (value['status']) {
          Get.to(() => const HomePage());
        } else {
          Get.snackbar(
            'Đăng nhập thất bại',
            'Đã có lỗi sảy ra trong quá trình đăng nhập',
            backgroundColor: AppColors.primaryColor,
            colorText: Colors.white,
          );
        }
      });
    }

    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SizedBox(
            height: Dimensions.screenHeight,
            child: Stack(
              children: <Widget>[
                //content ui
                Positioned(
                  top: 8.0,
                  child: SizedBox(
                    width: Dimensions.screenWidth,
                    height: Dimensions.screenHeight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.screenWidth * 0.06),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //logo section
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Dimensions.heightPadding15 + 1,
                                ),
                                RichTextCustom(
                                  fontSize: Dimensions.screenWidth / 15,
                                  headerText: 'Đăng',
                                  footerText: 'Nhập',
                                ),
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: 80,
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                          //continue with email for sign in app text
                          const Expanded(
                            flex: 1,
                            child: BigText(
                              text: 'Đăng nhập hoặc Đăng ký để tiếp tục',
                              color: Colors.white,
                            ),
                          ),
                          //email and password TextField here
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                TextFieldCustom(
                                  hint: 'Nhập tên đăng nhập',
                                  icon: Icons.mail_rounded,
                                  controller: usernameController,
                                ),
                                SizedBox(
                                  height: Dimensions.heightPadding10 - 2,
                                ),
                                PasswordField(
                                  suffixIcon: Icons.visibility,
                                  hint: 'Nhập mật khẩu',
                                  icon: Icons.lock,
                                  controller: passwordController,
                                ),
                                SizedBox(
                                  height: Dimensions.heightPadding15 + 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CustomCheckBox(
                                        text: 'Nhớ tài khoản?'),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const SmallText(
                                        text: 'Quên mật khẩu?',
                                        color: AppColors.thirthColor,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //sign in button & continue with text here
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    login(authController);
                                  },
                                  child: const CustomButton(
                                    text: 'Đăng nhập',
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.heightPadding15 + 1,
                                ),
                                const ContinuesText(),
                              ],
                            ),
                          ),
                          //footer section. google, facebook button and sign up text here
                          Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SignInGGFB(),
                                SizedBox(
                                  height: Dimensions.heightPadding15 + 1,
                                ),
                                BuildFooter(function: () {}),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
