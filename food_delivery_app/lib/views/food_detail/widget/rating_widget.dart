import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingWidget extends StatefulWidget {
  final String image, name, date, comment;
  final num rating;
  final Function onTap, onPressed;
  const RatingWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.date,
    required this.comment,
    required this.rating,
    required this.onPressed,
    required this.onTap,
  }) : super(key: key);

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 16.0, right: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: Dimensions.heightPadding45,
                width: Dimensions.widthPadding40 + 10,
                margin: EdgeInsets.only(right: Dimensions.heightPadding20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.radius30 + 14),
                ),
              ),
              Expanded(
                child: BigText(
                  text: widget.name,
                ),
              ),
              IconButton(
                onPressed: widget.onPressed(),
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.heightPadding10,
          ),
          Row(
            children: [
              SmoothStarRating(
                isReadOnly: true,
                starCount: 5,
                rating: widget.rating.toDouble(),
                size: Dimensions.heightPadding30,
                color: AppColors.yellowColor,
                borderColor: AppColors.yellowColor,
              ),
              SizedBox(
                width: Dimensions.widthPadding10,
              ),
              SmallText(
                text: widget.date,
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.heightPadding10,
          ),
          GestureDetector(
            onTap: widget.onTap(),
            child: SmallText(text: widget.comment),
          ),
        ],
      ),
    );
  }
}
