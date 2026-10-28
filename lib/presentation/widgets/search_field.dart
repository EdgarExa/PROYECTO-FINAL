import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onChanged, this.initialValue = ''});

  final ValueChanged<String> onChanged;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Buscar productos o categorías',
        prefixIcon: Icon(Icons.search_rounded),
      ),
    );
  }
}
