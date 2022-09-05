import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class CustomCheckBox extends StatelessWidget {
  final String text;
  const CustomCheckBox({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          width: 17.0,
          height: 17.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            gradient: const LinearGradient(
              begin: Alignment(5.65, -1.0),
              end: Alignment(-1.0, 1.94),
              colors: [Color(0xff00ad8f), Color(0xff7bf4df)],
            ),
          ),
          child: const Icon(Icons.check_box),
        ),
        const SizedBox(
          width: 16,
        ),
        SmallText(
          text: text,
          color: Colors.white,
        ),
      ],
    );
  }
}
