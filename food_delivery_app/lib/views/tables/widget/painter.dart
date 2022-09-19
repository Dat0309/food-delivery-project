import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class PainterDoor extends StatelessWidget {
  const PainterDoor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.heightPadding60,
      width: Dimensions.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.radius50),
      child: CustomPaint(
        painter: _ScreenPainter(),
      ),
    );
  }
}

class _ScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final path = Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.5, 0, size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
