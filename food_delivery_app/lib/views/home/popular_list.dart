import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constant.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class PopularList extends StatefulWidget {
  const PopularList({Key? key}) : super(key: key);

  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.widthPadding25,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: 'Thịnh hành',
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              Container(
                child: BigText(
                  text: '|',
                  color: AppColors.pargColor,
                ),
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              Container(
                child: SmallText(
                  text: 'Đồ ăn ngon',
                  color: AppColors.pargColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.heightPadding20,
        ),
        // list
        Container(
          height: Dimensions.height1000,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  left: Dimensions.widthPadding25,
                  right: Dimensions.widthPadding25,
                  bottom: Dimensions.heightPadding10,
                ),
                child: Row(
                  children: [
                    Container(
                      width: Dimensions.width140,
                      height: Dimensions.height140,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.pargColor,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/food1.jpg'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.height140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: AppColors.buttoBackgroundColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: Dimensions.widthPadding10,
                            right: Dimensions.widthPadding10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BigText(
                                text: 'Tên món ăn rất là dài',
                              ),
                              SmallText(
                                text: 'Mô tả của món ăn ở đây',
                                color: AppColors.pargColor,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndText(
                                    icon: Icons.circle_sharp,
                                    text: 'Bình thường',
                                    textColor: AppColors.signColor,
                                    iconColor: AppColors.primaryIconColor,
                                  ),
                                  IconAndText(
                                    icon: Icons.location_on,
                                    text: '1.7km',
                                    textColor: AppColors.signColor,
                                    iconColor: AppColors.secondaryIconColor,
                                  ),
                                  IconAndText(
                                    icon: Icons.access_time_rounded,
                                    text: '32\'',
                                    textColor: AppColors.signColor,
                                    iconColor: AppColors.secondaryIconColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
