import 'package:flutter/material.dart';

class StatTile extends StatelessWidget {
  const StatTile({super.key, required this.value, required this.label, required this.icon});

  final String value;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF496A81)),
            const SizedBox(height: 7),
            Text(value, style: Theme.of(context).textTheme.titleLarge),
            Text(label, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
