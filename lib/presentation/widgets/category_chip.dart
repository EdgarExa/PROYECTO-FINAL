import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({super.key, required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => onTap(),
        showCheckmark: false,
        selectedColor: const Color(0xFFDCE9E8),
        side: BorderSide.none,
        labelStyle: TextStyle(
          color: selected ? const Color(0xFF243247) : const Color(0xFF66758A),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
