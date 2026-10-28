import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  const PriceLabel({super.key, required this.price, this.large = false});

  final double price;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)} MXN',
      style: TextStyle(
        fontSize: large ? 23 : 15,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF496A81),
      ),
    );
  }
}
