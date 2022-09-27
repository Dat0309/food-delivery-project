import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/controller/table_controller.dart';
import 'package:food_delivery_app/models/TableModel.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class PaintChair extends StatefulWidget {
  final TableModel table;
  final Color? color;
  final String text;

  const PaintChair({
    Key? key,
    this.color = const Color(0xff4d525a),
    required this.text,
    required this.table,
  }) : super(key: key);

  @override
  State<PaintChair> createState() => _PaintChairState();
}

class _PaintChairState extends State<PaintChair> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableController>(builder: (tableController) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
          if (selected) {
            tableController.saveTable(widget.table);
          } else {
            tableController.clearTable();
          }
        },
        child: Column(
          children: [
            SmallText(
              text: '${widget.text} người',
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(
                right: Dimensions.widthPadding10,
                left: Dimensions.widthPadding10,
                bottom: Dimensions.heightPadding10,
              ),
              height: Dimensions.heightPadding30,
              width: Dimensions.widthPadding30,
              decoration: BoxDecoration(
                  color: selected ? AppColors.thirthColor : widget.color,
                  borderRadius: BorderRadius.circular(Dimensions.radius8)),
              child: CustomPaint(
                painter: _PainterChair(),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _PainterChair extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint()
      ..color = AppColors.mainBlackColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path();

    path.moveTo(0, size.height * .2);
    path.lineTo(size.width * .2, size.height * .3);
    path.lineTo(size.width * .2, size.height * .7);
    path.lineTo(size.width * .05, size.height);
    path.lineTo(size.width * .2, size.height * .7);
    path.lineTo(size.width * .8, size.height * .7);
    path.lineTo(size.width * .95, size.height);
    path.lineTo(size.width * .8, size.height * .7);
    path.lineTo(size.width * .8, size.height * .3);
    path.lineTo(size.width, size.height * .2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
