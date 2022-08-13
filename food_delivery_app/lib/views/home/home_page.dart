import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/home/home.dart';
import 'package:food_delivery_app/views/order/order_history.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  List pages = [
    const Home(),
    const Center(
      child: Text("Page 2"),
    ),
    const OrderHistory(),
    const Center(
      child: Text("Page 4"),
    ),
  ];

  List<String> listOfStrings = [
    'Trang chủ',
    'Yêu thích',
    'Lịch sử',
    'Tài khoản',
  ];

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.shopping_bag,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(Dimensions.screenWidth * .05),
        height: Dimensions.screenWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.screenWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? Dimensions.screenWidth * .32
                      : Dimensions.screenWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex
                        ? Dimensions.screenWidth * .12
                        : 0,
                    width: index == currentIndex
                        ? Dimensions.screenWidth * .32
                        : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? AppColors.primaryBgColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? Dimensions.screenWidth * .31
                      : Dimensions.screenWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex
                                ? Dimensions.screenWidth * .13
                                : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: index == currentIndex
                                ? SmallText(
                                    text: listOfStrings[index],
                                    color: AppColors.primaryColor,
                                  )
                                : const SmallText(text: ''),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex
                                ? Dimensions.screenWidth * .03
                                : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: Dimensions.screenWidth * .076,
                            color: index == currentIndex
                                ? AppColors.primaryColor
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
