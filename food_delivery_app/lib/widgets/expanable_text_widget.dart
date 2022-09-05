import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.height200;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight.toInt()) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt(), widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              color: AppColors.signColor,
              textOverflow: TextOverflow.visible,
            )
          : Column(
              children: [
                SmallText(
                  text: hiddenText
                      ? (firstHalf + '...')
                      : (firstHalf + secondHalf),
                  color: AppColors.signColor,
                  textOverflow: TextOverflow.visible,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddenText ? 'Hiển thị thêm' : 'Thu gọn',
                        color: AppColors.primaryBgColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.primaryBgColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
