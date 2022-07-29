import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/authentication/component/button.dart';
import 'package:food_delivery_app/views/authentication/component/check_box.dart';
import 'package:food_delivery_app/views/authentication/component/continues_text.dart';
import 'package:food_delivery_app/views/authentication/component/footer.dart';
import 'package:food_delivery_app/views/authentication/component/password_field.dart';
import 'package:food_delivery_app/views/authentication/component/rich_text.dart';
import 'package:food_delivery_app/views/authentication/component/signInGoogleFacebook.dart';
import 'package:food_delivery_app/views/authentication/component/text_field.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  register() {}
  @override
  Widget build(BuildContext context) {
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
                                  footerText: 'Nhập'),
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
                              const TextFieldCustom(
                                hint: 'Nhập địa chỉ Email',
                                icon: Icons.mail_rounded,
                              ),
                              SizedBox(
                                height: Dimensions.heightPadding10 - 2,
                              ),
                              const PasswordField(
                                suffixIcon: Icons.visibility,
                                hint: 'Nhập mật khẩu',
                                icon: Icons.lock,
                              ),
                              SizedBox(
                                height: Dimensions.heightPadding15 + 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CustomCheckBox(text: 'Nhớ tài khoản?'),
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
                              const CustomButton(
                                text: 'Đăng nhập',
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
                              BuildFooter(function: register()),
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
  }
}
