import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  const RatingBadge({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(color: const Color(0xFFFFF4D9), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, size: 16, color: Color(0xFFB98218)),
          const SizedBox(width: 3),
          Text(rating.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
        ],
      ),
    );
  }
}
