import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/categories_controller.dart';
import 'package:food_delivery_app/controller/restaurant_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/views/home/restaurant_list_tile.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class WidgetCategories extends StatefulWidget {
  const WidgetCategories({Key? key}) : super(key: key);

  @override
  State<WidgetCategories> createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<CategoriesController>(builder: (category) {
          return category.isLoaded
              ? Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.widthPadding10,
                    right: Dimensions.widthPadding10,
                  ),
                  height: 45,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding:
                                    EdgeInsets.all(Dimensions.widthPadding10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.radius30)),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.55),
                                      BlendMode.multiply,
                                    ),
                                    image: NetworkImage(
                                      category.categories[index].image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: BigText(
                                  text: category.categories[index].name,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const VerticalDivider(
                            color: Colors.transparent,
                            width: 5,
                          ),
                      itemCount: 10),
                )
              : CircularProgressIndicator();
        }),
      ],
    );
  }
}
