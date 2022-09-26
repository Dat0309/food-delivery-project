import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/Restaurant.dart';

class PaymentBookingScreen extends StatefulWidget {
  final Restaurant restaurant;
  const PaymentBookingScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<PaymentBookingScreen> createState() => _PaymentBookingScreenState();
}

class _PaymentBookingScreenState extends State<PaymentBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
