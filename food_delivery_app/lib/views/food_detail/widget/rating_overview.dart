import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingOverview extends StatefulWidget {
  final num rating, numReviews;
  const RatingOverview({
    Key? key,
    required this.rating,
    required this.numReviews,
  }) : super(key: key);

  @override
  State<RatingOverview> createState() => _RatingOverviewState();
}

class _RatingOverviewState extends State<RatingOverview> {
  List<double> ratings = [0.1, 0.3, 0.5, 0.7, 0.9];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.widthPadding15,
        vertical: Dimensions.widthPadding15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        color: AppColors.primaryBgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.rating.toString(),
                      style: TextStyle(fontSize: Dimensions.font32 + 16),
                    ),
                    TextSpan(
                      text: "/5",
                      style: TextStyle(
                        fontSize: Dimensions.font24,
                        color: AppColors.pargColor,
                      ),
                    ),
                  ],
                ),
              ),
              SmoothStarRating(
                starCount: 5,
                rating: widget.rating.toDouble(),
                size: Dimensions.widthPadding30,
                color: AppColors.yellowColor,
                borderColor: AppColors.yellowColor,
              ),
              SizedBox(
                height: Dimensions.heightPadding15,
              ),
              SmallText(
                text: "${widget.numReviews} Đánh giá",
              ),
            ],
          ),
          SizedBox(
            width: Dimensions.height200,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SmallText(
                          text: "${index + 1}",
                        ),
                        SizedBox(
                          width: Dimensions.widthPadding5,
                        ),
                        const Icon(
                          Icons.star,
                          color: AppColors.yellowColor,
                        ),
                        SizedBox(
                          width: Dimensions.widthPadding10,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 6.0,
                          width: Dimensions.screenWidth / 3.4,
                          animation: true,
                          animationDuration: 2500,
                          percent: ratings[index],
                          progressColor: AppColors.yellowColor,
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
