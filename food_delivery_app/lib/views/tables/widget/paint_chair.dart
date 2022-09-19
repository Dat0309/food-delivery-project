import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class PaintChair extends StatelessWidget {
  final Color? color;

  const PaintChair({
    Key? key,
    this.color = const Color(0xff4d525a),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: Dimensions.widthPadding10,
        left: Dimensions.widthPadding10,
        bottom: Dimensions.heightPadding20,
      ),
      height: Dimensions.heightPadding30,
      width: Dimensions.widthPadding30,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Dimensions.radius8)),
      child: CustomPaint(
        painter: _PainterChair(),
      ),
    );
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
    path.lineTo(size.width * .2, size.height * .25);
    path.lineTo(size.width * .2, size.height * .7);
    path.lineTo(size.width * .1, size.height);
    path.lineTo(size.width * .2, size.height * .7);
    path.lineTo(size.width * .8, size.height * .7);
    path.lineTo(size.width * .95, size.height);
    path.lineTo(size.width * .8, size.height * .7);
    path.lineTo(size.width * .8, size.height * .25);
    path.lineTo(size.width, size.height * .2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
