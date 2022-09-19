import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/colors.dart';
import 'package:food_delivery_app/views/tables/widget/paint_chair.dart';

class SaetRow extends StatelessWidget {
  final int numSeats;
  final List<int> freeSeats;
  final String rowSeats;

  const SaetRow({
    Key? key,
    required this.numSeats,
    required this.freeSeats,
    required this.rowSeats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          numSeats,
          (index) {
            if (freeSeats.contains(index + 1)) {
              return InkWell(
                onTap: () {},
                child: const PaintChair(
                  color: AppColors.secondaryColor,
                ),
              );
            }
            return const PaintChair();
          },
        ),
      ),
    );
  }
}
