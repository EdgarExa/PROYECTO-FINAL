import 'package:flutter/material.dart';

class FeaturedBanner extends StatelessWidget {
  const FeaturedBanner({super.key, required this.onExplore});

  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFFE4ECEF), Color(0xFFDCE9E8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('MEGA · CATÁLOGO', style: TextStyle(letterSpacing: 1.5, fontSize: 11, fontWeight: FontWeight.w800, color: Color(0xFF496A81))),
          const SizedBox(height: 10),
          Text('Encuentra algo\\nque te guste.', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          const Text('Productos para tu día a día, en un solo lugar.', style: TextStyle(color: Color(0xFF526678))),
          const SizedBox(height: 15),
          FilledButton.icon(
            onPressed: onExplore,
            icon: const Icon(Icons.arrow_forward_rounded),
            label: const Text('Explorar catálogo'),
          ),
        ],
      ),
    );
  }
}
