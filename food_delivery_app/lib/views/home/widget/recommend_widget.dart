import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class RecommendWidget extends StatefulWidget {
  const RecommendWidget({Key? key}) : super(key: key);

  @override
  State<RecommendWidget> createState() => _RecommendWidgetState();
}

class _RecommendWidgetState extends State<RecommendWidget> {
  final List<String> recomments = [];
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
              const BigText(
                text: 'Gợi ý hôm nay',
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.widthPadding20,
        ),
        // Container(
        //   margin: EdgeInsets.only(
        //     left: Dimensions.widthPadding10,
        //     right: Dimensions.widthPadding10,
        //   ),
        //   height: Dimensions.heightPadding45 + 20,
        //   child: ListView.separated(
        //       physics: const BouncingScrollPhysics(),
        //       scrollDirection: Axis.horizontal,
        //       itemBuilder: (context, index) {
        //         return Column(
        //           children: [
        //             GestureDetector(
        //               onTap: () {},
        //               child: Container(
        //                 padding: EdgeInsets.all(Dimensions.widthPadding10),
        //                 decoration: BoxDecoration(
        //                   border: Border.all(color: Colors.black45),
        //                   borderRadius: BorderRadius.all(
        //                       Radius.circular(Dimensions.radius30)),
        //                   color: AppColors.signColor,
        //                   image: DecorationImage(
        //                     colorFilter: ColorFilter.mode(
        //                       Colors.black.withOpacity(0.55),
        //                       BlendMode.multiply,
        //                     ),
        //                     image: NetworkImage(
        //                       category.categories[index].image,
        //                     ),
        //                     fit: BoxFit.cover,
        //                   ),
        //                 ),
        //                 child: BigText(
        //                   text: category.categories[index].name,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             )
        //           ],
        //         );
        //       },
        //       separatorBuilder: (BuildContext context, int index) =>
        //           const VerticalDivider(
        //             color: Colors.transparent,
        //             width: 5,
        //           ),
        //       itemCount: category.categories.length),
        // ),
      ],
    );
  }
}
